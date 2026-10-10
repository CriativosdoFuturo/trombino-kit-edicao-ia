# Preparação dos editores — orientações do curso

Revisão: 10/10/2026. O fluxo continua sendo enviar o link do editor e o prompt ao agente no computador do aluno. Confira o editor, edição, versão, sistema e integração existente antes de instalar. Preserve o que já funciona. Não prometa equivalência de recursos entre editores. Esta orientação complementa a documentação dos autores; não é uma alteração dos projetos de terceiros.

## Premiere

Use [INSTALAR-PREMIERE.md](./INSTALAR-PREMIERE.md) e [PROMPT-PREMIERE.txt](./PROMPT-PREMIERE.txt). O fluxo 1.3.5 mantém o link estável e o painel assinado. Quem já está conectado não precisa reinstalar. A confirmação é de dependências e conexão/leitura, sem edição de teste. A instalação nativa Mac precisa ser confirmada na máquina; a correção LF não equivale a essa validação.

## DaVinci Resolve

Projeto: https://github.com/samuelgursky/davinci-resolve-mcp

Identifique **Studio ou gratuito**, além da versão. O caminho principal da integração usa a API de scripting do **Studio**, conforme o README do autor. A documentação do projeto descreve uma ponte interna para o gratuito até 21.0.x, com relato de medição em 21.0.3.7. Também informa que a edição gratuita 21.1 deixou de listar scripts Python pelo caminho usado; suporte pelo Console não foi confirmado. Portanto, **não ofereça essa ponte como solução comprovada para o gratuito 21.1** e não repita uma preferência que só atende ao Studio.

No Studio, siga os requisitos e o procedimento atual do autor e confirme a conexão local. No gratuito 21.1, explique a incompatibilidade desse caminho e só ofereça alternativa que tenha suporte documentado para a edição/versão encontrada. Não recomende downgrade nem compra automática. A presença do pacote ou seu hash correto não comprova compatibilidade com a edição gratuita. Consulte novamente o README se o autor publicar suporte posterior; não mantenha uma restrição histórica como regra eterna.

## CapCut Windows

Projeto: https://github.com/yabdulaziz2009-dev/capcut-mcp

Integração comunitária, independente e não oficial. A ausência de uma release de instalador não significa que o código esteja indisponível. Leia os requisitos e a instalação a partir do código publicados pelo autor, registre a revisão usada e confirme compatibilidade. Não invente um ZIP de release. Execute primeiro a verificação de compatibilidade prevista pelo projeto; não use a presença de ferramentas como prova de que qualquer versão do CapCut pode ser editada. A preparação inicial não deve alterar projetos.

## CapCut Mac

Projeto: https://github.com/drhema/mcp-cut

O README do autor contém o placeholder `git clone <this repo>`. O comando completo correspondente é:

```sh
git clone https://github.com/drhema/mcp-cut.git
cd mcp-cut
uv sync
```

Leia os fontes e requisitos antes de executar. Reaproveite uma instalação existente; não clone por cima de uma pasta ocupada. O autor relata testes no CapCut macOS 8.5 e uso de arquivos de projeto; isso não comprova todas as versões. Confira o caminho de drafts e a compatibilidade sem editar material do aluno. O comando acima corrige a instrução incompleta, não transforma a integração em plugin oficial do CapCut.

## Final Cut Pro

Projeto: https://github.com/DareDev256/fcp-mcp-server

O fluxo usa **FCPXML**. Para trabalhar sobre uma timeline existente, oriente no Mac **File / Arquivo > Export XML / Exportar XML**, conforme o idioma e versão. Essa exportação é uma etapa de acesso ao projeto, não um defeito nem um teste de edição. Ações dentro do Final Cut exigem Mac com o editor. Não prometa leitura automática do projeto aberto sem o intercâmbio previsto pelo autor. Preserve o XML original e trabalhe sobre uma cópia quando o aluno pedir edição.

## Condução

Faça a checagem de instalação e disponibilidade sem exigir edição de teste. Quando faltar uma ação manual, peça uma por vez. Quando uma correção concreta exigir nova autorização, explique a causa e a mudança e termine com **“Quer que eu resolva isso pra você?”**, em destaque. Com autorização já dada, continue. Quando estiver funcionando, confirme o resultado sem oferecer correção desnecessária.
