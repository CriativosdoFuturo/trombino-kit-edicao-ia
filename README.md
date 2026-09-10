# Kit Trombino — Como Editar com o ChatGPT

**Criativos do Futuro** · Skills, referências e motion graphics com HyperFrames.

## Baixar o kit completo

### [BAIXAR KIT TROMBINO (.zip)](https://github.com/CriativosdoFuturo/trombino-kit-edicao-ia/raw/refs/heads/main/trombino-kit-edicao-ia.zip)

O ZIP contém os arquivos-fonte do kit: 15 skills, biblioteca de 406 cards, templates, scripts, testes, guias e licenças. Não contém seus vídeos, fontes particulares, credenciais nem dependências já instaladas.

1. Baixe pelo botão acima e extraia o ZIP.
2. Abra a pasta extraída `trombino-kit-edicao-ia` como projeto local no Codex.
3. Cole este pedido:

> Leia o README.md e o AGENTS.md deste kit. Prepare esta instalação para criar animações locais com HyperFrames. Verifique Node 22+, npm, FFmpeg, ffprobe e Chrome compatível. Instale as dependências dentro das permissões disponíveis, execute os testes e renderize o exemplo de oito segundos. Não configure serviços pagos. Confira o vídeo gerado e me diga o que funcionou e o que falta. Depois use a skill trombino para definir comigo onde quero editar.

O download sozinho não instala o motor nem conecta seu editor. Não é necessário baixar um segundo ZIP pelo menu Code: use o botão acima.

## Para que serve cada parte?

- **Codex:** o agente que recebe sua direção e trabalha com arquivos e ferramentas disponíveis no ambiente desktop. [Instalação oficial no Windows](https://learn.chatgpt.com/docs/windows/windows-app).
- **HyperFrames:** motor de composição e render de animações/vídeos. É instalado como dependência do kit. [Projeto do motor](https://github.com/heygen-com/hyperframes).
- **Kit Trombino:** organiza instruções, exemplos e referências para o fluxo do curso; a skill de entrada entende a entrega e as preferências de cada aluno.
- **MCP do editor:** integração separada para consultar e operar o programa. Instale apenas a que for necessária.

## Editores

O curso demonstra principalmente Premiere no Windows. [Integração comunitária usada como base](https://github.com/antipaster/Adobe-Premiere-Pro-MCP).

[DaVinci](https://github.com/samuelgursky/davinci-resolve-mcp) e [CapCut](https://github.com/yabdulaziz2009-dev/capcut-mcp) são possibilidades a testar, não integrações validadas por este kit. Consulte os requisitos de versão, sistema e edição de cada projeto.

## Editabilidade

O HyperFrames preserva o código-fonte da composição. Um vídeo renderizado, mesmo com transparência, não vira automaticamente texto e keyframes nativos no Premiere, Resolve ou CapCut. Elementos nativos dependem das ferramentas de cada editor e precisam ser testados.

## Custos e validação

O kit não cobra assinatura própria nem inclui créditos de outros serviços. Codex segue o plano e limites da conta; os editores podem exigir licença. Transcrição e geração externa são opcionais e podem ter custo. O teste sintético não usa API paga. Transcrição local não está configurada automaticamente.

Passaram 11 testes de scripts e a checagem de estrutura de 406 cards. O exemplo de oito segundos foi renderizado em uma nova pasta na máquina de preparação, reutilizando ferramentas e cache existentes. **Não equivale a um teste em computador limpo.** Veja [VALIDACAO.md](VALIDACAO.md).

## Créditos e licenças

Adaptação didática por Trombino / Criativos do Futuro, baseada no [HyperFrames Student Kit de Nate Herk](https://github.com/nateherkai/hyperframes-student-kit). HyperFrames é um motor de terceiros. Créditos e licenças foram preservados em LICENSE, THIRD_PARTY_NOTICES.md e dentro do pacote. Os projetos com marcas AIS e os vídeos showcase da base foram omitidos desta distribuição.
