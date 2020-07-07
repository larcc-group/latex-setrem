# LaTeX SETREM

Repositório com template padrão SETREM para escrita de monografias em LaTeX. 


# Direitos autorais do LARCC

O repositório deste template foi desenvolvido e é mantido pelo [LARCC](http://larcc.setrem.com.br), o qual possui os direitos reservados.


# Contribua você também

Use as [Issues](https://github.com/larcc-group/latex-setrem/issues) para reportar eventuais problemas.

Faça pull requests para melhorias no código fonte. 


# Contato

Acesse a página de contato do LARCC [aqui](http://larcc.setrem.com.br/en/contact/).


# Compilando o projeto no Linux

## Usando Visual Studio Code

- Instalar o [Visual Studio Code](https://code.visualstudio.com/);
- Instalar a extensão [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) para o Visual Studio Code;
- Instalar o [TeX Live](https://tug.org/texlive/);
- Baixar o projeto [aqui](https://github.com/larcc-group/latex-setrem/archive/master.zip) e extrair em alguma pasta;
- Abrir a pasta extraída no Visual Studio Code;
- Abrir o arquivo `main.tex` e editar;
- Ao salvar o arquivo, o projeto é compilado automaticamente.


## Usando linha de comando no **Ubuntu**

- Executar o seguinte comando no terminal para instalar o [TeX Live](https://tug.org/texlive/):
  - `sudo apt install texlive-full`
- Baixar o projeto [aqui](https://github.com/larcc-group/latex-setrem/archive/master.zip) e fazer a extração em alguma pasta;
- Abrir e editar o arquivo `main.tex`;
- Executar o comando `make` pelo terminal dentro da pasta extraída.


# Compilando o projeto no Overleaf

- Baixar o projeto [aqui](https://github.com/larcc-group/latex-setrem/archive/master.zip);
- Acessar [Overleaf](https://www.overleaf.com) e fazer login;
- Clicar em `Novo Projeto` e selecionar a opção `Upload Projeto`;
- Selecionar o arquivo do projeto baixado;
- Clicar no botão compilar.


# Alterando o cabeçalho do curso

Para alterar o cabeçalho do curso no PDF, substitua a tag `\sistemasinformacaologo` por uma das opções abaixo:

- Sistemas de Informação: `\sistemasinformacaologo`;
- Engenharia da Computação: `\engenhariacomputacaologo`;
- Engenharia da Produção: `\engenhariaproducaologo`;
- Administração: `\administracaologo`;
- Agronomia: `\agronomialogo`;
- Enfermagem: `\enfermagemlogo`;
- Direito: `\direitologo`;
- Pedagogia: `\pedagogialogo`;
- Psicologia: `\psicologialogo`;
- Técnico em Informática: `\ctilogo`;
- Técnico em Enfermagem: `\ctelogo`;
- Técnico em Comunicação Visual: `\ctcvlogo`;
- Técnico em Agropecuária: `\ctalogo`;


# Mantendo o template da sua monografia atualizado

Sabendo que melhorias são contínuas e problemas podem surgir. Portanto, é importante manter o template do seu projeto atualizado. Para isso, você só precisa substituir os arquivos da pasta `template` do seu projeto em andamento pelos arquivos da pasta [template](https://github.com/larcc-group/latex-setrem/tree/master/template) do nosso projeto neste repositório.


# Materiais de ajuda

Se você está iniciando com o LaTeX, os materiais abaixo irão lhe ajudar:

- [https://github.com/luong-komorebi/Begin-Latex-in-minutes](https://github.com/luong-komorebi/Begin-Latex-in-minutes)
- [LaTeX Notes for Professionals book](https://goalkicker.com/LaTeXBook/)