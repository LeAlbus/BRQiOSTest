# BRQiOSTest

## Teste da BRQ
 
Olá **dev**, esse teste visa medir a capacidade do candidato a uma vaga para empresa BRQ na tecnologia iOS.

Nosso teste consiste em pesquisar e apresentar o resultado da busca em uma lista e ao clicar em um filme, o app deve apresentar as informações do filme especifico, pesquisado pelo usuário do APP e alimentado pelo banco de dados do IMDB, via a API OMDB(http://www.omdbapi.com).

O candidato pode apresentar o design do app da forma que quiser (não necessariamente precisando seguir o spec abaixo), porém o App deve conter os componentes que são específicos para atingir as metas.

### Metas:
1. Consumir a API do OMDB
2. Apresentar um UISEARCHBAR para pesquisa do filme
3. Trazer o response da busca dentro de uma UITABLEVIEW
4. Apresentar o detalhe do filme escolhido em uma UIViewController de detalhe trazendo Title, Poster, Released, Genre, Director, Actors
(fazer nova pesquisa usando o imdbId, para trazer os detalhes do filme)
5. Aplicar constraints
6. Utilizar .gitignore

### Metas Optativas:
1. Aplicar MVVM ou MVP
2. Utilizar Cocoapoads
3. Utilizar Cache de imagens (https://github.com/SDWebImage/SDWebImage), para os posters
4. Escrever Testes Unitarios
5. Escrever Testes de Interface
6. Escrever Camada de Conexão com a API
