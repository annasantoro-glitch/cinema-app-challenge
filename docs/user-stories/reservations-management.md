# User Stories - Gerenciamento de Reservas

## US-RESERVE-001: Selecionar Assentos para Reserva

**Como** usuário logado  
**Eu quero** selecionar assentos para uma sessão de filme  
**Para que** eu possa reservar minha localização preferida  

### Critérios de Aceitação
- [x] AC-040: Usuário pode visualizar o layout de assentos do teatro
- [x] AC-041: Assentos são codificados por cores conforme disponibilidade
- [x] AC-042: Usuário pode selecionar múltiplos assentos disponíveis
- [x] AC-043: Usuário não pode selecionar assentos já reservados
- [x] AC-044: Sistema mostra o subtotal à medida que os assentos são selecionados

### Cenários de Teste Relacionados
- CT-023: Selecionar múltiplos assentos disponíveis
- CT-024: Tentativa de selecionar assentos já reservados

---

## US-RESERVE-002: Processo de Checkout

**Como** usuário logado  
**Eu quero** finalizar o processo de compra dos ingressos  
**Para que** eu possa garantir minha reserva  

### Critérios de Aceitação
- [x] AC-045: Usuário é redirecionado para a página de checkout após selecionar os assentos
- [x] AC-046: Página de checkout exibe resumo dos assentos selecionados
- [x] AC-047: Usuário pode visualizar o valor total da compra
- [x] AC-048: Usuário pode selecionar um método de pagamento (cartão de crédito, débito, PIX, transferência)
- [x] AC-049: Sistema processa o pagamento (simulado) e confirma a reserva
- [x] AC-050: Usuário recebe confirmação visual do sucesso da reserva
- [x] AC-051: Assentos selecionados são marcados como ocupados

### Cenários de Teste Relacionados
- CT-023: Selecionar múltiplos assentos disponíveis
- CT-020: Consultar assentos ocupados por ID

---

## US-RESERVE-003: Visualizar Minhas Reservas

**Como** usuário logado  
**Eu quero** visualizar meu histórico de reservas  
**Para que** eu possa verificar minhas reservas  

### Critérios de Aceitação
- [x] AC-052: Usuário pode acessar lista de suas reservas através do link "Minhas Reservas" no menu
- [x] AC-053: Reservas são exibidas em formato de card com informações visuais claras
- [x] AC-054: Cada reserva exibe filme, data, horário, cinema, assentos, status e método de pagamento
- [x] AC-055: Usuário pode visualizar o pôster do filme associado à reserva
- [x] AC-056: Sistema exibe indicadores visuais de status da reserva (confirmada, pendente, cancelada)
- [x] AC-057: Usuário pode acessar página dedicada de reservas separada das informações de perfil

### Cenários de Teste Relacionados
- CT-025: Deletar reserva com dados válidos

---

## Resumo de Cobertura

| User Story     | Critérios de Aceitação | Cenários de Teste      |
|----------------|------------------------|------------------------|
| US-RESERVE-001 | AC-040 - AC-044        | CT-023, CT-024         |
| US-RESERVE-002 | AC-045 - AC-051        | CT-023, CT-020         |
| US-RESERVE-003 | AC-052 - AC-057        | CT-025                 |

**Total**: 3 User Stories | 18 Critérios de Aceitação | 4 Cenários de Teste