[CmdletBinding()]
param([string]$NodePath,[string]$CodexPath)
$ErrorActionPreference='Stop'
$TaskStage=Join-Path $env:TEMP ('trombino-premiere-1.3.0-'+[guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $TaskStage | Out-Null
function DownloadVerified([string]$Url,[string]$File,[string]$Hash){
 Invoke-WebRequest -Uri $Url -OutFile $File -UseBasicParsing
 if((Get-FileHash -LiteralPath $File -Algorithm SHA256).Hash.ToLowerInvariant() -ne $Hash){throw "SHA256 divergente: $File. Nao executar."}
}
if(-not $CodexPath){$cmd=Get-Command codex -ErrorAction SilentlyContinue;if($cmd){$CodexPath=$cmd.Source}}
if(-not $CodexPath){throw 'Codex CLI nao localizado. O agente deve localizar o executavel do aplicativo Codex e repetir com -CodexPath; nao instalar outro cliente.'}
if(-not $NodePath){$cmd=Get-Command node -ErrorAction SilentlyContinue;if($cmd){$NodePath=$cmd.Source}}
if(-not $NodePath){
 $Arch=if([Runtime.InteropServices.RuntimeInformation]::OSArchitecture -eq 'Arm64'){'arm64'}else{'x64'}
 $Hashes=@{x64='158f7685b44de51f6c0df1d153526cbcd3e1bc739a8dfc607721cef75de9e541';arm64='8779b1bde1d39f8d420e3b57aa657b39891af434d3de44a919044cec06785921'}
 $Name="node-v24.21.0-win-$Arch";$Zip=Join-Path $TaskStage 'node.zip'
 DownloadVerified "https://nodejs.org/dist/v24.21.0/$Name.zip" $Zip $Hashes[$Arch]
 Expand-Archive -LiteralPath $Zip -DestinationPath $TaskStage
 $NodePath=Join-Path $TaskStage "$Name/node.exe"
}
$Bundle=Join-Path $TaskStage 'setup.zip'
DownloadVerified 'https://raw.githubusercontent.com/CriativosdoFuturo/trombino-kit-edicao-ia/main/premiere-setup-1.3.0.zip' $Bundle 'e964d341299017da181e6655cea8c541575359d8da80dc3c650bab73321b571a'
$Extract=Join-Path $TaskStage 'setup';Expand-Archive -LiteralPath $Bundle -DestinationPath $Extract
& $NodePath (Join-Path $Extract 'install.mjs') --codex $CodexPath
if($LASTEXITCODE -ne 0){throw 'A instalacao informou uma pendencia. Preserve a mensagem e diagnostique; nao repita em loop.'}
$Root=Join-Path $env:LOCALAPPDATA 'CriativosdoFuturo/PremiereMCP'
if(Test-Path -LiteralPath (Join-Path $Root 'installation.json')){
 & (Join-Path $Root 'runtime/node.exe') (Join-Path $Root 'doctor.mjs')
 if($LASTEXITCODE -ne 0){throw 'Dependencias ainda nao estao prontas.'}
 & (Join-Path $Root 'runtime/node.exe') (Join-Path $Root 'connection.mjs') --connect
 if($LASTEXITCODE -ne 0){Write-Host 'Instalado; falta confirmar o painel no Premiere. Leia readiness.json. Nao altere a timeline.';exit 2}
}
