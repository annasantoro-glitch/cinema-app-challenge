# Cinema App - Cenários de Teste Manuais

Este documento contém cenários detalhados de teste manual para os endpoints da API Cinema App.

---

## 🔐 Testes de Autenticação

### CT-001 – Registrar novo usuário com dados válidos
**Prioridade:** 🔴 Alta  
**Tags:** @api @registro @positivo @regressao  
**Isolamento de Dados:** Email com timestamp deve ser usado para evitar duplicação  

**Pré-condição:**
- API em execução
- Banco de dados acessível

**Dados de Teste:**
```json
{
  "name": "Hannah QA",
  "email": "hannah_qa_<timestamp>@example.com",
  "password": "Teste@123"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Selecionar método POST
3. Enviar para /auth/register
4. Inserir body com dados acima
5. Executar requisição

**Resultado Esperado:**
- 201 Created
- JSON com objeto data contendo: id, name, email, role, token

**Pós-condição:**
- Usuário criado no banco de dados
- Token vinculado à conta

---

### CT-002 – Tentativa de registro com email duplicado
**Prioridade:** 🔴 Alta  
**Tags:** @api @registro @validacao @negativo @regressao  
**Isolamento de Dados:** Executar CT-001 primeiro ou registrar usuário com email "hannah_qa_<timestamp>@example.com"  

**Pré-condição:**
- Email "hannah_qa_<timestamp>@example.com" já registrado

**Dados de Teste:**
```json
{
  "name": "Hannah QA",
  "email": "hannah_qa_<timestamp>@example.com",
  "password": "Teste@1234"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Selecionar método POST
3. Enviar requisição para http://localhost:3000/api/v1/auth/register
4. Inserir body com dados acima
5. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem: "User already exists"

**Pós-condição:**
- Nenhum novo usuário deve ser criado

---

### CT-003 – Registro com email inválido
**Prioridade:** 🟡 Média  
**Tags:** @api @registro @validacao @negativo @regressao  
**Isolamento de Dados:** Desnecessário (valor intencionalmente inválido)  

**Pré-condição:**
- API e banco de dados funcionando

**Dados de Teste:**
```json
{
  "name": "Teste Malformado",
  "email": "hannah_qa_<timestamp>example.com",
  "password": "Teste@123"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para /auth/register
3. Inserir body com dados acima
4. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem: "Invalid email format"

**Pós-condição:**
- Nenhum dado inserido no banco de dados

---

### CT-004 – Registro com senha fraca (sem caracteres especiais)
**Prioridade:** 🟡 Média  
**Tags:** @api @registro @validacao @negativo @regressao  
**Isolamento de Dados:** Email com timestamp único  

**Pré-condição:**
- API em execução e conectada ao banco de dados

**Dados de Teste:**
```json
{
  "name": "Senha Fraca",
  "email": "senha_fraca_<timestamp>@example.com",
  "password": "12345678"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar requisição POST para /auth/register
3. Inserir body com dados acima
4. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem de erro indicando política de senha inválida

**Pós-condição:**
- Nenhum usuário criado

**Observações:**
Este teste assume que política de senha forte está implementada

---

### CT-005 – Login com credenciais válidas
**Prioridade:** 🔴 Crítica  
**Tags:** @api @login @autenticacao @positivo @regressao  
**Isolamento de Dados:** Usuário deve ser previamente criado com email de teste  

**Pré-condição:**
- Usuário existente com email e senha válidos

**Dados de Teste:**
```json
{
  "email": "hannah_login@example.com",
  "password": "Teste@123"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para auth/login
3. Inserir body com dados acima
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- Token JWT retornado no campo token

**Pós-condição:**
- Token pode ser armazenado para testes subsequentes

---

### CT-006 – Tentativa de login com senha inválida
**Prioridade:** 🔴 Crítica  
**Tags:** @api @login @validacao @negativo @regressao  
**Isolamento de Dados:** Usuário com email válido deve existir previamente  

**Pré-condição:**
- Usuário existente com email correto, senha incorreta

**Dados de Teste:**
```json
{
  "email": "hannah_login@example.com",
  "password": "senhaErrada"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para /auth/login
3. Inserir body com dados acima
4. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem: "Invalid credentials"

**Pós-condição:**
- Nenhum token emitido

---

### CT-007 – Consulta de perfil com token válido
**Prioridade:** 🔴 Alta  
**Tags:** @api @perfil @autenticacao @positivo @regressao  
**Isolamento de Dados:** Token válido obtido via login  

**Pré-condição:**
- Usuário autenticado

**Dados de Teste:**
Header: Authorization: Bearer <token-valido>

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para /auth/me
3. Inserir header Authorization com token válido
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- JSON com dados do usuário autenticado

**Pós-condição:**
- Nenhuma mudança de estado do sistema

---

### CT-008 – Consulta de perfil SEM token
**Prioridade:** 🔴 Crítica  
**Tags:** @api @perfil @seguranca @negativo @regressao  
**Isolamento de Dados:** Não aplicável  

**Pré-condição:**
- Nenhum token fornecido

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para /auth/me
3. Não inserir header Authorization
4. Executar requisição

**Resultado Esperado:**
- 401 Unauthorized
- Mensagem: "Not authorized, no token"

**Pós-condição:**
- Nenhum dado retornado

---

### CT-009 – Consulta de perfil com token inválido
**Prioridade:** 🔴 Crítica  
**Tags:** @api @perfil @seguranca @negativo @regressao  
**Isolamento de Dados:** Token inválido pode ser fixo  

**Dados de Teste:**
Header: Authorization: Bearer abc.token.invalido

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para /auth/me
3. Inserir token inválido no Header
4. Executar requisição

**Resultado Esperado:**
- 403 Forbidden
- Mensagem: "Not authorized, invalid token"

---

### CT-010 – Atualização de nome do perfil com dados válidos
**Prioridade:** 🟡 Média  
**Tags:** @api @perfil @atualizacao @positivo @regressao  
**Isolamento de Dados:** Ação atualiza dados permanentemente, considerar reset  

**Pré-condição:**
- Usuário autenticado com token válido

**Dados de Teste:**
```json
{
  "name": "Hannah QA Atualizada",
  "currentPassword": "Teste@123"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar PUT para /auth/profile
3. Inserir Header com token
4. Inserir body com dados acima
5. Executar requisição

**Resultado Esperado:**
- 200 OK
- Campo name atualizado no banco de dados

---

## 🎬 Testes de Filmes

### CT-011 – Listar todos os filmes
**Prioridade:** 🔴 Alta  
**Tags:** @api @filmes @consulta @positivo @regressao  
**Isolamento de Dados:** Banco de dados deve conter pelo menos um filme válido  

**Pré-condição:**
- API em execução
- Banco de dados populado com filmes

**Dados de Teste:**
Nenhum

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para /movies
3. Executar requisição

**Resultado Esperado:**
- 200 OK
- Lista de filmes com: title, duration, classification, genres, releaseDate

**Pós-condição:**
- Nenhuma mudança de estado

---

### CT-012 – Obter detalhes de um filme válido
**Prioridade:** 🔴 Alta  
**Tags:** @api @filmes @consulta @positivo @regressao  
**Isolamento de Dados:** Garantir existência de filme válido criado previamente  

**Pré-condição:**
- Filme registrado com ID conhecido

**Dados de Teste:**
ID de filme existente

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para movies/{id}
3. Substituir {id} com ID de filme existente
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- JSON com todos os campos do filme

**Pós-condição:**
- Nenhuma mudança no banco de dados

---

### CT-013 – Obter detalhes com ID inválido
**Prioridade:** 🔴 Alta  
**Tags:** @api @filmes @validacao @negativo @regressao  
**Isolamento de Dados:** Não aplicável (valor intencionalmente inválido)  

**Pré-condição:**
Nenhuma

**Dados de Teste:**
ID: "abc123"

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para movies/abc123
3. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem: "Invalid movie ID format or movie not found"

**Pós-condição:**
- Nenhum dado exposto

---

### CT-014 – Criar novo filme com dados válidos
**Prioridade:** 🔴 Alta  
**Tags:** @api @filmes @criacao @positivo @admin  
**Isolamento de Dados:** Usar título único ou limpar banco após execução  

**Pré-condição:**
- Usuário autenticado como ADMIN

**Dados de Teste:**
```json
{
  "title": "O Jogo da Imitação",
  "synopsis": "A história de Alan Turing e a quebra de códigos nazistas.",
  "director": "Morten Tyldum",
  "genres": ["Drama", "Biografia"],
  "duration": 113,
  "classification": "PG-13",
  "poster": "imitationgame.jpg",
  "releaseDate": "2014-11-28"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para http://localhost:3000/api/v1/movies
3. Header: Authorization: Bearer <token-admin>
4. Inserir body com dados acima
5. Executar requisição

**Resultado Esperado:**
- 201 Created
- Filme criado e refletido na resposta

**Pós-condição:**
- Filme inserido no banco de dados

---

### CT-015 – Tentativa de criação de filme sem token
**Prioridade:** 🔴 Crítica  
**Tags:** @api @filmes @seguranca @negativo @admin  
**Isolamento de Dados:** Usar mesmo payload do CT-014  

**Pré-condição:**
- Nenhum token fornecido

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para /movies
3. Nenhum header Authorization
4. Body com dados válidos
5. Executar requisição

**Resultado Esperado:**
- 401 Unauthorized
- Mensagem: "Not authorized"

**Pós-condição:**
- Nenhum filme inserido

---

### CT-016 – Atualizar dados de filme existente (admin)
**Prioridade:** 🟡 Média  
**Tags:** @api @filmes @atualizacao @positivo @admin  
**Isolamento de Dados:** Filme previamente criado  

**Pré-condição:**
- Filme existente com ID válido
- Token de administrador válido

**Dados de Teste:**
```json
{
  "duration": 120
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar PUT para /movies/{id}
3. Inserir Authorization: Bearer <token-admin>
4. Inserir body com campo a ser alterado
5. Executar requisição

**Resultado Esperado:**
- 200 OK
- Campos alterados refletidos na resposta

---

### CT-017 – Deletar filme existente com credenciais válidas
**Prioridade:** 🔴 Alta  
**Tags:** @api @filmes @delecao @positivo @admin  
**Isolamento de Dados:** Filme deve ter sido criado previamente  

**Pré-condição:**
- Filme criado com ID conhecido
- Usuário ADMIN autenticado

**Dados de Teste:**
movieId: "60d0fe4f5311236168a109cb"

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar DELETE para /movies/{id}
3. Substituir {id} com movieId
4. Header: Authorization com token admin
5. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "Movie removed"

---

## 🎭 Testes de Sessões

### CT-018 – Criando sessão com dados válidos
**Prioridade:** 🔴 Alta  
**Tags:** @api @sessoes @criacao @positivo @admin  
**Isolamento de Dados:** Filme e teatro devem existir previamente  

**Pré-condição:**
- IDs válidos de filme e teatro
- Usuário ADMIN autenticado

**Dados de Teste:**
```json
{
  "movie": "685af8b2dd66e8849ea14e0f",
  "theater": "685af8b2dd66e8849ea14e14",
  "datetime": "2025-06-28T21:08:23.739Z",
  "fullPrice": 20,
  "halfPrice": 10
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para /sessions
3. Inserir Authorization: Bearer <token-admin>
4. Inserir body com dados acima
5. Executar requisição

**Resultado Esperado:**
- 201 Created
- Sessão criada e refletida na resposta

**Pós-condição:**
- Sessão inserida no banco de dados

---

### CT-019 – Listar sessões com dados válidos
**Prioridade:** 🔴 Alta  
**Tags:** @api @sessoes @consulta @positivo @regressao  
**Isolamento de Dados:** Sessões precisam ser previamente criadas  

**Pré-condição:**
- Sessões válidas registradas

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para /sessions
3. Executar requisição

**Resultado Esperado:**
- 200 OK
- Lista com dados de todas as sessões criadas

---

### CT-020 – Consultar assentos ocupados por ID
**Prioridade:** 🔴 Alta  
**Tags:** @api @sessoes @consulta @validacao  
**Isolamento de Dados:** Reserva já criada previamente  

**Pré-condição:**
- Assentos reservados na sessão

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar GET para /sessions/{id}
3. Verificar status dos assentos
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- Assentos marcados como "reservados"

---

### CT-021 – Resetar status de assentos de sessão válida
**Prioridade:** 🔴 Alta  
**Tags:** @api @sessoes @atualizacao @positivo @admin  
**Isolamento de Dados:** Sessão já criada previamente  

**Pré-condição:**
- Sessão criada com ID válido
- Usuário ADMIN autenticado

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar PUT para /sessions/{id}/reset-seats
3. Inserir Authorization: Bearer <token-admin>
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "All seats reset to available"

---

### CT-022 – Deleção de sessão com dados válidos
**Prioridade:** 🔴 Alta  
**Tags:** @api @sessoes @delecao @positivo @admin  
**Isolamento de Dados:** Sessão deve ter sido criada previamente  

**Pré-condição:**
- Sessão criada com ID válido
- Usuário ADMIN autenticado

**Dados de Teste:**
sessionID: "<id_sessao_valido>"

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar DELETE para sessions/{id}
3. Substituir {id} com sessionId
4. Inserir Header: Authorization com token admin
5. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "Session deleted successfully"

---

## 🎫 Testes de Reservas

### CT-023 – Selecionar múltiplos assentos disponíveis
**Prioridade:** 🔴 Crítica  
**Tags:** @api @reservas @criacao @positivo  
**Isolamento de Dados:** Sessão com assentos livres deve ser configurada  

**Pré-condição:**
- Sessão ativa com assentos disponíveis
- Usuário autenticado

**Dados de Teste:**
```json
{
  "session": "<id_sessao>",
  "seats": ["A1", "A2"],
  "paymentMethod": "credit_card"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para /reservations
3. Header: Authorization com token de usuário
4. Inserir body com dados acima
5. Executar requisição

**Resultado Esperado:**
- 201 Created
- Reserva registrada com assentos associados

---

### CT-024 – Tentativa de selecionar assentos já reservados
**Prioridade:** 🔴 Alta  
**Tags:** @api @reservas @validacao @negativo  
**Isolamento de Dados:** Reutilizar assentos já reservados no CT-023  

**Pré-condição:**
- Assentos já reservados na sessão

**Dados de Teste:**
```json
{
  "session": "<id_sessao>",
  "seats": ["A1", "A2"],
  "paymentMethod": "credit_card"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar POST para /reservations
3. Inserir body com mesmos assentos do CT-023
4. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem sobre indisponibilidade de assento (ocupado)

---

### CT-025 – Deletar reserva com dados válidos
**Prioridade:** 🔴 Alta  
**Tags:** @api @reservas @delecao @positivo  
**Isolamento de Dados:** Sessão ativa com assentos já reservados pelo usuário  

**Pré-condição:**
- ID de sessão válido e ativo
- Assentos previamente reservados
- Usuário autenticado

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar DELETE para /reservations/{id}
3. Header: Authorization com token de usuário
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "Reservation deleted successfully"

---

## 👥 Testes de Usuários

### CT-026 – Listar usuários com token admin
**Prioridade:** 🟡 Média  
**Tags:** @consulta @usuarios @admin-apenas @positivo  

**Pré-condição:**
- API em execução
- Usuário autenticado com papel admin
- Token JWT válido

**Dados de Teste:**
Usuário ADMIN autenticado

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Selecionar método GET para /users
3. Inserir Header: Authorization com token admin
4. Adicionar parâmetros de paginação (opcional)
5. Executar requisição

**Resultado Esperado:**
- 200 OK
- Lista de usuários com metadados de paginação

**Pós-condição:**
- Nenhuma mudança de estado do sistema

---

### CT-027 – Listar usuários sem token
**Prioridade:** 🔴 Crítica  
**Tags:** @usuarios @auth @negativo @seguranca  

**Pré-condição:**
- API em execução

**Passos Detalhados:**
1. Enviar GET para /users sem header de autorização
2. Executar requisição

**Resultado Esperado:**
- 401 Unauthorized
- Mensagem: "Not authorized"

**Pós-condição:**
- Nenhum dado exposto

---

### CT-028 - Atualizar usuário com token admin
**Prioridade:** 🔴 Alta  
**Tags:** @api @usuarios @atualizacao @positivo @admin  
**Isolamento de Dados:** Usuário deve ter sido registrado previamente  

**Pré-condição:**
- API em execução
- Usuário autenticado com papel admin
- ID de usuário existente (ex:"68662417d9162bf061928a8e")

**Dados de Teste:**
```json
{
  "name": "Hannah Dev",
  "email": "hannah_qa_1751524375046@example.com",
  "role": "user"
}
```

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar requisição PUT para /users/{id} 
3. Substituir {id} com ID válido
4. Inserir Header: Authorization com token admin
5. Inserir body com dados acima
6. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "User updated successfully"

---

### CT-029 – Deletar usuário com token admin
**Prioridade:** 🔴 Alta  
**Tags:** @api @usuarios @delecao @admin  
**Isolamento de Dados:** Usuário criado apenas para este teste  

**Pré-condição:**
- ID de usuário existente
- Token admin válido

**Passos Detalhados:**
1. Enviar DELETE para /users/{id} com header de autorização
2. Substituir {id} com ID válido
3. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "User deleted successfully"

---

### CT-030 – Deletar usuário com reservas ativas
**Prioridade:** 🟡 Média  
**Tags:** @api @usuarios @validacao @negativo  
**Isolamento de Dados:** Criar reservas associadas ao usuário antes do teste  

**Pré-condição:**
- Usuário com reservas abertas

**Passos Detalhados:**
1. Enviar DELETE para /users/{id} com token admin
2. Inserir ID de usuário com reservas
3. Executar requisição

**Resultado Esperado:**
- 409 Conflict
- Mensagem: "Cannot delete user with active reservations"

---

## 🏛️ Testes de Salas

### CT-031 – Criar nova sala com dados válidos (admin)
**Prioridade:** 🔴 Alta  
**Tags:** @api @salas @criacao @positivo @admin  
**Isolamento de Dados:** Nome da sala deve ser único  

**Pré-condição:**
- Usuário autenticado como ADMIN
- Token válido no Header

**Dados de Teste:**
```json
{
  "name": "Sala QA Plaza",
  "capacity": 150,
  "type": "IMAX"
}
```

**Passos Detalhados:**
1. Enviar POST para: /theaters
2. Incluir Header: Authorization: Bearer <token-admin>
3. Adicionar body com dados de teste
4. Executar requisição

**Resultado Esperado:**
- 201 Created
- JSON com dados da sala recém-criada

**Pós-condição:**
- Sala salva no banco de dados

---

### CT-032 – Criar sala com campo obrigatório ausente (admin)
**Prioridade:** 🟡 Média  
**Tags:** @api @salas @validacao @negativo  
**Isolamento de Dados:** Campo intencionalmente ausente  

**Pré-condição:**
- Usuário autenticado como admin

**Dados de Teste:**
```json
{
  "capacity": 100,
  "type": "standard"
}
```

**Passos Detalhados:**
1. Enviar POST para /theaters
2. Header com token admin
3. Inserir body como acima
4. Executar requisição

**Resultado Esperado:**
- 400 Bad Request
- Mensagem: "Theater name is required"

---

### CT-033 – Atualizar dados de sala existente (admin)
**Prioridade:** 🟡 Média  
**Tags:** @api @salas @atualizacao @positivo @admin  
**Isolamento de Dados:** Sala deve ter sido criada previamente  

**Pré-condição:**
- ID de sala existente
- Usuário autenticado como ADMIN

**Dados de Teste:**
```json
{
  "name": "Sala QA Plaza Atualizada",
  "capacity": 200,
  "type": "standard"
}
```

**Passos Detalhados:**
1. Enviar PUT para: /theaters/{id}
2. Incluir Header: Authorization: Bearer <token-admin>
3. Inserir body com dados atualizados
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- JSON refletindo novos dados da sala

**Pós-condição:**
- Dados atualizados no banco de dados

---

### CT-034 – Listar todas as salas
**Prioridade:** 🔴 Alta  
**Tags:** @api @salas @consulta @positivo  
**Isolamento de Dados:** Banco de dados deve conter pelo menos uma sala válida criada previamente  

**Pré-condição:**
- API em execução
- Banco de dados com salas válidas

**Passos Detalhados:**
1. Abrir Postman ou script de automação
2. Enviar requisição GET para: /theaters
3. Executar requisição

**Resultado Esperado:**
- 200 OK
- JSON com array de objetos contendo: _id, name, capacity, type, createdAt

**Pós-condição:**
- Nenhuma mudança de estado do sistema

---

### CT-035 – Deletar sala válida (admin)
**Prioridade:** 🔴 Alta  
**Tags:** @api @salas @delecao @positivo @admin  
**Isolamento de Dados:** Sala não pode estar vinculada a sessões ativas  

**Pré-condição:**
- Sala existente com ID conhecido
- Usuário autenticado como ADMIN

**Passos Detalhados:**
1. Enviar DELETE para: /theaters/{id}
2. Incluir Header: Authorization: Bearer <token-admin>
3. Substituir {id} com ID real da sala
4. Executar requisição

**Resultado Esperado:**
- 200 OK
- Mensagem: "Theater deleted successfully"

**Pós-condição:**
- Sala removida do banco de dados

---

### CT-036 – Deletar sala vinculada a sessões ativas
**Prioridade:** 🔴 Alta  
**Tags:** @api @salas @validacao @negativo @admin  
**Isolamento de Dados:** Associar sessões à sala previamente  

**Pré-condição:**
- Sala com sessões vinculadas

**Passos Detalhados:**
1. Enviar DELETE para /theaters/{id}
2. Inserir token admin válido
3. Executar requisição

**Resultado Esperado:**
- 409 Conflict
- Mensagem: "Cannot delete theater with active sessions"

---

## Notas de Execução de Testes

### Legenda de Prioridade:
- 🔴 **Crítica/Alta**: Deve ser executada em todo ciclo de teste
- 🟡 **Média**: Importante mas pode ser pulada em releases de emergência
- 🟢 **Baixa**: Bom ter, executar quando o tempo permitir

### Uso de Tags:
- **@api**: Todos os testes de API
- **@positivo**: Cenários de caminho feliz
- **@negativo**: Cenários de tratamento de erro
- **@admin**: Testes que requerem privilégios de admin
- **@seguranca**: Testes focados em segurança
- **@regressao**: Testes para suíte de regressão

### Gerenciamento de Dados:
- Usar timestamps para geração de dados únicos - apenas no registro de usuário
- Limpar dados de teste após execução quando possível
- Manter banco de dados de teste separado para isolamento
- Documentar dependências de dados entre casos de teste