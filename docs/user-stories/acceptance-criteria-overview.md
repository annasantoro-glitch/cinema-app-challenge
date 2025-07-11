# Critérios de Aceitação Consolidados - Cinema App

Este documento consolida todos os critérios de aceitação organizados por módulo funcional.

---

## 🔐 AUTENTICAÇÃO & PERFIL (AUTH)

### US-AUTH-001 – Registro
- **AC-001**: Usuário pode inserir nome, e-mail e senha
- **AC-002**: Sistema valida o formato do e-mail e senha
- **AC-003**: Sistema impede registros de e-mails duplicados
- **AC-004**: Após o registro bem-sucedido, o usuário é redirecionado para a página de login, autenticado

### US-AUTH-002: Login
- **AC-005**: Usuário pode inserir e-mail e senha
- **AC-006**: Sistema autentica credenciais válidas
- **AC-007**: Sistema mantém sessão do usuário através de token JWT
- **AC-008**: Usuário é redirecionado para a página inicial após login bem-sucedido

### US-AUTH-003: Logout
- **AC-009**: Usuário pode fazer logout através do menu de navegação
- **AC-010**: Após o logout, rotas protegidas não são mais acessíveis
- **AC-011**: Token JWT é removido do localStorage

### US-AUTH-004: Perfil do Usuário
- **AC-012**: Perfil exibe nome do usuário, e-mail e função da conta
- **AC-013**: Usuário pode editar seu nome completo
- **AC-014**: Sistema indica visualmente os campos que foram alterados
- **AC-015**: Sistema confirma sucesso após salvar alterações
- **AC-016**: Interface exibe mensagem de confirmação após atualização bem-sucedida
- **AC-017**: Página de perfil é separada da página de reservas para melhor organização

---

## 🎬 FILMES (MOVIES)

### US-HOME-001 – Página Inicial
- **AC-018**: Página inicial exibe banner com informações sobre o cinema
- **AC-019**: Exibe uma seção destacada de "Filmes em Cartaz" com pôsteres em tamanho adequado
- **AC-020**: Links rápidos para principais áreas da aplicação
- **AC-021**: Acesso fácil à navegação principal através do cabeçalho
- **AC-022**: Usuários autenticados veem opções personalizadas no menu

### US-MOVIE-002: Lista de Filmes
- **AC-023**: Usuário pode visualizar uma lista dos filmes em exibição com layout em grid
- **AC-024**: Filmes são exibidos com pôster grande e de alta qualidade
- **AC-025**: Cards de filmes mostram título, classificação e gêneros
- **AC-026**: Cards incluem duração do filme e data de lançamento
- **AC-027**: Sistema adapta o layout para diferentes tamanhos de tela (responsivo)
- **AC-028**: Usuário consegue acessar detalhes do filme com um clique

### US-MOVIE-003 – Detalhes do filme
- **AC-029**: Detalhes incluem sinopse, elenco, diretor, data de lançamento, duração
- **AC-030**: Página de detalhes mostra pôster do filme
- **AC-031**: Página exibe horários de sessões disponíveis
- **AC-032**: Usuário pode navegar para a reserva a partir dos horários disponíveis

---

## 🎭 SESSÕES

### US-SESSION-001 – Exibição de sessões
- **AC-033**: Usuário pode ver horários disponíveis para um filme selecionado
- **AC-034**: Horários exibem data, hora, teatro e disponibilidade
- **AC-035**: Usuário pode navegar para a seleção de assentos de um horário

---

## 🎫 RESERVAS

### US-RESERVE-001 – Seleção de Assentos
- **AC-036**: Usuário pode visualizar o layout de assentos do teatro
- **AC-037**: Assentos são codificados por cores conforme disponibilidade
- **AC-038**: Usuário pode selecionar múltiplos assentos disponíveis
- **AC-039**: Usuário não pode selecionar assentos já reservados
- **AC-040**: Sistema mostra o subtotal à medida que os assentos são selecionados

