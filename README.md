# Kit Trombino — Como Editar com o ChatGPT

**Criativos do Futuro** · Skills e motion graphics com HyperFrames.

## Instalador do MCP do Premiere — Windows e Mac

### [BAIXAR INSTALADOR ÚNICO DO PREMIERE MCP (.zip)](https://github.com/CriativosdoFuturo/trombino-kit-edicao-ia/raw/refs/heads/main/premiere-mcp-instalador-v1.0.0.zip)

Este pacote foi preparado para alunos iniciantes. Ele detecta Windows ou macOS,
usa uma versão fixa do MCP, instala um Node.js portátil validado, prepara o
painel MCP Bridge, configura o Codex e executa o diagnóstico. A instalação comum
não depende do registro npm.

Depois de baixar e extrair o ZIP, abra a pasta no Codex e cole:

> Leia o README.md e o AGENTS.md. Detecte meu sistema operacional e instale o
> MCP do Adobe Premiere usando o instalador deste pacote. Continue até o
> diagnóstico passar. Peça minha intervenção somente quando o sistema exigir
> aprovação ou quando chegar aos dois passos manuais exibidos pelo instalador.
> Não use APIs pagas e não altere nenhum projeto aberto no Premiere.

Ao final, o aluno precisa apenas reiniciar Codex e Premiere, abrir **Janela >
Extensões > MCP Bridge (CEP)** e clicar em **Start Bridge**. O pacote inclui
instruções de suporte e recuperação via npm caso o caminho principal falhe.

Integridade do download: [SHA-256](premiere-mcp-instalador-v1.0.0.sha256).

## Escolha uma edição

### [BAIXAR KIT ESSENCIAL (.zip)](https://github.com/CriativosdoFuturo/trombino-kit-edicao-ia/raw/refs/heads/main/trombino-kit-edicao-ia.zip)

Comece aqui. Contém a base de edição do curso, 15 skills, 406 cards históricos em rascunho, templates, scripts e orientações para começar com testes conservadores de desempenho. Este é o endereço do download original, preservado para quem já recebeu o link.

### [BAIXAR KIT AMPLIADO (.zip)](https://github.com/CriativosdoFuturo/trombino-kit-edicao-ia/raw/refs/heads/main/trombino-kit-edicao-ia-ampliado.zip)

Contém a mesma base da Essencial, mais um catálogo de 50 referências selecionadas de animação, vidro, 3D e interfaces, com instruções de adaptação para vídeo. **As novas referências são links e receitas de trabalho; não são 50 efeitos já instalados, adaptados ou validados.** O agente prepara o efeito escolhido conforme o projeto, a licença e os recursos do computador. O item Pro permanece apenas como referência.

Não é necessário baixar as duas. A Ampliada inclui a Essencial. Os downloads são semelhantes em tamanho porque o catálogo não inclui as mídias e os motores de cada demo. O custo de processamento depende da animação executada, e não apenas da edição escolhida. Nenhuma das edições foi certificada para todo computador modesto.

## Instalação

1. Baixe um dos ZIPs acima e extraia a pasta.
2. Abra a pasta extraída `trombino-kit-edicao-ia` como projeto local no Codex.
3. Cole o pedido abaixo:

> Leia o README.md e o AGENTS.md. Prepare este kit para criar animações locais com HyperFrames. Verifique as dependências, instale o que faltar dentro das permissões disponíveis e faça o teste de oito segundos. Não use APIs pagas. Confira o vídeo gerado e me diga o que funcionou e o que falta. Depois use a skill trombino para definir comigo onde quero editar.

O download sozinho não instala o motor nem conecta o editor. Não é necessário baixar outro ZIP pelo menu Code. Quem já usa o kit deve extrair a atualização em outra pasta e preservar seus projetos, mídias e configurações anteriores. Leia `docs/EDICOES-E-DESEMPENHO.md` dentro do pacote.

## Depois do teste, abra uma nova tarefa

Não faça a primeira edição real na mesma conversa usada para instalar dependências e executar o teste. Essa conversa contém logs e resultados técnicos que podem aumentar o uso de créditos em cada operação do editor.

Abra **Nova tarefa** no mesmo projeto e cole:

