[CmdletBinding()]
param([string]$NodePath,[string]$CodexPath,[string]$Root,[string]$StageRoot)
$ErrorActionPreference='Stop'
$TaskIdentity=[Security.Principal.WindowsIdentity]::GetCurrent().Name
if(($TaskIdentity.Split('\')[-1]) -match '(?i)^codexsandbox'){throw 'RESTRICTED_EXECUTION: execute na conta do usuario do Premiere pelo mecanismo autorizado do cliente ou manualmente. Nenhum download ou instalacao iniciado.'}

if(-not $Root){$Root=Join-Path $env:LOCALAPPDATA 'CriativosdoFuturo/PremiereMCP'}
if(-not $StageRoot){$StageRoot=$env:TEMP}
$TaskStageDrive=Get-PSDrive -Name ([IO.Path]::GetPathRoot($StageRoot).TrimEnd('\').TrimEnd(':'))
if($null -eq $TaskStageDrive.Free -or $TaskStageDrive.Free -lt 512MB){throw 'INSUFFICIENT_STAGE_SPACE: selecione -StageRoot em um disco com pelo menos 512 MB livres. Nao apague arquivos automaticamente.'}
$TaskStage=Join-Path $StageRoot ('trombino-premiere-1.3.3-'+[guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TaskStage | Out-Null
function DownloadVerified([string]$Url,[string]$File,[string]$Hash){
 Invoke-WebRequest -Uri $Url -OutFile $File -UseBasicParsing
 if((Get-FileHash -LiteralPath $File -Algorithm SHA256).Hash.ToLowerInvariant() -ne $Hash){throw "SHA256 divergente: $File. Nao executar."}
}
if(-not $CodexPath){$cmd=Get-Command codex -ErrorAction SilentlyContinue;if($cmd){$CodexPath=$cmd.Source}}
if(-not $CodexPath){
 $TaskCodexBins=Join-Path $env:LOCALAPPDATA 'OpenAI/Codex/bin'
 if(Test-Path -LiteralPath $TaskCodexBins){
  $TaskCodexCandidate=Get-ChildItem -LiteralPath $TaskCodexBins -Filter codex.exe -Recurse -File | Sort-Object LastWriteTime -Descending | Select-Object -First 1
  if($TaskCodexCandidate){$CodexPath=$TaskCodexCandidate.FullName}
 }
}
if(-not $CodexPath){throw 'Codex CLI nao localizado. O agente deve localizar o executavel do aplicativo Codex e repetir com -CodexPath; nao instalar outro cliente.'}
if(-not $NodePath){$cmd=Get-Command node -ErrorAction SilentlyContinue;if($cmd){$NodePath=$cmd.Source}}
if($NodePath){
 & $NodePath --input-type=module -e "import tls from 'node:tls'; process.exit(typeof tls.getCACertificates==='function' && typeof tls.setDefaultCACertificates==='function' ? 0 : 1)"
 if($LASTEXITCODE -ne 0){$NodePath=$null}
}
if(-not $NodePath){
 $Arch=if([Runtime.InteropServices.RuntimeInformation]::OSArchitecture -eq 'Arm64'){'arm64'}else{'x64'}
 $Hashes=@{x64='158f7685b44de51f6c0df1d153526cbcd3e1bc739a8dfc607721cef75de9e541';arm64='8779b1bde1d39f8d420e3b57aa657b39891af434d3de44a919044cec06785921'}
 $Name="node-v24.21.0-win-$Arch";$Zip=Join-Path $TaskStage 'node.zip'
 DownloadVerified "https://nodejs.org/dist/v24.21.0/$Name.zip" $Zip $Hashes[$Arch]
 Expand-Archive -LiteralPath $Zip -DestinationPath $TaskStage
 $NodePath=Join-Path $TaskStage "$Name/node.exe"
}
$Bundle=Join-Path $TaskStage 'setup.zip'
DownloadVerified 'https://raw.githubusercontent.com/CriativosdoFuturo/trombino-kit-edicao-ia/main/premiere-setup-1.3.3.zip' $Bundle '5170b2ffd621e1200508a18f59e0c697570062e5c3fb939f269b36732f7e05cc'
$Extract=Join-Path $TaskStage 'setup';Expand-Archive -LiteralPath $Bundle -DestinationPath $Extract
& $NodePath (Join-Path $Extract 'install.mjs') --root $Root --codex $CodexPath
if($LASTEXITCODE -ne 0){throw 'A instalacao informou uma pendencia. Preserve a mensagem e diagnostique; nao repita em loop.'}
if(Test-Path -LiteralPath (Join-Path $Root 'installation.json')){
 & (Join-Path $Root 'runtime/node.exe') (Join-Path $Root 'doctor.mjs')
 if($LASTEXITCODE -ne 0){throw 'Dependencias ainda nao estao prontas.'}
 & (Join-Path $Root 'runtime/node.exe') (Join-Path $Root 'connection.mjs') --connect
 if($LASTEXITCODE -ne 0){Write-Host 'Instalado; falta confirmar o painel no Premiere. Leia readiness.json. Nao altere a timeline.';exit 2}
}
