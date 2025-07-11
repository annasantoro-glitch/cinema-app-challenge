# 📚 Documentation Guide - Cinema App

Este diretório contém toda a documentação do projeto Cinema App, incluindo planejamento, execução e relatórios de testes.

## Estrutura do Diretório

```
docs/
├── README.md                        # Este guia
├── innovation-roadmap.md            # Roadmap de inovações propostas
├── test-cases.md                   # Casos de teste detalhados
├── test-execution-report.md        # Relatório de execução dos testes
├── test-plan-backend.md            # Plano estratégico de testes backend
├── mind map/                       # Mapas mentais de planejamento
│   ├── mental-map (auth-info-movies).png
│   ├── mental-map (reservations-sessions-setup).png
│   └── mental-map (theaters-users).png
└── user-stories/                   # User Stories e critérios de aceitação
    ├── README.md
    ├── acceptance-criteria-overview.md
    ├── authentication-and-profile.md
    ├── movies-management.md
    ├── reservations-management.md
    ├── sessions-management.md
    └── user-experience.md
```

Índice de Documentos

### 📋 Documentos de Planejamento
- **test-plan-backend.md** - Plano estratégico de testes backend com cobertura e métricas
- **test-cases.md** - Casos de teste detalhados (CT-001 a CT-036)
- **user-stories/** - User Stories organizadas por módulo funcional
- **innovation-roadmap.md** - Propostas de inovação para o projeto

### 📊 Relatórios de Execução
- **test-execution-report.md** - Relatório consolidado de execução e análise dos testes

### 🧠 Mapas Mentais
Representações visuais dos componentes do sistema e cobertura de testes:
- **mental-map (auth-info-movies).png** - Fluxos de autenticação e gerenciamento de filmes
- **mental-map (reservations-sessions-setup).png** - Sistema de reservas e gerenciamento de sessões
- **mental-map (theaters-users).png** - Gerenciamento de teatros e operações de usuários

## Como Interpretar os Documentos

### Documentos Markdown
- **Casos de Teste**: Cenários de teste manual abrangentes com prioridades, tags e passos detalhados
- **Plano de Testes**: Abordagem técnica, escopo e metodologia de testes
- **Relatório de Execução**: Resumo de resultados, métricas e recomendações
- **User Stories**: Requisitos funcionais e critérios de aceitação
- **Roadmap de Inovações**: Propostas de melhorias e evoluções

### Mapas Mentais
- **Visão Geral**: Compreensão de alto nível do sistema
- **Relacionamentos**: Como diferentes módulos interagem
- **Cobertura de Testes**: Áreas cobertas pelos cenários de teste

## Processo de Atualização da Documentação

### Quando Atualizar:
- Novas funcionalidades adicionadas ao sistema
- Cenários de teste modificados ou expandidos
- Execução de testes concluída
- Requisitos alterados

### Fluxo de Atualização:
1. **Fase de Planejamento**: Atualizar critérios de aceitação e planos de teste
2. **Fase de Execução**: Gerar novos mapas mentais se o escopo mudar
3. **Fase de Conclusão**: Atualizar relatórios de teste com resultados mais recentes
4. **Revisão**: Garantir que todos os documentos reflitam o estado atual do sistema

### Diretrizes de Manutenção:
- Manter documentos sincronizados com mudanças de código
- Atualizar números de versão e datas
- Arquivar versões antigas quando ocorrerem mudanças significativas
- Manter consistência entre documentação técnica e de negócio

## Documentação Relacionada

- [Testes Manuais](../manual-tests/) - Cenários de teste detalhados e coleções Postman
- [Testes Automatizados](../automated-tests/) - Implementação Robot Framework
- [README Principal](../README.md) - Visão geral do projeto

## Estatísticas da Documentação

- **5 documentos principais** de planejamento e execução
- **12 User Stories** distribuídas em 5 módulos funcionais
- **59 Critérios de Aceitação** totalmente mapeados
- **36 Cenários de Teste** com cobertura completa
- **3 Mapas Mentais** para visualização dos fluxos
- **2 Inovações propostas** para evolução do projeto