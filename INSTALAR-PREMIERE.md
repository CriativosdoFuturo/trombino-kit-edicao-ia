# Preparar o Premiere para editar com o Codex

**Estado em 02/10/2026: fluxo atual 1.3.3 disponível para preparação e checagem de conexão.** Mantém a experiência de copiar este link e o prompt. Inclui o painel assinado e orientação para abrir o projeto antes da extensão. Os ZIPs antigos `premiere-mcp-instalador-*` continuam retirados; essa retirada não suspende o fluxo atual.

**Leitura direta, sem a interface do GitHub:** https://raw.githubusercontent.com/CriativosdoFuturo/trombino-kit-edicao-ia/main/INSTALAR-PREMIERE.md

Este arquivo é autossuficiente como orientação de instalação. Não exige um AGENTS.md remoto ou uma pasta local já preparada. Se a página `/blob/main/` não abrir, leia o endereço direto acima. Se ambos falharem, informe o erro de acesso; não conclua que o fluxo atual está suspenso apenas com base em um trecho antigo de busca. Um alerta real de segurança sobre o arquivo atual continua exigindo interrupção e diagnóstico.

**Se a ferramenta de pesquisa não conseguir ler este guia:** tente a leitura pelo navegador disponível ou baixe somente o texto pelo terminal local, com as permissões normais de rede. Leia o conteúdo antes de executar qualquer comando nele. Não use trechos de busca como substituto do arquivo atual. Se houver bloqueio explícito de segurança ou de política de acesso, respeite-o; não use outro canal para contorná-lo. A ausência de README/AGENTS em uma pasta vazia não impede começar esta preparação.

## Link e prompt para uma conversa nova

Copie o endereço desta página e envie com o texto de [PROMPT-PREMIERE.txt](./PROMPT-PREMIERE.txt). O prompt contém as instruções de recuperação de leitura, para funcionar sem depender de outra conversa. Não é necessário baixar ou escolher ZIPs manualmente.

Este é o endereço único do Premiere no curso Trombino / Criativos do Futuro. Cole este link no **Codex instalado no mesmo computador do Premiere** junto com o **PROMPT DA PRIMEIRA TENTATIVA** da aula. O agente conduz a preparação; você não precisa escolher versões nem copiar comandos de terminal.

O Premiere precisa estar instalado e licenciado. Abrir o painel da Adobe, confirmar permissões do sistema e, quando necessário, reabrir o Codex ainda podem exigir sua participação. Nenhuma edição de teste é necessária. A primeira instalação baixa aproximadamente 550 MB de dependências e modelo de voz.

## Instruções para o agente

Objetivo: preparar a conexão com o Premiere e a transcrição local, verificar somente disponibilidade e leitura e devolver ao aluno o próximo passo concreto. Continue trabalhando quando o aluno fizer perguntas. Use terminal e scripts locais para economizar chamadas ao modelo. Não entregue uma lista de comandos para o aluno executar quando você puder executá-los.

REGRA DE CONDUÇÃO E ENCERRAMENTO: explique o estado em linguagem simples e continue as ações já autorizadas, sem pedir autorização novamente. Use terminal e ferramentas locais quando possível. Responda perguntas sem abandonar o trabalho.

Somente quando existir um problema real cuja correção precise de uma nova autorização, explique primeiro a causa, a correção concreta e o que será alterado. Encerre a resposta com a pergunta abaixo em título e negrito, seguida da resposta sugerida, sem conteúdo técnico depois:

### **Quer que eu resolva isso pra você?**
Responda **“Sim, pode resolver”** para eu continuar.

Se faltar apenas uma ação manual do aluno, peça somente essa ação e a confirmação correspondente: abrir um projeto, abrir o painel ou salvar antes de reiniciar. Não acrescente a pergunta genérica nesses casos. Se a correção já estiver autorizada, execute e verifique. Se estiver tudo funcionando, confirme o resultado e o próximo passo de uso, sem oferecer uma correção desnecessária. Respeite bloqueios de segurança; a pergunta não autoriza contorná-los.

### 1. Reaproveitar antes de instalar

