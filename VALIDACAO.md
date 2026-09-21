# Validação da distribuição — 10/09/2026

- Checagem estrutural: 406 cards, duas bibliotecas de estilo, skills sincronizadas; zero erros.
- Testes de scripts: 11 aprovados, zero falhas.
- Dependências instaladas numa nova pasta, usando o cache npm da máquina e scripts de instalação desabilitados.
- Setup confirmou Node 24, FFmpeg e ffprobe; foram reutilizados executáveis já disponíveis na máquina.
- Projeto starter novo renderizado com Chrome instalado: MP4 H.264, 1920 × 1080, 30 fps, oito segundos, sem áudio por projeto; render concluído em 13,4 s nesta máquina.

Esse tempo é uma medição do exemplo sintético nesta máquina, não promessa para outros vídeos ou computadores.

## Ainda não validado

Instalação em computador limpo, transcrição local de fala em português, vídeo falado completo pelo kit, entrega nativa em todos os editores e transparência importada em cada programa. Outra conta no mesmo computador não constitui teste de computador limpo.

## Conteúdo do pacote

O pacote exclui node_modules, ferramentas baixadas, arquivos .env, gravações pessoais, projetos de edição, renders, fontes particulares e perfis pessoais. Dependências são instaladas na máquina do aluno. Os exemplos de marca AIS e vídeos showcase da distribuição original foram omitidos; licenças e créditos foram preservados.

## Edições 2.1

Mudanças desta revisão: documentação de escolha, relatório local de hardware e catálogo opcional. Não há mudança no motor nem nos cards históricos. As novas referências não foram adaptadas nem renderizadas. A validação histórica abaixo/acima não se estende a elas. Computadores modestos ainda não foram certificados.

Checagens desta revisão: sincronização das skills e estrutura aprovadas; 11 testes de scripts aprovados em cada edição; relatório local de hardware executado. Nenhum novo render de efeitos foi realizado nesta revisão.

## Proteção de decupagem conectada

Esta revisão adiciona separação entre instalação e edição, uma tarefa limpa para a primeira decupagem, transcrição única com idioma confirmado e planejamento completo antes da timeline. O modo econômico em lote é o padrão. A demonstração visual, que executa o plano em ordem sem reanalisar entre os cortes, só é usada quando o usuário pedir; antes de seguir, o Codex explica em linguagem simples que esse modo leva mais tempo e consome mais créditos. Também foram incluídos resultados compactos, repetição inteligente e proteção para projetos em pastas sincronizadas. O limite vale para a mesma ação pelo mesmo método; ele não encerra a tarefa inteira. As skills foram sincronizadas e os 11 testes existentes passaram. Esta revisão não executou uma sessão real do Premiere, DaVinci ou CapCut; a compatibilidade continua dependente da integração instalada.

## J-cut e proteção fonética 2.1.2

A skill agora distingue corte apertado de J-cut verdadeiro, exige antecipação real do áudio seguinte quando J-cut for solicitado e impede que cortes alinhados sejam descritos como J-cuts. O cortador de silêncios ganhou `--word-tail-pad`, com margem padrão de 160 ms depois do timestamp de cada palavra, além de revisão obrigatória por escuta para preservar fonemas finais. Um novo teste automatizado verifica essa margem. As duas edições passaram em 12 testes, sincronização das skills e checagem estrutural. Nenhuma sessão real de editor foi executada nesta revisão.

## Isolamento de ferramentas 2.1.3 / instalador 1.1.0

O instalador agora ativa um modo Premiere econômico reversível no `config.toml` do usuário. Ele mantém `premiere_pro_trombino`, desativa temporariamente outros MCPs e apps, cria backup e grava o estado necessário para restaurar somente as opções alteradas. O MCP vendorizado continua em `adobe-premiere-pro-mcp` 1.2.8 e anuncia o catálogo reduzido por padrão. O ativador foi testado com servidores concorrentes, seção `[features]` existente, ativação repetida e restauração dos valores anteriores. O teste não substitui uma sessão real do Codex com Premiere licenciado.

## Transcrição local e reparo 1.2.0

O instalador 1.2 configura Codex e Claude com caminhos absolutos, instala FFmpeg,
whisper.cpp e o modelo multilíngue `small`, e adiciona `transcribe_media` e
`read_local_transcript` ao catálogo do MCP. Foram validados: sintaxe dos
scripts Windows e JavaScript, atualização preservando configurações alheias,
busca das novas ferramentas, paginação e reaproveitamento do cache com
executáveis simulados, além dos hashes e da execução do binário Windows x64 do
whisper.cpp. A transcrição local equivalente já foi usada no computador do
autor; o instalador 1.2 ainda precisa de validação integral em um Mac limpo e em
Windows ARM64.
