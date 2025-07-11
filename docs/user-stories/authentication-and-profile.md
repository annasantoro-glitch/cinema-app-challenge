# User Stories - Autenticação & Perfil

## US-AUTH-001: Registro de Usuário

**Como** visitante  
**Eu quero** registrar uma nova conta  
**Para que** eu possa reservar ingressos de cinema  

### Critérios de Aceitação
- [x] AC-001: Usuário pode inserir nome, e-mail e senha
- [x] AC-002: Sistema valida o formato do e-mail e senha
- [x] AC-003: Sistema impede registros de e-mails duplicados
- [x] AC-004: Após o registro bem-sucedido, o usuário é redirecionado para a página de login, autenticado

### Cenários de Teste Relacionados
- CT-001: Registrar novo usuário com dados válidos
- CT-002: Tentativa de registro com email duplicado
- CT-003: Registro com email inválido
- CT-004: Registro com senha fraca

---

## US-AUTH-002: Login de Usuário

**Como** usuário registrado  
**Eu quero** fazer login na minha conta  
**Para que** eu possa acessar recursos personalizados  

### Critérios de Aceitação
- [x] AC-005: Usuário pode inserir e-mail e senha
- [x] AC-006: Sistema autentica credenciais válidas
- [x] AC-007: Sistema mantém sessão do usuário através de token JWT
- [x] AC-008: Usuário é redirecionado para a página inicial após login bem-sucedido

### Cenários de Teste Relacionados
- CT-005: Login com credenciais válidas
- CT-006: Tentativa de login com senha inválida

---

## US-AUTH-003: Logout de Usuário

**Como** usuário logado  
**Eu quero** sair da minha conta  
**Para que** minha sessão seja encerrada  

### Critérios de Aceitação
- [x] AC-009: Usuário pode fazer logout através do menu de navegação
- [x] AC-010: Após o logout, rotas protegidas não são mais acessíveis
- [x] AC-011: Token JWT é removido do localStorage

### Cenários de Teste Relacionados
- CT-008: Consulta de perfil SEM token (validação de logout)

---

## US-AUTH-004: Visualizar e Gerenciar Perfil do Usuário

**Como** usuário logado  
**Eu quero** visualizar e atualizar minhas informações de perfil  
**Para que** eu possa manter meus dados atualizados  

### Critérios de Aceitação
- [x] AC-012: Perfil exibe nome do usuário, e-mail e função da conta
- [x] AC-013: Usuário pode editar seu nome completo
- [x] AC-014: Sistema indica visualmente os campos que foram alterados
- [x] AC-015: Sistema confirma sucesso após salvar alterações
- [x] AC-016: Interface exibe mensagem de confirmação após atualização bem-sucedida
- [x] AC-017: Página de perfil é separada da página de reservas para melhor organização

### Cenários de Teste Relacionados
- CT-007: Consulta de perfil com token válido
- CT-009: Consulta de perfil com token inválido
- CT-010: Atualização de nome do perfil com dados válidos

---

## Resumo de Cobertura

| User Story  | Critérios de Aceitação | Cenários de Teste      |
|-------------|------------------------|------------------------|
| US-AUTH-001 | AC-001 - AC-004        | CT-001 - CT-004        |
| US-AUTH-002 | AC-005 - AC-008        | CT-005 - CT-006        |
| US-AUTH-003 | AC-009 - AC-011        | CT-008                 |
| US-AUTH-004 | AC-012 - AC-017        | CT-007, CT-009, CT-010 |

**Total**: 4 User Stories | 17 Critérios de Aceitação | 10 Cenários de Teste