> Use a skill trombino. Quero começar pela decupagem no modo econômico. Reutilize uma transcrição existente ou confirme o idioma antes de transcrever. Planeje todos os cortes antes de alterar a timeline, preserve a sequência original e aplique o plano em lote ou no menor número de lotes possível.

As duas edições agora incluem `docs/DECUPAGEM-SEGURA.md`. O modo econômico em lote é o padrão; a demonstração visual só é usada quando o aluno pedir. Antes de seguir no modo visual, o Codex explica com palavras simples que a execução leva mais tempo e consome mais créditos. O guia também inclui repetição inteligente, preferência pelo MCP e cuidado com projetos em pastas sincronizadas. O limite vale para repetir a mesma ação pelo mesmo método: o Codex verifica o estado, troca de caminho e continua a edição quando isso for seguro.

### Atualizar esta proteção sem reinstalar o MCP

Quem já instalou o MCP do Premiere não precisa instalá-lo novamente. Baixe de novo a mesma edição do kit, extraia em uma pasta nova e abra essa nova pasta como projeto no Codex. O MCP permanece instalado no computador. Preserve a pasta anterior, projetos, mídias, configurações e arquivos `.env`; depois do teste da nova pasta, leve somente cópias dos projetos que deseja continuar.

### J-cuts e finais de palavras

A versão 2.1.2 diferencia corte apertado de J-cut verdadeiro. Na limpeza comum, o Codex remove pausas e respirações indesejadas sem cortar o fonema final; quando J-cut for solicitado, o áudio seguinte deve começar antes da troca de imagem. O cortador local preserva por padrão uma margem fonética de 160 ms após timestamps de palavras, e a revisão por escuta prevalece sobre esse valor. Isso protege finais de baixa energia, como o “s” de “professores”.

## Ferramentas e destino da entrega

- [Codex](https://openai.com/pt-BR/codex/): recebe sua direção e trabalha com as ferramentas e arquivos disponíveis no ambiente local.
- [HyperFrames](https://github.com/heygen-com/hyperframes): motor de composição e render instalado como dependência do kit.
- Kit Trombino: organiza o fluxo do curso e ajuda a descobrir o método de cada aluno.
- MCP do editor: integração separada; instale apenas a necessária.

O curso demonstra principalmente Premiere no Windows. Use o [instalador único do Premiere MCP](https://github.com/CriativosdoFuturo/trombino-kit-edicao-ia/raw/refs/heads/main/premiere-mcp-instalador-v1.0.0.zip) para Windows ou Mac. [DaVinci MCP](https://github.com/samuelgursky/davinci-resolve-mcp) e [CapCut MCP](https://github.com/yabdulaziz2009-dev/capcut-mcp) têm requisitos e formas de funcionamento próprios. Não são instalados automaticamente pelo kit de animação.

Um vídeo renderizado não vira texto e keyframes nativos no editor. O código HyperFrames permanece editável; entrega nativa depende da integração e precisa ser verificada.

## Custos e validação

O kit não cobra assinatura própria nem inclui créditos externos. Codex segue o plano e os limites da conta; editores podem exigir licença. Transcrição e geração externa podem ter custo e não são necessárias para o teste sintético. Transcrição local não está configurada automaticamente.

Nesta revisão, as duas edições passaram nos 11 testes de scripts e nas checagens de estrutura dos 406 cards. A skill Trombino ganhou proteções de contexto e repetição para decupagem conectada. Não houve mudança do motor nem novo teste de render nesta revisão documental. A validação anterior de oito segundos está descrita em [VALIDACAO.md](VALIDACAO.md) e no arquivo de mesmo nome dentro dos ZIPs. Ela não comprova todos os cards, as referências novas, todas as integrações de editor ou desempenho em computadores modestos.

## Créditos

Adaptação didática por Trombino / Criativos do Futuro, baseada no [HyperFrames Student Kit](https://github.com/nateherkai/hyperframes-student-kit). HyperFrames, React Bits e Codrops são projetos de terceiros. Créditos e licenças da base são preservados em LICENSE, THIRD_PARTY_NOTICES.md e dentro dos pacotes. As referências novas não incluem código Pro, vídeos de terceiros nem assets das demos.
