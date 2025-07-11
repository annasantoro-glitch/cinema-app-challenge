# User Stories - Cinema App

Este diretório contém todas as User Stories organizadas por módulo funcional do sistema Cinema App.

## Estrutura de Arquivos

```
user-stories/
├── README.md                           # Este guia
├── acceptance-criteria-overview.md     # Visão geral dos critérios de aceitação
├── authentication-and-profile.md       # User Stories de Autenticação & Perfil
├── user-experience.md                  # User Stories de Experiência do Usuário
├── movies-management.md                # User Stories de Gerenciamento de Filmes
├── reservations-management.md          # User Stories de Gerenciamento de Reservas
└── sessions-management.md              # User Stories de Gerenciamento de Sessões
```

## Módulos Funcionais

### 🔐 Autenticação & Perfil (authentication-and-profile.md)
- Registro de usuários
- Login e logout
- Gerenciamento de perfil
- Autenticação por token

### 🎨 Experiência do Usuário (user-experience.md)
- Navegação intuitiva
- Interface responsiva
- Usabilidade
- Acessibilidade

### 🎬 Gerenciamento de Filmes (movies-management.md)
- Página inicial atrativa
- Lista de filmes
- Detalhes dos filmes
- Navegação de conteúdo

### 🎫 Gerenciamento de Reservas (reservations-management.md)
- Seleção de assentos
- Processo de checkout
- Visualização de reservas
- Histórico de reservas

### 🎭 Gerenciamento de Sessões (sessions-management.md)
- Visualização de horários
- Disponibilidade de sessões
- Navegação para reservas

## Formato das User Stories

Cada arquivo segue o padrão:

```markdown
## US-XXX: [Título da User Story]

**Como** [tipo de usuário]  
**Eu quero** [funcionalidade]  
**Para que** [benefício/valor]

### Critérios de Aceitação
- [ ] AC-XXX.1: [critério específico]
- [ ] AC-XXX.2: [critério específico]

### Cenários de Teste Relacionados
- CT-XXX: [nome do cenário]
```

## Rastreabilidade

| Módulo | User Stories | Critérios de Aceitação | Cenários de Teste |
|---------|--------------|------------------------|-------------------|
| **Autenticação & Perfil** | 4 | AC-001 - AC-017 | CT-001 - CT-010 |
| **Experiência do Usuário** | 1 | AC-054 - AC-059 | UI Tests |
| **Gerenciamento de Filmes** | 3 | AC-018 - AC-032 | CT-011 - CT-017 |
| **Gerenciamento de Reservas** | 3 | AC-036 - AC-053 | CT-023 - CT-025 |
| **Gerenciamento de Sessões** | 1 | AC-033 - AC-035 | CT-018 - CT-022 |

**TOTAL**: 12 User Stories | 59 Critérios de Aceitação | 36 Cenários de Teste

## Como Usar

1. **Desenvolvimento**: Consulte as US para entender requisitos
2. **Testes**: Use os AC como base para validação
3. **Rastreabilidade**: Conecte US → AC → Cenários de Teste
4. **Manutenção**: Atualize conforme evolução do produto

## Estatísticas do Projeto

- **12 User Stories** distribuídas em 5 módulos funcionais
- **59 Critérios de Aceitação** totalmente mapeados
- **36 Cenários de Teste** com cobertura completa
- **100% de rastreabilidade** entre US → AC → CT

## Documentos Relacionados

### No diretório docs/:
- [Plano de Testes Backend](../test-plan-backend.md) - Estratégia e cobertura de testes
- [Casos de Teste](../test-cases.md) - Cenários de teste detalhados
- [Relatório de Execução](../test-execution-report.md) - Resultados da execução
- [Mapas Mentais](../mind%20map/) - Visualização dos fluxos do sistema

### No diretório user-stories/:
- [Visão Geral dos AC](./acceptance-criteria-overview.md) - Critérios consolidados

### Outros:
- [Documentação Principal](../README.md) - Visão geral da documentação
- [Testes Manuais](../../manual-tests/) - Guia de testes manuais
- [Testes Automatizados](../../automated-tests/) - Testes Robot Framework