### US-RESERVE-002 – Checkout
- **AC-041**: Usuário é redirecionado para a página de checkout após selecionar os assentos
- **AC-042**: Página de checkout exibe resumo dos assentos selecionados
- **AC-043**: Usuário pode visualizar o valor total da compra
- **AC-044**: Usuário pode selecionar um método de pagamento (cartão de crédito, débito, PIX, transferência)
- **AC-045**: Sistema processa o pagamento (simulado) e confirma a reserva
- **AC-046**: Usuário recebe confirmação visual do sucesso da reserva
- **AC-047**: Assentos selecionados são marcados como ocupados

### US-RESERVE-003 – Visualização de Reservas
- **AC-048**: Usuário pode acessar lista de suas reservas através do link "Minhas Reservas" no menu
- **AC-049**: Reservas são exibidas em formato de card com informações visuais claras
- **AC-050**: Cada reserva exibe filme, data, horário, cinema, assentos, status e método de pagamento
- **AC-051**: Usuário pode visualizar o pôster do filme associado à reserva
- **AC-052**: Sistema exibe indicadores visuais de status da reserva (confirmada, pendente, cancelada)
- **AC-053**: Usuário pode acessar página dedicada de reservas separada das informações de perfil

---

## 🎨 EXPERIÊNCIA DO USUÁRIO (UX)

### US-NAV-001 – Navegação e Interface
- **AC-054**: Cabeçalho está presente em todas as páginas com links para áreas principais
- **AC-055**: Menu é responsivo e se adapta a diferentes tamanhos de tela (versão móvel)
- **AC-056**: Usuário logado tem acesso à seções personalizadas como "Minhas Reservas" e "Perfil"
- **AC-057**: Breadcrumbs ou elementos de navegação indicam o caminho atual do usuário
- **AC-058**: Links diretos para retornar à página anterior quando apropriado
- **AC-059**: Feedback visual indica a página atual no menu de navegação

---

## 📊 Resumo Estatístico

| Módulo                    | User Stories | Critérios de Aceitação | Cenários de Teste |
|---------------------------|--------------|------------------------|-------------------|
| **Autenticação & Perfil** | 4            | AC-001 - AC-017 (17)   | CT-001 - CT-010   |
| **Filmes**                | 3            | AC-018 - AC-032 (15)   | CT-011 - CT-017   |
| **Sessões**               | 1            | AC-033 - AC-035 (3)    | CT-018 - CT-022   |
| **Reservas**              | 3            | AC-036 - AC-053 (18)   | CT-023 - CT-025   |
| **Experiência do Usuário**| 1            | AC-054 - AC-059 (6)    | UI Tests          |

**TOTAL GERAL**: 12 User Stories | 59 Critérios de Aceitação | 36 Cenários de Teste

---

## Rastreabilidade Completa

### Mapeamento US → AC → CT

| User Story     | Critérios       | Cenários de Teste      |
|----------------|-----------------|------------------------|
| US-AUTH-001    | AC-001 - AC-004 | CT-001 - CT-004        |
| US-AUTH-002    | AC-005 - AC-008 | CT-005 - CT-006        |
| US-AUTH-003    | AC-009 - AC-011 | CT-008                 |
| US-AUTH-004    | AC-012 - AC-017 | CT-007, CT-009, CT-010 |
| US-HOME-001    | AC-018 - AC-022 | UI Tests               |
| US-MOVIE-002   | AC-023 - AC-028 | CT-011, CT-012         |
| US-MOVIE-003   | AC-029 - AC-032 | CT-012, CT-013         |
| US-SESSION-001 | AC-033 - AC-035 | CT-018 - CT-022        |
| US-RESERVE-001 | AC-036 - AC-040 | CT-023, CT-024         |
| US-RESERVE-002 | AC-041 - AC-047 | CT-023, CT-020         |
| US-RESERVE-003 | AC-048 - AC-053 | CT-025                 |
| US-NAV-001     | AC-054 - AC-059 | UI Tests               |

---

## Notas de Implementação

- **Status**: Todos os critérios marcados como implementados
- **Cobertura**: 100% dos AC possuem cenários de teste correspondentes
- **Rastreabilidade**: Mapeamento completo entre US, AC e CT
- **Documentação**: Critérios organizados por módulo funcional para facilitar manutenção