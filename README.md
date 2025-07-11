# 🎬 Cinema App Challenge

![Status](https://img.shields.io/badge/status-v1.0%20released-green)
![Sprint](https://img.shields.io/badge/sprint-08-blue)
![Semana](https://img.shields.io/badge/semana-15-lightgrey)
![Tech](https://img.shields.io/badge/Robot_Framework-✓-green)
![Type](https://img.shields.io/badge/Testes_Automatizados-Fullstack-blue)

---

## Descrição Geral

Este repositório contém a implementação completa de testes (manuais e automatizados) aplicados à aplicação *Cinema App* — um sistema de gerenciamento de filmes com operações de CRUD, autenticação e reservas. O projeto foi desenvolvido como parte do **Challenge Final** da trilha de QA, demonstrando domínio sobre planejamento estratégico, execução de testes, automação e documentação técnica.

### 📊 Resumo do Projeto
- **29 Cenários Automatizados** com Robot Framework
- **36 Cenários Manuais** via Postman
- **6 Módulos de Resources** com keywords reutilizáveis
- **Documentação Completa** com planos, relatórios e inovações
- **Cobertura Abrangente** de API, UI exploratória e fluxos híbridos

### 🏆 Destaques Técnicos
- **Arquitetura Modular**: Resources reutilizáveis e estrutura escalável
- **Documentação Profissional**: Planos estratégicos, mapas mentais e relatórios
- **Boas Práticas**: Workflow Git, nomenclatura padronizada e code review
- **Inovação**: Propostas de CI/CD e monitoramento automatizado
- **Rastreabilidade**: 100% de mapeamento US → AC → Cenários de Teste

---

## Índice

- [Descrição Geral](#descrição-geral)
- [Pré-requisitos](#pré-requisitos)
- [Como Executar](#como-executar)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura Técnica](#estrutura-técnica)
- [Workflow de Desenvolvimento](#workflow-de-desenvolvimento)
- [Documentação e Planejamento](#documentação-e-planejamento)
- [Resultados e Relatórios](#resultados-e-relatórios)
- [Cobertura de Testes](#cobertura-de-testes)
- [Versão em Inglês](#english-version)
- [Colaboração](#colaboração)
- [Créditos](#créditos)
- [Referências Externas](#referências-externas)
- [Sobre Mim](#sobre-mim)
- [Status do Projeto](#status-do-projeto)

---

## Pré-requisitos

- Python 3.8+
- Robot Framework
- RequestsLibrary
- Acesso à API Cinema App

## Como Executar

### Instalação
```bash
pip install robotframework
pip install robotframework-requests
```

### Configuração
1. Configure as variáveis de ambiente no arquivo `automated-tests/resources/variables/variables.resource`
2. Ajuste as URLs da API conforme necessário
3. Certifique-se de que a API Cinema App esteja rodando

### Execução dos Testes
```bash
# Executar todos os testes automatizados
robot automated-tests/tests/

# Executar suíte específica
robot automated-tests/tests/auth_tests.robot

# Executar com tags específicas
robot --include api automated-tests/tests/

# Executar com relatório personalizado
robot --outputdir automated-tests/results automated-tests/tests/
```

### Relatórios
Após a execução, os relatórios são gerados em:
- `log.html` - Log detalhado
- `report.html` - Relatório resumido
- `output.xml` - Dados estruturados

---

## Tecnologias Utilizadas

- **Jira** para controle de issues e bugs
- **Robot Framework** para testes automatizados
- **Postman** para testes manuais
- **XMind** para mapeamento mental
- **GitHub** para versionamento
- **MongoDB Atlas** para hospedagem e controle do banco de dados
- **Swagger** para leitura técnica da APIs e documentação dos endpoints

---

## Estrutura Técnica

> O projeto está focado na automação de testes de API usando Robot Framework, com estrutura organizada para recursos reutilizáveis e suítes de teste abrangentes.

```bash
cinema-project/
├── automated-tests/         # Testes automatizados Robot Framework
│   ├── resources/           # Keywords e variáveis reutilizáveis
│   │   ├── variables/       # Configurações e variáveis base
│   │   ├── auth.resource    # Keywords de autenticação
│   │   ├── movies.resource  # Keywords de filmes
│   │   ├── reservations.resource # Keywords de reservas
│   │   ├── sessions.resource # Keywords de sessões
│   │   ├── theaters.resource # Keywords de teatros
│   │   └── users.resource   # Keywords de usuários
│   ├── tests/               # Suítes de teste automatizadas
│   │   ├── auth_tests.robot
│   │   ├── movies_tests.robot
│   │   ├── reservations_tests.robot
│   │   ├── sessions_tests.robot
│   │   ├── theaters_tests.robot
│   │   └── users_tests.robot
│   └── results/             # Resultados de execução
├── docs/                    # Documentação e planejamento
│   ├── mind map/            # Mapas mentais em PNG
│   ├── user-stories/        # User Stories e critérios de aceitação
│   ├── innovation-roadmap.md # Roadmap de inovações
│   ├── test-cases.md        # Casos de teste detalhados
│   └── test-plan-backend.md # Plano de testes backend
├── manual-tests/            # Testes manuais e coleções Postman
│   ├── Cinema App.postman_collection.json
│   ├── Cinema App.postman_environments_globals.json
│   └── README.md
├── README-en.md             # Versão em inglês
└── README.md                # Documentação principal
```

---

## Workflow de Desenvolvimento

### Estrutura de Branches
- **main**: Branch principal e estável → Contém a versão final e integrada do projeto. Apenas merge via Pull Request após revisão e testes
- **develop**: Ambiente de integração contínua → Reúne as entregas das features de automação, documentação e testes

### Branches por Escopo Funcional
- **feature/automation**: Automação da API e UI com Robot Framework → Inclui criação de testes, keywords e setup (backend), interface gráfica com Selenium, mapeamento de elementos e scripts visuais (frontend)
- **feature/docs**: Documentação geral → README.md, diagramas, plano de testes, mapas mentais, rastreabilidade, matriz de risco

### Boas Práticas
- Usar nomenclatura kebab-case (ex: `feature/docs-matriz-risco`)
- Commits atômicos e mensagens com padrão: `feat:`, `test:`, `fix:`, `docs:`, `refactor:`
- Pull Requests obrigatórios para merge na main
- Code review antes da integração

---

## Documentação e Planejamento

Todos os arquivos de documentação estão disponíveis na pasta [`/docs`](./docs) deste repositório:

### Documentação Principal:
- **test-plan-backend.md** - Plano estratégico de testes backend
- **test-cases.md** - Casos de teste detalhados
- **test-execution-report.md** - Relatório de execução e análise
- **innovation-roadmap.md** - Roadmap de inovações propostas

### User Stories:
- **user-stories/** - Diretório com todas as User Stories organizadas por módulo
- **acceptance-criteria-overview.md** - Visão geral dos critérios de aceitação

### Mapas Mentais:
- **mental-map (auth-info-movies).png** - Mapeamento de autenticação e filmes
- **mental-map (reservations-sessions-setup).png** - Mapeamento de reservas e sessões
- **mental-map (theaters-users).png** - Mapeamento de teatros e usuários

### Testes Manuais:
- **manual-tests/** - Coleções Postman e guias de execução

---

## Resultados e Relatórios

Os resultados dos testes são armazenados no diretório `/automated-tests/results` e incluem:

- **log.html** - Log detalhado de execução com screenshots
- **report.html** - Relatório resumido com estatísticas
- **output.xml** - Dados estruturados para integração CI/CD

### Como Interpretar os Resultados
- ✅ **PASS** - Teste executado com sucesso
- ❌ **FAIL** - Teste falhou, verificar log para detalhes
- **Tempo de Execução** - Performance dos endpoints
- **Tags** - Categorização dos testes (api, positivo, negativo)

### Troubleshooting Comum
- **Erro 401**: Verificar token de autenticação
- **Erro 403**: Verificar permissões de usuário
- **Timeout**: Verificar conectividade com a API
- **Dados duplicados**: Limpar base de dados de teste

---

## Cobertura de Testes

### Resumo de Cobertura
- **29 Cenários Automatizados** (Robot Framework)
- **36 Cenários Manuais** (Postman)
- **13 Endpoints Principais** testados
- **6 Módulos Funcionais** cobertos

### Endpoints Testados

| Módulo | Endpoint | Métodos | Autenticação | Status |
|--------|----------|---------|--------------|--------|
| **Auth** | `/auth/register` | POST | ❌ | ✅ |
| **Auth** | `/auth/login` | POST | ❌ | ✅ |
| **Auth** | `/auth/me` | GET, PUT | ✅ | ✅ |
| **Movies** | `/movies` | GET, POST | POST: ✅ | ✅ |
| **Movies** | `/movies/{id}` | GET, PUT, DELETE | PUT/DELETE: ✅ | ✅ |
| **Users** | `/users` | GET, POST | GET: ✅ | ✅ |
| **Users** | `/users/{id}` | GET, PUT, DELETE | ✅ | ✅ |
| **Theaters** | `/theaters` | GET, POST | POST: ✅ | ✅ |
| **Theaters** | `/theaters/{id}` | GET, PUT, DELETE | PUT/DELETE: ✅ | ✅ |
| **Sessions** | `/sessions` | GET, POST | POST: ✅ | ✅ |
| **Sessions** | `/sessions/{id}` | GET, PUT, DELETE | PUT/DELETE: ✅ | ✅ |
| **Reservations** | `/reservations` | GET, POST | ✅ | ✅ |
| **Reservations** | `/reservations/{id}` | GET, DELETE | ✅ | ✅ |

### Tipos de Teste Implementados
- **🟢 Testes Positivos**: Fluxos de sucesso (happy path)
- **🔴 Testes Negativos**: Validações de erro e edge cases
- **🔒 Testes de Segurança**: Autenticação e autorização
- **📊 Testes de Validação**: Integridade de dados e formatos
- **🔍 Testes Exploratórios**: Validação manual de UI e fluxos

### Cenários de Teste Cobertos
- **Autenticação**: Registro, login, perfil, tokens
- **Autorização**: Admin vs usuário comum, controle de acesso
- **CRUD Completo**: Criar, ler, atualizar, deletar
- **Validações**: Dados obrigatórios, formatos, duplicatas
- **Casos Negativos**: Dados inválidos, não autorizados
- **Integridade**: Relacionamentos entre entidades

---

## Status do Projeto

### Versão Atual: v1.0
**Entregues:**
- ✅ Planejamento estratégico completo
- ✅ 29 cenários automatizados (Robot Framework)
- ✅ 36 cenários manuais (Postman)
- ✅ Documentação técnica abrangente
- ✅ Análise de cobertura e relatórios
- ✅ Roadmap de inovações

### Roadmap Futuro (v2.0)
**Planejado para desenvolvimento futuro:**
- 🔄 Expansão de cenários bad path
- 🔄 Cobertura completa de endpoints restantes
- 🔄 Refinamento da automação API
- 🔄 Mapeamento de elementos HTML
- 🔄 Implementação de automação UI
- 🔄 Pipeline CI/CD com GitHub Actions

**Nota:** Este projeto representa uma base sólida e funcional para testes de API, com documentação profissional e estrutura escalável para futuras expansões.

---

## Colaboração

Gostaria de agradecer à minha squad pelo apoio e auxílio durante o desenvolvimento deste projeto, seja através de suporte técnico direto ou conselhos indiretos que foram fundamentais para o sucesso da implementação:

### 🦇 Squad Gotham
- [Ádony Lagares](https://www.linkedin.com/in/adony-lagares/)
- [Ana Carolina Rosa](https://www.linkedin.com/in/ana-carolina-correa-rosa/)
- [Marcos Paulo Freitas](https://www.linkedin.com/in/marcos-freitas/)

---

## Créditos

Este projeto foi desenvolvido com base na aplicação **Cinema App**, criada por Jacques Schmitz.

📎GitHub: [juniorschmitz](https://github.com/juniorschmitz)  
📎LinkedIn: [Jacques Schmitz](https://www.linkedin.com/in/jacques-schmitz-junior)

---

## Referências Externas

- [Repositório original do back-end](https://github.com/juniorschmitz/cinema-challenge-back)
- [Repositório original do front-end](https://github.com/juniorschmitz/cinema-challenge-front)

---

## Sobre Mim

Meu nome é **Anna Santoro**, sou estudante de TI na Unicesumar e atualmente estagiária na Compass UOL, com foco em Quality Assurance e automação. Tenho interesse tanto em áreas técnicas (como automação e cloud) quanto em papéis de liderança (como QA Lead ou Gerente de Projetos). Estou construindo uma base sólida para tomar decisões técnicas com consciência, explorando diversas abordagens com um olhar crítico e prático.

**Contato**: [LinkedIn](https://www.linkedin.com/in/anna-santoro)

---

## English Version

The English version of this README is available in [`README-en.md`](./README-en.md).
