# User Stories - Gerenciamento de Filmes

## US-HOME-001: Página Inicial Atrativa

**Como** usuário (visitante ou autenticado)  
**Eu quero** ter uma visão geral e atrativa da aplicação ao entrar na página inicial  
**Para que** eu possa navegar facilmente e entender os serviços oferecidos  

### Critérios de Aceitação
- [x] AC-024: Página inicial exibe banner com informações sobre o cinema
- [x] AC-025: Exibe uma seção destacada de "Filmes em Cartaz" com pôsteres em tamanho adequado
- [x] AC-026: Layout responsivo que se adapta a diferentes tamanhos de tela
- [x] AC-027: Links rápidos para principais áreas da aplicação
- [x] AC-028: Acesso fácil à navegação principal através do cabeçalho
- [x] AC-029: Usuários autenticados veem opções personalizadas no menu

### Cenários de Teste Relacionados
- Cenários de teste relacionados à página inicial serão definidos nos testes de interface (UI)

---

## US-MOVIE-002: Navegar na Lista de Filmes

**Como** usuário (visitante ou autenticado)  
**Eu quero** navegar pelos filmes disponíveis  
**Para que** eu possa descobrir filmes para assistir  

### Critérios de Aceitação
- [x] AC-030: Usuário pode visualizar uma lista dos filmes em exibição com layout em grid
- [x] AC-031: Filmes são exibidos com pôster grande e de alta qualidade
- [x] AC-032: Cards de filmes mostram título, classificação e gêneros
- [x] AC-033: Cards incluem duração do filme e data de lançamento
- [x] AC-034: Sistema adapta o layout para diferentes tamanhos de tela (responsivo)
- [x] AC-035: Usuário consegue acessar detalhes do filme com um clique

### Cenários de Teste Relacionados
- CT-011: Listar todos os filmes
- CT-012: Obter detalhes de um filme válido

---

## US-MOVIE-003: Visualizar Detalhes do Filme

**Como** usuário (visitante ou autenticado)  
**Eu quero** visualizar informações detalhadas sobre um filme  
**Para que** eu possa decidir se quero assisti-lo  

### Critérios de Aceitação
- [x] AC-036: Detalhes incluem sinopse, elenco, diretor, data de lançamento, duração
- [x] AC-037: Página de detalhes mostra pôster do filme
- [x] AC-038: Página exibe horários de sessões disponíveis
- [x] AC-039: Usuário pode navegar para a reserva a partir dos horários disponíveis

### Cenários de Teste Relacionados
- CT-012: Obter detalhes de um filme válido
- CT-013: Obter detalhes com ID inválido

---

## Resumo de Cobertura

| User Story   | Critérios de Aceitação | Cenários de Teste |
|--------------|------------------------|-------------------|
| US-HOME-001  | AC-024 - AC-029        | UI Tests          |
| US-MOVIE-002 | AC-030 - AC-035        | CT-011, CT-012    |
| US-MOVIE-003 | AC-036 - AC-039        | CT-012, CT-013    |

**Total**: 3 User Stories | 16 Critérios de Aceitação | 4 Cenários de Teste