- Trabalhe no Windows ou macOS real do aluno, onde o Premiere está instalado. Um terminal Linux remoto não configura o editor do computador dele.
- Registre sistema, arquitetura e versão do Premiere. Não instale nem atualize o Premiere automaticamente. Um atendimento no Windows 10/Premiere 2020 14.0.0.571 confirmou conexão e leitura após os ajustes agora incorporados. Isso não comprova todas as operações nem outras versões; uma faixa aceita pelo manifesto não basta. Primeiro confira os requisitos do pacote e depois a conexão real, sem edição de teste.
- Localize o executável do Codex com `Get-Command codex` no Windows ou `command -v codex` no Mac. Se não estiver no PATH, localize a CLI distribuída com o aplicativo, sem instalar um segundo cliente desnecessariamente.
- Confira as integrações existentes. Se já houver MCP do Premiere configurado, tente sua consulta de conexão e catálogo uma vez. Se funcionar, use-o. Não troque CEP por UXP nem sobrescreva patches locais. Não publique a configuração nem credenciais.
- Uma instalação já funcional não precisa ser reinstalada porque uma versão antiga do instalador foi retirada do site. Falta de painel aberto não significa instalação quebrada.
- Obtenha permissões de rede e de gravação necessárias pelos mecanismos normais do cliente. Não desative antivírus, não crie exclusões, não remova alertas e não altere políticas globais para prosseguir.

### 2. Instalação nova

**Espaço e certificados:** confira espaço antes de baixar. O instalador reserva 2 GiB para dependências e soma a reserva do painel/configuração/ponte por volume. O bootstrap Windows verifica 512 MB para preparação temporária. Se faltar espaço, consulte discos disponíveis e proponha uma pasta; use `-Root` e, se necessário, `-StageRoot` no bootstrap Windows, ou `--root` no `install.mjs`. Não escolha outro disco nem remova arquivos sem a decisão do usuário. Os arquivos do painel e a configuração continuam no perfil do usuário.

O `install.mjs` adiciona os certificados confiáveis do sistema às autoridades já usadas pelo Node, mantendo a validação TLS. Não é necessário desligar validação ou alterar certificados. O painel usa manifesto 7/CSXS 9 e criação de diretórios compatível com o Node antigo do CEP 9. Em instalações novas, telemetria do painel começa desligada; preferências existentes são preservadas.


A versão 1.3.3 detecta as contas restritas `codexsandboxoffline`/`codexsandboxonline` antes de baixar ou instalar. O painel Adobe precisa ser registrado na conta do usuário do Premiere. Se aparecer `RESTRICTED_EXECUTION`, use somente o mecanismo de execução autorizado disponibilizado pelo cliente. Se ele não estiver disponível, entregue o script já revisado ao usuário para execução manual na própria conta. Não altere ACLs, proteções ou políticas para contornar o bloqueio. Não repita pedidos de acesso a pastas esperando que isso troque a conta de execução.

Antes dos downloads de dependências, o instalador também verifica a gravação nos destinos e a abertura da configuração existente sem modificar seu conteúdo. Esses checks não substituem a confirmação posterior de conexão.


Use exclusivamente os arquivos deste repositório:

- Windows: [instalar-premiere.ps1](./instalar-premiere.ps1).
- Mac: [instalar-premiere-mac.sh](./instalar-premiere-mac.sh).
- Código completo: [premiere-setup-1.3.3.zip](./premiere-setup-1.3.3.zip), com [SHA-256](./premiere-setup-1.3.3.sha256).

Baixe o script pelo botão Raw ou por `raw.githubusercontent.com/CriativosdoFuturo/trombino-kit-edicao-ia/main/`. Leia-o antes de executar. O bootstrap confere o SHA-256 do pacote antes de extrair e executar; as dependências Windows e o modelo também têm hashes fixados. Reuse Node existente com suporte a getCACertificates/setDefaultCACertificates (22.19+ na linha 22, 24.5+ na linha 24), se funcionar; caso contrário o bootstrap obtém o Node oficial.

No Windows execute o script salvo com PowerShell e, se necessário, informe `-CodexPath` e `-NodePath` com os caminhos absolutos encontrados. No Mac execute com `bash`, passando o caminho da CLI Codex como primeiro argumento. O Mac usa Homebrew para FFmpeg e Whisper: se não existir, prepare o Homebrew conforme sua documentação oficial, com as confirmações exigidas, e retome. Não execute um script remoto sem lê-lo. A instalação nativa no Mac ainda não foi validada nesta revisão; confirme cada resultado em vez de prometer compatibilidade universal.

O instalador cria os arquivos em `LocalAppData/CriativosdoFuturo/PremiereMCP` (Windows) ou `~/Library/Application Support/CriativosdoFuturo/PremiereMCP` (Mac), instala o painel CEP por usuário e registra apenas `premiere_pro_trombino` pelo comando oficial `codex mcp add`. Faz backup do TOML antes dessa alteração. Não altera Claude, VS Code nem desabilita outros MCPs. O painel inclui assinatura do distribuidor, sem instalar certificados no sistema nem exigir que o aluno assine arquivos. Preserve instalações funcionais. O painel CEP local usa a configuração Adobe `PlayerDebugMode`; os valores anteriores ficam registrados para recuperação. As proteções do sistema operacional permanecem ativas.

