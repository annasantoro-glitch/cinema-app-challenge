# Plano de Testes – Cinema App - Challenge Final

## Índice

- [Apresentação](#apresentação)
- [Objetivo](#objetivo)
- [Escopo](#escopo)
- [Ambiente de Testes](#ambiente-de-testes)
- [Análise Inicial](#análise-inicial)
- [Técnicas Aplicadas](#técnicas-aplicadas)
- [Cenários de Teste (Backend)](#cenários-de-teste-backend)
- [Matriz de Risco](#matriz-de-risco)
- [Matriz de Rastreabilidade](#matriz-de-rastreabilidade)
- [Visão de Cobertura](#visão-de-cobertura)

---

## Apresentação

Este plano tem como objetivo organizar e guiar as atividades de garantia de qualidade da API Cinema, com foco na cobertura funcional das rotas documentadas nas user stories, validação de regras de negócio e automação de fluxos ponta a ponta.

**Responsável:** Anna Santoro  
**Data de criação:** 23 de Junho de 2025  
**Última atualização:** 05 de Julho de 2025  
**Sprint:** 8 - Challenge Final  
**Ferramentas:** Postman, XMind, Confluence, Jira, Robot Framework, GitHub, MongoDB, Microsoft Excel e Notion

---

## Objetivo

Validar o comportamento funcional da API Cinema conforme os critérios definidos nas user stories, garantindo a qualidade, rastreabilidade e estabilidade das funcionalidades, com foco na jornada de autenticação, reserva e gerenciamento de sessões.

---

## Escopo

### Funcionalidades Incluídas:

- **Autenticação e Perfil**
- **Filmes**
- **Salas**
- **Sessões**
- **Reservas**
- **Usuários (Admin)**

### Tipos de Execução Contemplados:

- Testes manuais com Postman + Jira
- Testes exploratórios com foco em inconsistências de negócio e cenários negativos
- Testes automatizados com Robot Framework (API e UI)

---

## Ambiente de Testes

| Item | Valor |
|------|-------|
| **Sistema Operacional** | Windows 11 |
| **Navegador** | Google Chrome 135 64 bits |
| **Ferramentas** | Postman, XMind, Confluence, Jira, Robot Framework, GitHub, MongoDB |
| **API** | Cinema App (Versão 1.0.0) |
| **Ambiente** | Público (homologação) |
| **Tipos de Teste** | Funcional \| Manual \| Exploratório \| Automatizado |
| **Período de Execução** | 25/05/2025 - 03/06/2025 |

---

## Análise Inicial

### Documentos Utilizados e Anexos:

- [Github - Back-end](https://github.com/juniorschmitz/cinema-challenge-back)
- [Github - Front-end](https://github.com/juniorschmitz/cinema-challenge-front)

### User Stories:
- [Autenticação & Perfil](https://hsartori.atlassian.net/wiki/spaces/CI/pages/41582707/Autentica+o+Perfil+Auth?atlOrigin=eyJpIjoiZmY0NWUzODI2ZDdiNGI3ZTlkNzFlMTgwOTBmNDhkYzAiLCJwIjoiYyJ9)
- [Experiência do Usuário](https://hsartori.atlassian.net/wiki/spaces/CI/pages/41058455/Experi+ncia+do+Usu+rio?atlOrigin=eyJpIjoiYTllMjQ3OWFkNjAxNGM4ZGE3ZjExN2E0MWI0N2U3MTMiLCJwIjoiYyJ9)
- [Gerenciamento de Filmes](https://hsartori.atlassian.net/wiki/spaces/CI/pages/40763504/Gerenciamento+de+Filmes+Movies?atlOrigin=eyJpIjoiMzFkZWMxYTNkMTIwNDFjOWFiZjFjNWE5NWRjOTQ5ZjMiLCJwIjoiYyJ9)
- [Gerenciamento de Reservas](https://hsartori.atlassian.net/wiki/spaces/CI/pages/41058413/Gerenciamento+de+Reservas?atlOrigin=eyJpIjoiNGNhOWRmMzIxMjA5NDczYTllODRlYzFjZGYzYTYwMmQiLCJwIjoiYyJ9)
- [Gerenciamento de Sessão](https://hsartori.atlassian.net/wiki/spaces/CI/pages/41058392/Gerenciamento+de+Sess+o?atlOrigin=eyJpIjoiNDY4MDFhYTlhNmU4NGQ1ZmEwMTNjZGUzNzc4Y2RjMTIiLCJwIjoiYyJ9)

### Recursos Técnicos:
- [Mapa Mental - API](https://hsartori.atlassian.net/wiki/x/BoCVAg)
- [Cinema APP - Swagger UI](http://localhost:5000/api/v1/docs/)
- [Collection Postman](https://annasantoro.postman.co/workspace/Cinema-App---API~52c34ea6-ba49-4425-a7da-ed5c960ed0c9/folder/44114619-4681da9d-ec26-4762-8529-a80ba47ad1c5)
- [Relatório de Testes: Back-end](https://hsartori.atlassian.net/wiki/spaces/CI/pages/41058306)
- [Cards & Issues](https://hsartori.atlassian.net/jira/software/projects/CA/boards/166)

---

## Técnicas Aplicadas

- **Testes baseados em requisitos** e critérios de aceitação (Caixa Preta)
- **Particionamento de Equivalência** e Análise de Valor Limite (foco nos campos de entrada e cenários válidos/inválidos)
- **Testes exploratórios** leves, sem heurísticas específicas, utilizados apenas para identificar comportamentos inesperados e validar cenários negativos
- **Automação com abordagem modular**, utilizando dados dinâmicos e reutilização de passos via Robot Framework
- **Utilização de Mapa Mental** para organização e modelagem dos testes, fluxos principais e regras de negócio

### Mapas Mentais da Aplicação:
- [Mapas Mentais](./mind%20map/) - Arquivos locais em PNG
- [Arquivo Estendido XMind](https://xmind.ai/share/f15ko1WG?xid=0YoXclA0) - Versão interativa

---

## Cenários de Teste Manuais (Backend)

| ID | Endpoint | Cenário | Tipo | Prioridade | Status |
|---|---|---|---|---|---|
| CT-001 | POST /auth/register | Registro de novo usuário com dados válidos | Funcional | Alto | Executado |
| CT-002 | POST /auth/register | Registro com e-mail duplicado | Validação | Alto | Executado |
| CT-003 | POST /auth/register | Registro com e-mail inválido | Validação | Média | Executado |
| CT-004 | POST /auth/register | Registro com senha fraca | Validação | Média | Executado |
| CT-005 | POST /auth/login | Login com credenciais válidas | Autenticação | Crítica | Executado |
| CT-006 | POST /auth/login | Login com senha inválida | Validação | Crítica | Executado |
| CT-007 | GET /auth/me | Consulta ao perfil com token válido | Funcional | Alto | Falha detectada |
| CT-008 | GET /auth/me | Consulta ao perfil sem token | Segurança | Crítica | Falha detectada |
| CT-009 | GET /auth/me | Consulta ao perfil com token inválido | Segurança | Crítica | Executado |
| CT-010 | PUT /auth/profile | Atualização de nome no perfil | Funcional | Média | Falha detectada |
| CT-011 | GET /movies | Listar todos os filmes | Consulta | Alto | Executado |
| CT-012 | GET /movies/{id} | Obter detalhes de um filme válido | Consulta | Alto | Executado |
| CT-013 | GET /movies/{id} | Obter detalhes com ID inválido | Validação | Alto | Falha detectada |
| CT-014 | POST /movies | Criar um novo filme (admin) | Funcional | Alto | Falha detectada |
| CT-015 | POST /movies | Criar filme sem token | Segurança | Crítica | Falha detectada |
| CT-016 | PUT /movies/{id} | Atualizar dados de um filme (admin) | Funcional | Média | Falha detectada |
| CT-017 | DELETE /movies/{id} | Deletar um filme com token válido | Funcional | Alto | Falha detectada |
| CT-018 | POST /sessions | Criar sessão com dados válidos | Funcional | Alto | Falha detectada |
| CT-019 | GET /sessions | Listar sessões disponíveis | Consulta | Alto | Falha detectada |
| CT-020 | GET /sessions/{id} | Consultar assentos ocupados | Validação | Alto | Falha detectada |
| CT-021 | PUT /sessions/{id}/reset-seats | Resetar assentos de uma sessão | Funcional | Alto | Falha detectada |
| CT-022 | DELETE /sessions/{id} | Deletar sessão válida | Funcional | Alto | Falha detectada |
| CT-023 | POST /reservations | Seleção de múltiplos assentos | Funcional | Crítica | Falha detectada |
| CT-024 | POST /reservations | Tentativa de reservar assentos ocupados | Validação | Alto | Falha detectada |
| CT-025 | DELETE /reservations/{id} | Deletar uma reserva existente | Funcional | Alto | Falha detectada |
| CT-026 | GET /users | Listar usuários (admin) | Consulta | Média | Falha detectada |
| CT-027 | GET /users | Listagem sem token | Segurança | Crítica | Falha detectada |
| CT-028 | PUT /users/{id} | Atualizar usuário (admin) | Funcional | Média | Falha detectada |
| CT-029 | DELETE /users/{id} | Deletar usuário (admin) | Funcional | Alto | Falha detectada |
| CT-030 | DELETE /users/{id} | Deletar usuário com reservas ativas | Validação | Média | Falha detectada |
| CT-031 | POST /theaters | Criar nova sala | Funcional | Alto | Falha detectada |
| CT-032 | POST /theaters | Criar sala com campo obrigatório ausente | Validação | Média | Falha detectada |
| CT-033 | PUT /theaters/{id} | Atualizar dados de uma sala | Funcional | Média | Falha detectada |
| CT-034 | GET /theaters | Listar todas as salas | Consulta | Alto | Falha detectada |
| CT-035 | DELETE /theaters/{id} | Deletar sala sem sessões vinculadas | Funcional | Alto | Falha detectada |
| CT-036 | DELETE /theaters/{id} | Deletar sala com sessões ativas | Validação | Alto | Falha detectada |

### Resumo de Execução:
- **Total de Cenários**: 36
- **Executados com Sucesso**: 8 (22%)
- **Falhas Detectadas**: 28 (78%)
- **Cobertura de Endpoints**: 100%

### Legenda de Cores:
🔵 **Azul** = Não iniciado | 🔴 **Vermelho** = Falha detectada | 🟢 **Verde** = Executado (sucesso) | 🟡 **Amarelo** = Bloqueado

### Priorização dos Testes:

- **Crítica**: Segurança, login, persistência de sessão, processamento de reserva
- **Alta**: Cadastro, bloqueios de assento, checkout, dados obrigatórios
- **Média**: Interface de reservas, feedbacks visuais, perfil
- **Baixa**: Layouts, navegação entre telas

*Critérios de priorização definidos com base no impacto ao negócio e complexidade de falha.*

---

## Matriz de Risco

| ID | Cenário | Impacto | Probabilidade | Risco |
|---|---|---|---|---|
| CT-001 | Registro de novo usuário | 🟡 Médio | 🟢 Baixa | 🟢 Baixo |
| CT-002 | Registro com e-mail duplicado | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-003 | Registro com e-mail inválido | 🟢 Baixo | 🟡 Média | 🟢 Baixo |
| CT-004 | Registro com senha fraca | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-005 | Login com credenciais válidas | 🔴 Crítico | 🟢 Baixa | 🟠 Alto |
| CT-006 | Login com senha inválida | 🔴 Crítico | 🟡 Média | 🔴 Crítico |
| CT-007 | Consulta ao perfil com token | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-008 | Consulta ao perfil sem token | 🔴 Crítico | 🟠 Alta | 🔴 Crítico |
| CT-009 | Consulta com token inválido | 🔴 Crítico | 🟡 Média | 🔴 Crítico |
| CT-010 | Atualização de perfil | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-011 | Listar todos os filmes | 🟡 Médio | 🟢 Baixa | 🟢 Baixo |
| CT-012 | Detalhes de filme válido | 🟡 Médio | 🟢 Baixa | 🟢 Baixo |
| CT-013 | Detalhes com ID inválido | 🟢 Baixo | 🟡 Média | 🟢 Baixo |
| CT-014 | Criar novo filme (admin) | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-015 | Criar filme sem token | 🟠 Alto | 🟠 Alta | 🔴 Crítico |
| CT-016 | Atualizar filme (admin) | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-017 | Deletar filme | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-018 | Criar sessão | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-019 | Listar sessões | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-020 | Consultar assentos ocupados | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-021 | Resetar assentos | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-022 | Deletar sessão | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-023 | Seleção de assentos | 🔴 Crítico | 🟠 Alta | 🔴 Crítico |
| CT-024 | Reservar assentos ocupados | 🟠 Alto | 🟠 Alta | 🔴 Crítico |
| CT-025 | Deletar reserva | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-026 | Listar usuários (admin) | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-027 | Listagem sem token | 🟠 Alto | 🟠 Alta | 🔴 Crítico |
| CT-028 | Atualizar usuário (admin) | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-029 | Deletar usuário (admin) | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-030 | Deletar usuário com reservas | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-031 | Criar nova sala | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-032 | Criar sala sem campo obrigatório | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-033 | Atualizar dados de sala | 🟡 Médio | 🟡 Média | 🟡 Médio |
| CT-034 | Listar todas as salas | 🟡 Médio | 🟢 Baixa | 🟢 Baixo |
| CT-035 | Deletar sala sem sessões | 🟠 Alto | 🟡 Média | 🟠 Alto |
| CT-036 | Deletar sala com sessões ativas | 🟠 Alto | 🟡 Média | 🟠 Alto |

### Legenda da Matriz de Risco:
🟢 **Verde** = Baixo | 🟡 **Amarelo** = Médio | 🟠 **Laranja** = Alto | 🔴 **Vermelho** = Crítico

### Resumo de Riscos:
- **Crítico**: 7 cenários (19%)
- **Alto**: 12 cenários (33%)
- **Médio**: 11 cenários (31%)
- **Baixo**: 6 cenários (17%)

---

## Matriz de Rastreabilidade

| US | AC | Tipo | Requisito | Cenários de Teste | Prioridade | Criticidade |
|---|---|---|---|---|---|---|
| US-AUTH-001 | AC-001 | Backend | Usuário pode inserir nome, e-mail e senha | CT-001 | Alta | 🟠 Alta |
| US-AUTH-001 | AC-002 | Backend | Sistema valida formato do e-mail e senha | CT-003, CT-004 | Média | 🟡 Média |
| US-AUTH-001 | AC-003 | Backend | Sistema impede registros de e-mails duplicados | CT-002 | Alta | 🟠 Alta |
| US-AUTH-001 | AC-004 | Híbrido | Redirecionamento após registro bem-sucedido | CT-001 | Alta | 🟠 Alta |
| US-AUTH-002 | AC-005 | Backend | Usuário pode inserir e-mail e senha | CT-005, CT-006 | Crítica | 🔴 Crítica |
| US-AUTH-002 | AC-006 | Backend | Sistema autentica credenciais válidas | CT-005, CT-006 | Crítica | 🔴 Crítica |
| US-AUTH-002 | AC-007 | Backend | Sistema mantém sessão via token JWT | CT-005 | Crítica | 🔴 Crítica |
| US-AUTH-002 | AC-008 | Híbrido | Redirecionamento após login bem-sucedido | CT-005 | Crítica | 🔴 Crítica |
| US-AUTH-003 | AC-009 | Frontend | Logout através do menu de navegação | Exploratório | Média | 🟡 Média |
| US-AUTH-003 | AC-010 | Backend | Rotas protegidas inacessíveis após logout | CT-008 | Crítica | 🔴 Crítica |
| US-AUTH-003 | AC-011 | Frontend | Token JWT removido do localStorage | Exploratório | Média | 🟡 Média |
| US-AUTH-004 | AC-012 | Backend | Perfil exibe nome, e-mail e função | CT-007 | Alta | 🟠 Alta |
| US-AUTH-004 | AC-013 | Backend | Usuário pode editar nome completo | CT-010 | Média | 🟡 Média |
| US-AUTH-004 | AC-014 | Frontend | Indicação visual de campos alterados | Exploratório | Baixa | 🟢 Baixa |
| US-AUTH-004 | AC-015 | Backend | Sistema confirma sucesso após salvar | CT-010 | Média | 🟡 Média |
| US-AUTH-004 | AC-016 | Frontend | Mensagem de confirmação após atualização | Exploratório | Baixa | 🟢 Baixa |
| US-AUTH-004 | AC-017 | Frontend | Página de perfil separada de reservas | Exploratório | Baixa | 🟢 Baixa |
| US-HOME-001 | AC-018 | Frontend | Página inicial exibe banner do cinema | Exploratório | Média | 🟡 Média |
| US-HOME-001 | AC-019 | Frontend | Seção "Filmes em Cartaz" com pôsteres | Exploratório | Média | 🟡 Média |
| US-HOME-001 | AC-020 | Frontend | Links rápidos para áreas principais | Exploratório | Baixa | 🟢 Baixa |
| US-HOME-001 | AC-021 | Frontend | Acesso fácil à navegação principal | Exploratório | Baixa | 🟢 Baixa |
| US-HOME-001 | AC-022 | Frontend | Opções personalizadas para autenticados | Exploratório | Média | 🟡 Média |
| US-MOVIE-002 | AC-023 | Frontend | Lista de filmes em layout grid | Exploratório | Alta | 🟠 Alta |
| US-MOVIE-002 | AC-024 | Frontend | Pôsteres grandes e de alta qualidade | Exploratório | Média | 🟡 Média |
| US-MOVIE-002 | AC-025 | Frontend | Cards mostram título, classificação, gêneros | Exploratório | Média | 🟡 Média |
| US-MOVIE-002 | AC-026 | Frontend | Cards incluem duração e data de lançamento | Exploratório | Média | 🟡 Média |
| US-MOVIE-002 | AC-027 | Frontend | Layout responsivo para diferentes telas | Exploratório | Média | 🟡 Média |
| US-MOVIE-002 | AC-028 | Híbrido | Acesso a detalhes do filme com um clique | CT-011, CT-012 | Alta | 🟠 Alta |
| US-MOVIE-003 | AC-029 | Backend | Detalhes incluem sinopse, elenco, diretor | CT-012 | Alta | 🟠 Alta |
| US-MOVIE-003 | AC-030 | Frontend | Página de detalhes mostra pôster | Exploratório | Média | 🟡 Média |
| US-MOVIE-003 | AC-031 | Híbrido | Página exibe horários de sessões | CT-019 | Alta | 🟠 Alta |
| US-MOVIE-003 | AC-032 | Híbrido | Navegação para reserva via horários | CT-019 | Alta | 🟠 Alta |
| US-SESSION-001 | AC-033 | Backend | Horários disponíveis para filme selecionado | CT-019 | Alta | 🟠 Alta |
| US-SESSION-001 | AC-034 | Backend | Horários exibem data, hora, teatro | CT-019 | Alta | 🟠 Alta |
| US-SESSION-001 | AC-035 | Híbrido | Navegação para seleção de assentos | CT-020 | Alta | 🟠 Alta |
| US-RESERVE-001 | AC-036 | Frontend | Visualizar layout de assentos do teatro | Exploratório | Crítica | 🔴 Crítica |
| US-RESERVE-001 | AC-037 | Frontend | Assentos codificados por cores | Exploratório | Alta | 🟠 Alta |
| US-RESERVE-001 | AC-038 | Híbrido | Seleção de múltiplos assentos | CT-023 | Crítica | 🔴 Crítica |
| US-RESERVE-001 | AC-039 | Backend | Impedir seleção de assentos reservados | CT-024 | Alta | 🟠 Alta |
| US-RESERVE-001 | AC-040 | Frontend | Subtotal conforme assentos selecionados | Exploratório | Média | 🟡 Média |
| US-RESERVE-002 | AC-041 | Frontend | Redirecionamento para checkout | Exploratório | Alta | 🟠 Alta |
| US-RESERVE-002 | AC-042 | Frontend | Checkout exibe resumo dos assentos | Exploratório | Alta | 🟠 Alta |
| US-RESERVE-002 | AC-043 | Frontend | Visualizar valor total da compra | Exploratório | Alta | 🟠 Alta |
| US-RESERVE-002 | AC-044 | Frontend | Seleção de método de pagamento | Exploratório | Alta | 🟠 Alta |
| US-RESERVE-002 | AC-045 | Backend | Processamento e confirmação da reserva | CT-023 | Crítica | 🔴 Crítica |
| US-RESERVE-002 | AC-046 | Frontend | Confirmação visual do sucesso | Exploratório | Alta | 🟠 Alta |
| US-RESERVE-002 | AC-047 | Backend | Assentos marcados como ocupados | CT-020 | Alta | 🟠 Alta |
| US-RESERVE-003 | AC-048 | Frontend | Acesso via link "Minhas Reservas" | Exploratório | Média | 🟡 Média |
| US-RESERVE-003 | AC-049 | Frontend | Reservas em formato de card | Exploratório | Média | 🟡 Média |
| US-RESERVE-003 | AC-050 | Frontend | Card exibe filme, data, horário, status | Exploratório | Média | 🟡 Média |
| US-RESERVE-003 | AC-051 | Frontend | Visualizar pôster do filme associado | Exploratório | Baixa | 🟢 Baixa |
| US-RESERVE-003 | AC-052 | Frontend | Indicadores visuais de status | Exploratório | Média | 🟡 Média |
| US-RESERVE-003 | AC-053 | Frontend | Página dedicada separada do perfil | Exploratório | Baixa | 🟢 Baixa |
| US-NAV-001 | AC-054 | Frontend | Cabeçalho presente em todas as páginas | Exploratório | Média | 🟡 Média |
| US-NAV-001 | AC-055 | Frontend | Menu responsivo para diferentes telas | Exploratório | Média | 🟡 Média |
| US-NAV-001 | AC-056 | Frontend | Seções personalizadas para logados | Exploratório | Média | 🟡 Média |
| US-NAV-001 | AC-057 | Frontend | Breadcrumbs indicam caminho atual | Exploratório | Baixa | 🟢 Baixa |
| US-NAV-001 | AC-058 | Frontend | Links para retornar à página anterior | Exploratório | Baixa | 🟢 Baixa |
| US-NAV-001 | AC-059 | Frontend | Feedback visual da página atual | Exploratório | Baixa | 🟢 Baixa |

### Legenda de Tipos:
- **Backend**: Testes de API realizados
- **Frontend**: Testes exploratórios de UI previstos
- **Híbrido**: Envolve tanto API quanto UI

### Resumo da Matriz:
- **Total de AC**: 59 critérios
- **Backend**: 17 AC (29%)
- **Frontend**: 32 AC (54%)
- **Híbrido**: 10 AC (17%)
- **Cobertura de Testes**: 36 CT + Testes Exploratórios

**Observação**: Requisitos de UI foram testados exploratoriamente. Um planejamento específico de testes exploratórios para frontend será adicionado, detalhando a execução prevista.

---

## Visão de Cobertura

### Acceptance Criteria Coverage:
- **Total de critérios de aceite identificados**: 59
- **Critérios cobertos por cenários de teste**: 27 (17 Backend + 10 Híbrido)
- **Cobertura**: 45.8%

**Observação**: Os critérios não cobertos estão concentrados nas user stories de **US-HOME-001**, **US-MOVIE-002**, **US-RESERVE-001/002/003** e **US-NAV-001**, que dependem de fluxos compostos ou testes integrados UI+API.

### Path Coverage:
- **Total de fluxos identificados**: 36
- **Fluxos cobertos por testes**: 32
- **Cobertura**: 88.9%

### API Coverage:
- **Total de endpoints da API**: 28
- **Endpoints com testes mapeados**: 26
- **Cobertura**: 92.9%

**Observação**: A cobertura é alta e contempla os principais métodos (GET, POST, PUT, DELETE). Endpoints não testados estão relacionados a funções administrativas ou de auditoria com menor frequência de uso ou com acesso bloqueado.

### UI Coverage:
- **Total de telas/componentes UI identificados**: 42
- **Itens de UI com testes**: 38 (Testes Exploratórios)
- **Cobertura**: 90.5%

**Observação**: As principais telas (login, dashboard, cadastro de reserva) estão cobertas por testes exploratórios. Os 4 itens pendentes são componentes reativos (ex: modais de erro e tooltips), priorizados para testes manuais visuais.

### Tabela Comparativa de Cobertura:

| Tipo de Cobertura                | Itens Cobertos | Total de Itens | Cobertura (%) |
|----------------------------------|----------------|----------------|---------------|
| **Acceptance Criteria Coverage** | 27             | 59             | 45.8%         |
| **Path Coverage**                | 32             | 36             | 88.9%         |
| **API Coverage**                 | 26             | 28             | 92.9%         |
| **UI Coverage**                  | 38             | 42             | 90.5%         |

---

## Plano de Ação Para Automação

### 1º Passo – Montar Testes Prioritários (com base nos happy paths)
- Usar os ACs marcados como UI ou Híbrido, não cobertos pela API
- Separar cenários de teste em:
  - **Testado via API**
  - **Testado via UI** 
  - **Exploratórios Manuais**

### 2º Passo – Automatizar esses testes com:
- Padronização dos nomes das User Stories e ACs em inglês
- Ajustar o mapeamento de elementos com base na estrutura real do front

### Comparativo Visual

| Tipo de AC | Abordagem Recomendável |
|------------|------------------------|
| API | Coberto via testes manuais e automatizados (Robot + Postman) |
| UI – Visual, navegação, mensagens | Testes exploratórios ou smoke test |
| UI – Fluxos principais (happy path) | Automatizar com Robot Framework |
| Híbridos | Automatizar o que for crítico |

### Priorização para Automação UI

#### 🔴 Críticos (Automatizar primeiro):
- **AC-008**: Redirecionamento após login bem-sucedido
- **AC-028**: Acesso a detalhes do filme com um clique
- **AC-031**: Página exibe horários de sessões
- **AC-032**: Navegação para reserva via horários
- **AC-035**: Navegação para seleção de assentos
- **AC-038**: Seleção de múltiplos assentos

#### 🟠 Alta Prioridade (Smoke tests):
- **AC-023**: Lista de filmes em layout grid
- **AC-041**: Redirecionamento para checkout
- **AC-042**: Checkout exibe resumo dos assentos
- **AC-043**: Visualizar valor total da compra
- **AC-044**: Seleção de método de pagamento
- **AC-046**: Confirmação visual do sucesso

#### 🟡 Média Prioridade (Exploratórios):
- Componentes visuais e de navegação
- Responsividade e layout
- Mensagens de feedback

### 3º Passo – Documentar os Testes em relatórios próprios: API vs. UI

Usar uma estrutura simples com:
- **ID do AC**
- **Título**
- **Prioridade**
- **Passos**
- **Observações do que validar**
- **Status** (OK, Bug encontrado, Comportamento esperado...)

#### Estrutura de Relatório Sugerida:

```
| AC ID | Título | Prioridade | Tipo | Passos | Validações | Status | Observações |
|-------|--------|------------|------|--------|------------|--------|-------------|
| AC-XXX | Descrição | 🔴/🟠/🟡 | API/UI/Híbrido | 1. Passo 1<br>2. Passo 2 | - Validação 1<br>- Validação 2 | ✅ OK / ❌ Bug / ⚠️ Parcial | Detalhes adicionais |
```

#### Categorias de Status:
- **✅ OK**: Funcionalidade atende completamente ao AC
- **❌ Bug**: Erro identificado, necessita correção
- **⚠️ Parcial**: Funciona parcialmente, melhorias necessárias
- **🔄 Pendente**: Aguardando correções para teste
- **❓ Indefinido**: Comportamento não claro, necessita esclarecimento

---

## Planejamento de Automação (Não Implementado)

**Estrutura Idealizada para Robot Framework:**

```
automated-tests/
├── resources/
│   ├── common/
│   │   ├── base.resource
│   │   └── variables.resource
│   ├── api/
│   │   ├── authentication.resource
│   │   ├── movies.resource
│   │   ├── sessions.resource
│   │   └── reservations.resource
│   ├── pages/
│   │   ├── LoginPage.resource
│   │   ├── MoviesPage.resource
│   │   └── ReservationPage.resource
│   └── services/
│       ├── LoginService.resource
│       └── MovieService.resource
├── tests/
│   ├── api_backend/
│   │   ├── auth_tests.robot
│   │   └── movies_tests.robot
│   └── ui_frontend/
│       ├── auth_tests.robot
│       └── navigation_tests.robot
└── results/
```

**Observação**: Esta estrutura foi planejada seguindo boas práticas de automação com separação de responsabilidades (Page Objects, Services, Resources). Devido à instabilidade da API identificada durante os testes manuais e curto tempo de execução de testes, optou-se por focar nos testes exploratórios e documentação dos bugs encontrados, conforme descrito no Relatório de Testes.

---

## Documentação Relacionada

- [User Stories](./user-stories/) - Requisitos e critérios de aceitação
- [Cenários de Teste](./test-scenarios.md) - Casos de teste detalhados
- [Critérios de Aceitação](./user-stories/criterios-aceitacao-consolidados.md) - AC consolidados
- [Guia de Testes Manuais](../manual-tests/) - Diretrizes de execução
- [Relatório de Testes]