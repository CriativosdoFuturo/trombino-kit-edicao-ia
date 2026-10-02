# Preparar o Premiere para editar com o Codex

Este é o endereço único do Premiere no curso Trombino / Criativos do Futuro. Cole este link no **Codex instalado no mesmo computador do Premiere** e peça: **“Prepare para eu usar.”** O agente conduz a preparação; você não precisa escolher versões nem copiar comandos de terminal.

O Premiere precisa estar instalado e licenciado. Abrir o painel da Adobe, confirmar permissões do sistema e, quando necessário, reabrir o Codex ainda podem exigir sua participação. Nenhuma edição de teste é necessária. A primeira instalação baixa aproximadamente 550 MB de dependências e modelo de voz.

## Instruções para o agente

Objetivo: preparar a conexão com o Premiere e a transcrição local, verificar somente disponibilidade e leitura e devolver ao aluno o próximo passo concreto. Continue trabalhando quando o aluno fizer perguntas. Use terminal e scripts locais para economizar chamadas ao modelo. Não entregue uma lista de comandos para o aluno executar quando você puder executá-los.

### 1. Reaproveitar antes de instalar

- Trabalhe no Windows ou macOS real do aluno, onde o Premiere está instalado. Um terminal Linux remoto não configura o editor do computador dele.
- Localize o executável do Codex com `Get-Command codex` no Windows ou `command -v codex` no Mac. Se não estiver no PATH, localize a CLI distribuída com o aplicativo, sem instalar um segundo cliente desnecessariamente.
- Confira as integrações existentes. Se já houver MCP do Premiere configurado, tente sua consulta de conexão e catálogo uma vez. Se funcionar, use-o. Não troque CEP por UXP nem sobrescreva patches locais. Não publique a configuração nem credenciais.
- Uma instalação já funcional não precisa ser reinstalada porque uma versão antiga do instalador foi retirada do site. Falta de painel aberto não significa instalação quebrada.
- Obtenha permissões de rede e de gravação necessárias pelos mecanismos normais do cliente. Não desative antivírus, não crie exclusões, não remova alertas e não altere políticas globais para prosseguir.

### 2. Instalação nova

Use exclusivamente os arquivos deste repositório:

- Windows: [instalar-premiere.ps1](./instalar-premiere.ps1).
- Mac: [instalar-premiere-mac.sh](./instalar-premiere-mac.sh).
- Código completo: [premiere-setup-1.3.0.zip](./premiere-setup-1.3.0.zip), com [SHA-256](./premiere-setup-1.3.0.sha256).

Baixe o script pelo botão Raw ou por `raw.githubusercontent.com/CriativosdoFuturo/trombino-kit-edicao-ia/main/`. Leia-o antes de executar. O bootstrap confere o SHA-256 do pacote antes de extrair e executar; as dependências Windows e o modelo também têm hashes fixados. Reuse Node 20+ existente, se funcionar; caso contrário o bootstrap obtém o Node oficial.

No Windows execute o script salvo com PowerShell e, se necessário, informe `-CodexPath` e `-NodePath` com os caminhos absolutos encontrados. No Mac execute com `bash`, passando o caminho da CLI Codex como primeiro argumento. O Mac usa Homebrew para FFmpeg e Whisper: se não existir, prepare o Homebrew conforme sua documentação oficial, com as confirmações exigidas, e retome. Não execute um script remoto sem lê-lo. A instalação nativa no Mac ainda não foi validada nesta revisão; confirme cada resultado em vez de prometer compatibilidade universal.

O instalador cria os arquivos em `LocalAppData/CriativosdoFuturo/PremiereMCP` (Windows) ou `~/Library/Application Support/CriativosdoFuturo/PremiereMCP` (Mac), instala o painel CEP por usuário e registra apenas `premiere_pro_trombino` pelo comando oficial `codex mcp add`. Faz backup do TOML antes dessa alteração. Não altera Claude, VS Code nem desabilita outros MCPs. O painel CEP local usa a configuração Adobe `PlayerDebugMode`; os valores anteriores ficam registrados para recuperação. As proteções do sistema operacional permanecem ativas.

Se encontrar instalação anterior (`EXISTING_INSTALLATION`), preserve-a e diagnostique. Não exclua pastas para vencer essa proteção. Se houver bloqueio de segurança, obtenha nome da detecção, caminho e hash sem executar o arquivo bloqueado e encaminhe ao suporte. Se houver falha de download, certificado ou permissão, corrija a causa concreta pelos meios normais; não repita a instalação indefinidamente.

### 3. Confirmar que está ligado, sem editar

Na pasta instalada:

1. Execute `doctor.mjs` com o Node local: arquivos presentes, FFmpeg `-version`, Whisper `--help`, hash do modelo. Isso não transcreve material.
2. Execute `connection.mjs --connect` com o mesmo Node. Ele inicia o MCP por stdio, consulta o catálogo e o schema da transcrição, chama `verify_premiere_connection` e, somente depois de confirmar a conexão, `list_sequences`. Salva `readiness.json`. Não corta, duplica, importa, escala, renderiza nem salva projetos.
3. Se o painel estiver fechado, oriente somente: **“No Premiere, abra Janela > Extensões > MCP Bridge (CEP) e deixe o painel aberto.”** Se aparecer Start Bridge, peça um clique. Retome a leitura depois que o aluno confirmar.
4. Se o servidor novo não estiver disponível na conversa atual, peça reabrir o Codex e continuar nessa mesma conversa. Não reinstale por causa disso.
5. Se não houver projeto aberto, a ausência de sequência não é falha de instalação. Informe a conexão confirmada e peça que o aluno abra o projeto que deseja editar quando for começar. Não crie um projeto de teste.

“Pronto” exige dependências respondendo **e** resposta real do Premiere. Catálogo disponível sozinho não prova que o painel está conectado. Não afirme que todos os efeitos ou todos os tipos de edição foram testados: essa checagem confirma disponibilidade, não valida cada operação editorial.

Finalize com: **próximo passo para o aluno** e uma **conclusão curta**, distinguindo instalado, conectado e qualquer pendência. Se conectado, convide o aluno a pedir a edição do próprio material. Quando ele pedir edição, confira o estado atual e preserve o projeto antes de modificá-lo.

## Versão e histórico

Fluxo 1.3.0, baseado em `adobe-premiere-pro-mcp` 1.2.8 (CEP), com transcrição local do curso. Não é o PPMCP UXP experimental usado em um atendimento individual. As correções experimentais daquele atendimento não foram incorporadas a este pacote.

Nesta revisão, o servidor real iniciou por stdio e disponibilizou o catálogo e o schema da transcrição. Isso não constitui teste de edição. A instalação completa e a conexão precisam ser confirmadas na máquina pelo verificador acima; não são presumidas.

Os ZIPs antigos `premiere-mcp-instalador-*` continuam retirados da versão atual do repositório. A análise Microsoft da amostra anterior passou a mostrar **No malware detected** em Cloud e Client; a determinação final ainda estava **Pending** na consulta de 02/10/2026. Esse resultado é referente àquela amostra, não certifica esta versão nem autoriza ignorar um alerta novo.

Referências: [configuração oficial do Codex](https://learn.chatgpt.com/docs/extend/mcp?surface=cli), [MCP original](https://github.com/hetpatel-11/Adobe_Premiere_Pro_MCP).
