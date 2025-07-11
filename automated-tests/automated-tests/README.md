# Automated Tests - Cinema App

## Visão Geral

Este diretório contém a suíte completa de testes automatizados para a API Cinema App, desenvolvida com Robot Framework. Os testes cobrem todos os endpoints principais da aplicação, incluindo autenticação, gerenciamento de filmes, sessões, reservas, usuários e teatros.

---

## Estrutura do Projeto

```
automated-tests/
├── resources/                    # Keywords e variáveis reutilizáveis
│   ├── variables/               # Configurações base
│   │   ├── base.resource        # URLs, bibliotecas e configurações gerais
│   │   └── variables.resource   # Endpoints e dados de teste
│   ├── auth.resource           # Keywords de autenticação
│   ├── movies.resource         # Keywords de filmes
│   ├── reservations.resource   # Keywords de reservas
│   ├── sessions.resource       # Keywords de sessões
│   ├── theaters.resource       # Keywords de teatros
│   └── users.resource          # Keywords de usuários
├── tests/                      # Suítes de teste
│   ├── auth_tests.robot        # Testes de autenticação
│   ├── movies_tests.robot      # Testes de filmes
│   ├── reservations_tests.robot # Testes de reservas
│   ├── sessions_tests.robot    # Testes de sessões
│   ├── theaters_tests.robot    # Testes de teatros
│   └── users_tests.robot       # Testes de usuários
└── results/                    # Relatórios de execução
```

---

## Pré-requisitos

### Instalação
```bash
pip install robotframework
pip install robotframework-requests
pip install robotframework-browser
pip install robotframework-seleniumlibrary
pip install robotframework-faker
```

### Ambiente
- **API Cinema App** rodando em `http://localhost:3000`
- **Python 3.8+**
- **Banco de dados** configurado e acessível

---

## Como Executar

### Executar Todos os Testes
```bash
robot tests/
```

### Executar Suíte Específica
```bash
robot tests/auth_tests.robot
robot tests/movies_tests.robot
```

### Executar por Tags
```bash
# Apenas testes de API
robot --include api tests/

# Apenas testes positivos
robot --include positive tests/

# Testes de segurança
robot --include security tests/
```

### Executar com Relatório Personalizado
```bash
robot --outputdir results --name "Cinema API Tests" tests/
```

---

## Cobertura de Testes

### Módulos Testados

| Módulo | Arquivo | Cenários | Status |
|--------|---------|----------|--------|
| **Autenticação** | `auth_tests.robot` | 7 | ✅ |
| **Filmes** | `movies_tests.robot` | 5 | ✅ |
| **Usuários** | `users_tests.robot` | 4 | ✅ |
| **Teatros** | `theaters_tests.robot` | 5 | ✅ |
| **Sessões** | `sessions_tests.robot` | 5 | ✅ |
| **Reservas** | `reservations_tests.robot` | 3 | ✅ |

**Total: 29 cenários de teste automatizados**

### Tipos de Teste

- **🟢 Positivos**: Fluxos de sucesso (happy path)
- **🔴 Negativos**: Validações de erro e edge cases
- **🔒 Segurança**: Autenticação e autorização
- **📊 Validação**: Integridade de dados

---

## Tags Disponíveis

| Tag | Descrição | Uso |
|-----|-----------|-----|
| `api` | Todos os testes de API | `--include api` |
| `positive` | Cenários de sucesso | `--include positive` |
| `negative` | Cenários de erro | `--include negative` |
| `security` | Testes de segurança | `--include security` |
| `validation` | Validação de dados | `--include validation` |
| `authentication` | Autenticação | `--include authentication` |
| `registration` | Registro de usuários | `--include registration` |
| `login` | Login | `--include login` |
| `profile` | Perfil de usuário | `--include profile` |

---

## Keywords Principais

### Autenticação (`auth.resource`)
- `Register User` - Registrar novo usuário
- `User Login` - Fazer login
- `Get User Profile Data` - Obter dados do perfil
- `Update User Profile Data` - Atualizar perfil
- `Generate Random Email` - Gerar email aleatório
- `Status Should Be` - Validar status HTTP

### Filmes (`movies.resource`)
- `Get All Movies` - Listar todos os filmes
- `Create Movie` - Criar novo filme
- `Edit Movie By ID` - Editar filme
- `Delete Movie` - Deletar filme

### Usuários (`users.resource`)
- `Get All Users` - Listar usuários (admin)
- `Create User` - Criar usuário
- `Update User by Admin` - Atualizar usuário (admin)
- `Delete User` - Deletar usuário

---

## Configurações

### Variáveis de Ambiente (`variables.resource`)
```robot
${BASE_API_URL}       http://localhost:3000/api/v1
${ADMIN_EMAIL}        admin@example.com
${USER_EMAIL}         user@example.com
```

### Bibliotecas Utilizadas (`base.resource`)
- `RequestsLibrary` - Requisições HTTP
- `Browser` - Testes de navegador
- `SeleniumLibrary` - Automação web
- `FakerLibrary` - Dados fake
- `Collections` - Manipulação de dados
- `DateTime` - Manipulação de datas

---

## Relatórios

Após a execução, os seguintes arquivos são gerados em `/results`:

- **`log.html`** - Log detalhado com screenshots
- **`report.html`** - Relatório resumido
- **`output.xml`** - Dados estruturados para CI/CD

### Interpretação dos Resultados
- ✅ **PASS** - Teste executado com sucesso
- ❌ **FAIL** - Teste falhou, verificar log
- ⏱️ **Tempo** - Performance dos endpoints
- 🏷️ **Tags** - Categorização dos testes

---

## Troubleshooting

### Problemas Comuns

**Erro 401 - Unauthorized**
```
Verificar se o token está válido e não expirou
```

**Erro 404 - Not Found**
```
Verificar se a API está rodando na URL correta
Confirmar se os endpoints estão implementados
```

**Timeout**
```
Verificar conectividade com a API
Aumentar timeout nas configurações
```

**Dados duplicados**
```
Limpar base de dados antes dos testes
Usar dados únicos (timestamps, emails aleatórios)
```

---

## Boas Práticas

### Desenvolvimento de Testes
- Use keywords reutilizáveis
- Mantenha dados de teste isolados
- Implemente validações robustas
- Use tags para categorização
- Documente cenários complexos

### Manutenção
- Execute testes regularmente
- Monitore performance dos endpoints
- Atualize dados de teste conforme necessário
- Mantenha keywords sincronizadas com a API

---

## Próximos Passos

- [ ] Integração com pipeline CI/CD
- [ ] Testes de performance
- [ ] Cobertura de testes de UI
- [ ] Relatórios customizados
- [ ] Integração com ferramentas de monitoramento

---

## Documentação Relacionada

- [Plano de Testes Backend](../docs/test-plan-backend.md)
- [Relatório de Execução](../docs/test-execution-report.md)
- [Manual de Testes](../manual-tests/README.md)
- [README Principal](../README.md)