Se encontrar instalação anterior (`EXISTING_INSTALLATION`), preserve-a e diagnostique. Não exclua pastas para vencer essa proteção. Se houver bloqueio de segurança, obtenha nome da detecção, caminho e hash sem executar o arquivo bloqueado e encaminhe ao suporte. Se houver falha de download, certificado ou permissão, corrija a causa concreta pelos meios normais; não repita a instalação indefinidamente.

### 3. Confirmar que está ligado, sem editar

Na pasta instalada:

1. Execute `doctor.mjs` com o Node local: arquivos presentes, FFmpeg `-version`, Whisper `--help`, hash do modelo. Isso não transcreve material.
2. Execute `connection.mjs --connect` com o mesmo Node. Ele inicia o MCP por stdio, consulta o catálogo e o schema da transcrição, chama `verify_premiere_connection` e, somente depois de confirmar a conexão, `list_sequences`. Salva `readiness.json`. Não corta, duplica, importa, escala, renderiza nem salva projetos.
3. Antes de orientar Janela > Extensões, confira se há um projeto aberto. Após iniciar ou reiniciar o Premiere, se estiver na tela inicial, peça ao aluno abrir seu projeto em Recentes ou Arquivo > Abrir projeto. Se ele não tiver projeto, explique como criar um projeto vazio caso queira; não imponha material nem edição de teste. Só depois oriente Janela > Extensões > MCP Bridge (CEP), mantendo o painel aberto e clicando em Start Bridge apenas se necessário. Antes de reiniciar, peça salvar alterações pendentes e aguarde a confirmação. Dê uma ação manual por vez. Retome a checagem de leitura após a confirmação.
4. Se o servidor novo não estiver disponível na conversa atual, peça reabrir o Codex e continuar nessa mesma conversa. Não reinstale por causa disso.
5. A ausência de projeto ou sequência deve ser informada separadamente da conexão. Não confunda um projeto vazio com falha de instalação. Não exija edição de teste. Use o resultado da checagem atual; `connectionVerified:false` em `installation.json` registra o estado inicial e não invalida uma checagem posterior bem-sucedida.

“Pronto” exige dependências respondendo **e** resposta real do Premiere. Catálogo disponível sozinho não prova que o painel está conectado. Não afirme que todos os efeitos ou todos os tipos de edição foram testados: essa checagem confirma disponibilidade, não valida cada operação editorial.

Finalize com: **próximo passo para o aluno** e uma **conclusão curta**, distinguindo instalado, conectado e qualquer pendência. Se conectado, convide o aluno a pedir a edição do próprio material. Quando ele pedir edição, confira o estado atual e preserve o projeto antes de modificá-lo.

## Versão e histórico

Fluxo 1.3.3, baseado em `adobe-premiere-pro-mcp` 1.2.8 (CEP), com transcrição local do curso. Não é o PPMCP UXP experimental usado em um atendimento individual. As correções experimentais daquele atendimento não foram incorporadas a este pacote.

Nesta revisão, o servidor real iniciou por stdio e disponibilizou o catálogo e o schema da transcrição. Isso não constitui teste de edição. A instalação completa e a conexão precisam ser confirmadas na máquina pelo verificador acima; não são presumidas.

Os ZIPs antigos `premiere-mcp-instalador-*` continuam retirados da versão atual do repositório. A análise Microsoft da amostra anterior passou a mostrar **No malware detected** em Cloud e Client; a determinação final ainda estava **Pending** na consulta de 02/10/2026. Esse resultado é referente àquela amostra, não certifica esta versão nem autoriza ignorar um alerta novo.

Referências: [configuração oficial do Codex](https://learn.chatgpt.com/docs/extend/mcp?surface=cli), [MCP original](https://github.com/hetpatel-11/Adobe_Premiere_Pro_MCP).

## Alterações desta atualização

Painel assinado com código idêntico ao da 1.3.2; orientação de projeto antes da extensão; pergunta de correção somente quando apropriada; relatório de conexão atualizado também em falha. Assinatura e hashes conferidos localmente; não houve nova instalação completa desta versão nem edição de teste. Os atendimentos relatados confirmaram conexão e leitura no Premiere 2020 e 2026, com ajustes locais. Isso não certifica todas as versões nem todas as operações. Detalhes da assinatura e limites da verificação estão em THIRD_PARTY_NOTICES.md dentro do pacote.
