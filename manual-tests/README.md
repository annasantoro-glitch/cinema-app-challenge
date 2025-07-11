# Guia de Testes Manuais

Este diretório contém todos os recursos de testes manuais para o projeto Cinema App.

## Estrutura do Diretório

```
manual-tests/
├── README.md                                    # Este guia
├── Cinema App.postman_collection.json           # Coleção Postman
└── Cinema App.postman_environments_globals.json # Variáveis de ambiente
```

## Cobertura de Testes

### Módulos de Teste:
- **🔐 Autenticação** (CT-001 a CT-010) - 10 cenários
- **🎬 Filmes** (CT-011 a CT-017) - 7 cenários  
- **🎭 Sessões** (CT-018 a CT-022) - 5 cenários
- **🎫 Reservas** (CT-023 a CT-025) - 3 cenários
- **👥 Usuários** (CT-026 a CT-030) - 5 cenários
- **🏛️ Teatros** (CT-031 a CT-036) - 6 cenários

**Total: 36 Cenários de Teste Manual**

## Postman Collection Structure

### Cinema API Tests
```
Cinema API Tests
├── auth/
│   ├── Register/
│   │   ├── Valid registration – New user
│   │   ├── Duplicate email
│   │   ├── Invalid email format
│   │   └── Weak password
│   ├── Login/
│   │   ├── Valid credentials
│   │   └── Invalid password
│   ├── Me/
│   │   ├── Get profile with valid token
│   │   ├── Get profile without token
│   │   └── Get profile with invalid token
│   └── Profile/
│       └── Update profile with valid data
├── movies/
│   ├── Create Movie/
│   │   ├── Valid movie creation (admin)
│   │   └── Without token (unauthorized)
│   ├── Edit Movie/
│   │   └── Update movie with valid ID
│   ├── Get Movie/
│   │   ├── List all movies
│   │   ├── Get movie by valid ID
│   │   └── Get movie with invalid ID
│   └── Delete Movie/
│       └── Delete movie by ID (admin)
├── theaters/
│   ├── Create Theater/
│   │   ├── Valid creation
│   │   └── Missing required field
│   ├── Edit Theater/
│   │   └── Update theater data
│   ├── Get Theater/
│   │   └── List all theaters
│   └── Delete Theater/
│       ├── Valid deletion
│       └── Deletion with active sessions
├── sessions/
│   ├── Create Session/
│   │   └── Create session with valid data
│   ├── Get Session/
│   │   ├── List all sessions
│   │   └── Get reserved seats by session ID
│   ├── Reset Session/
│   │   └── Reset all seats in session
│   └── Delete Session/
│       └── Delete session by ID
├── reservations/
│   ├── Create Reservation/
│   │   ├── Valid seat reservation
│   │   └── Reserve already taken seats
│   └── Delete Reservation/
│       └── Cancel reservation by ID
├── users/
│   ├── Get Users/
│   │   ├── List all users (admin)
│   │   └── Unauthorized access
│   └── Delete User/
│       ├── Valid deletion
│       └── Deletion with active reservations
```

### Variáveis de Ambiente

| Variável | Valor Atual |
|----------|-------------|
| base_url | http://localhost:3000/api/v1 |
| token_user | (definido após login válido) |
| token_admin | (definido após login de admin) |
| user_email | hannah_qa_{{timestamp}}@example.com |
| user_password | Teste@123 |
| movie_id | (definido após criação de filme) |
| session_id | (definido após criação de sessão) |
| reservation_id | (definido após reserva) |
| user_id | (definido após criação) |
| theater_id | (definido após criação de cinema) |

**Nota**: Use Pre-request Scripts para gerar timestamps, capturar tokens ou IDs dinamicamente e salvar com `pm.environment.set()`.

## Início Rápido

### Pré-requisitos:
- Postman instalado
- API Cinema App em execução
- Base de dados de teste acessível

### Passos de Execução:
1. Importar coleção Postman do diretório atual
2. Configurar variáveis de ambiente
3. Seguir cenários de teste em `../docs/test-cases.md`
4. Executar testes conforme níveis de prioridade

## Tags de Teste

- `@api` - Todos os testes de API
- `@positive` - Cenários de caminho feliz
- `@negative` - Tratamento de erros
- `@admin` - Operações exclusivas de admin
- `@security` - Validações de segurança
- `@regression` - Suíte de regressão

## Níveis de Prioridade

- 🔴 **Crítica/Alta** - Deve executar a cada ciclo
- 🟡 **Média** - Importante mas flexível
- 🟢 **Baixa** - Executar quando houver tempo

## Execução de Testes

### Gerenciamento de Dados:
- Usar timestamps para dados únicos de teste
- Limpar após execução dos testes
- Manter isolamento de dados entre testes
- Documentar dependências entre cenários

### Relatórios:
- Registrar resultados com screenshots
- Documentar desvios dos resultados esperados
- Reportar bugs com passos detalhados de reprodução
- Manter rastreabilidade aos requisitos

## Documentação Relacionada

- [Casos de Teste](../docs/test-cases.md) - Cenários de teste detalhados
- [Plano de Testes Backend](../docs/test-plan-backend.md) - Estratégia e cobertura
- [Relatório de Testes](../docs/test-execution-report.md) - Resultados da execução
- [User Stories](../docs/user-stories/) - Requisitos e critérios de aceitação
- [Documentação](../docs/) - Toda documentação do projeto
- [README Principal](../README.md) - Visão geral do projeto
- [Testes Automatizados](../automated-tests/) - Testes Robot Framework
