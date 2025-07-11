# Innovation Roadmap - Cinema App

## Apresentação

Este documento apresenta propostas de inovação para o projeto Cinema App, desenvolvidas durante o Challenge Final da Sprint 8. As inovações foram concebidas com foco em melhorar a experiência do usuário, otimizar processos de QA e agregar valor ao negócio.

**Responsável:** Anna Santoro  
**Data de criação:** 01 de Junho de 2025 
**Status:** Conceitual - Não implementado  
**Contexto:** Projeto educacional - Demonstração de pensamento estratégico

---

## Inovações Propostas

### Inovação 1: Pipeline de Execução Automática (CI/CD) com Postman + Newman + GitHub Actions

**Descrição:**
Automatizar a execução dos testes de API utilizando a ferramenta Postman integrada ao runner Newman e ao serviço de integração contínua GitHub Actions, permitindo que os testes sejam executados de forma automática a cada push, pull request ou agendamento definido. Essa abordagem promove validação contínua da API, reduz riscos de regressões e antecipa falhas durante o desenvolvimento.

**Arquitetura da Solução:**
- **Postman Collection**: Plataforma para criação e gerenciamento das collections organizadas por endpoint
- **Newman CLI**: Executa collections automaticamente com geração de relatórios
- **GitHub Actions**: Orquestrador do pipeline CI/CD nativo do GitHub

**Fluxo de Execução:**
```
Push no GitHub → GitHub Actions dispara workflow → Instala dependências (Node + Newman) → 
Executa collection com Newman → Gera relatório (HTML/JSON) → Armazena como artefato
```

**Benefícios:**
- Execução recorrente dos testes a cada alteração de código
- Detecção antecipada de falhas e regressões
- Geração automática de relatórios em HTML ou JSON
- Integração com ferramentas de QA via API (ex: QAlity for Jira, Slack)
- Ambiente de testes confiável, isento de intervenção manual
- Pipeline reutilizável em outros projetos

**Implementação Sugerida:**
```yaml
# .github/workflows/run-api-tests.yml
name: Run API Tests
on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  postman-tests:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout do repositório
      uses: actions/checkout@v3
    
    - name: Instala Node.js e Newman
      run: npm install -g newman
    
    - name: Executa Collection com Newman
      run: |
        newman run ./manual-tests/Cinema\ App.postman_collection.json \
          --reporters cli,html \
          --reporter-html-export ./newman/report.html
    
    - name: Salva relatório como artefato
      uses: actions/upload-artifact@v3
      with:
        name: newman-report
        path: ./newman/report.html
```

**Estrutura de Arquivos:**
```
cinema-project/
├── .github/workflows/run-api-tests.yml
├── manual-tests/
│   ├── Cinema App.postman_collection.json
│   └── Cinema App.postman_environments_globals.json
└── newman/
    └── report.html
```

**Impacto Esperado:**
- **Usuários:** Maior confiabilidade da API com validação contínua
- **Negócio:** Redução de custos com detecção precoce de bugs
- **Técnico:** Automação completa do processo de testes de API

**Nota sobre Inovação vs. Funcionalidade:**
Embora pipelines CI/CD sejam práticas estabelecidas, sua aplicação específica ao contexto de testes manuais repetitivos do projeto Cinema App representa uma inovação **contextual** - transformando um processo manual ineficiente em automação inteligente.

---

### Inovação 2: Monitoramento Simulado com Alertas Automatizados (Health Check + Notificação)

**Descrição:**
Introduzir uma camada de observabilidade no sistema por meio de uma estratégia simples e automatizada de health check, utilizando Postman e Newman, integrada com GitHub Actions ou cronjob local. O objetivo é detectar indisponibilidades ou lentidão na API antes que os usuários finais sejam impactados, com alertas simulados configurados diretamente nos scripts de teste.

**Tecnologias e Ferramentas:**
- **Postman Collection** (health-check)
- **Newman CLI** para execução automatizada
- **GitHub Actions** (ou cron local) para execução periódica
- **Scripts de notificação** simulada via Postman test

**Implementação Técnica:**

1. **Collection Health Check:**
```javascript
// Script de teste no Postman
if (pm.response.code !== 200 || pm.response.responseTime > 1000) {
    console.error("🚨 API indisponível ou lenta");
    pm.environment.set("ALERTA", true);
} else {
    pm.environment.set("ALERTA", false);
}
```

2. **Workflow GitHub Actions:**
```yaml
# .github/workflows/health-check.yml
name: API Health Check
on:
  schedule:
    - cron: '*/30 * * * *'  # A cada 30 minutos

jobs:
  health-check:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v3
    
    - name: Install Newman
      run: npm install -g newman
    
    - name: Run Health Check
      run: |
        newman run ./monitoring/health-check.postman_collection.json \
          --reporters cli,json \
          --reporter-json-export ./health-report.json
    
    - name: Check Results and Alert
      run: |
        if grep -q '"failures":[^0]' health-report.json; then
          echo "🚨 ALERTA: API com problemas detectados!"
          # Aqui seria integração com Slack/Discord/Email
        fi
```

3. **Estrutura de Monitoramento:**
```
cinema-project/
├── .github/workflows/health-check.yml
├── monitoring/
│   ├── health-check.postman_collection.json
│   └── health-check.postman_environment.json
└── health-reports/
    └── health-report.json
```

**Endpoints Monitorados:**
- `GET /api/v1/movies` (disponibilidade pública)
- `GET /api/v1/auth/me` (autenticação)
- `GET /api/v1/sessions` (funcionalidade crítica)

**Critérios de Alerta:**
- Código de resposta ≠ 200
- Tempo de resposta > 1000ms
- Taxa de erro > 5% em 5 execuções consecutivas

**Benefícios:**
- Detecção proativa de falhas antes do impacto aos usuários
- Redução de impacto em vendas e reservas
- Fomento à mentalidade DevOps e responsabilidade contínua
- Base para futuras integrações com ferramentas reais (Prometheus, Grafana)
- Complementa automação de testes com vigilância passiva

**Implementação Sugerida:**
- Criar collection específica para health checks
- Configurar execução periódica (30min - 1h)
- Implementar lógica de alertas simulados
- Documentar integração futura com sistemas reais
- Estabelecer thresholds baseados na performance atual

**Impacto Esperado:**
- **Usuários:** Maior disponibilidade e confiabilidade do sistema
- **Negócio:** Redução de downtime e perda de receita
- **Técnico:** Visibilidade proativa sobre saúde da aplicação

---

## Análise de Viabilidade

### Recursos Necessários por Inovação

**Inovação 1 - Pipeline CI/CD:**
- **Tempo estimado:** 1-2 semanas
- **Equipe:** 1 QA Engineer + 1 DevOps Engineer
- **Tecnologias:** GitHub Actions, Newman CLI, Node.js
- **Investimento:** Muito baixo (ferramentas gratuitas)

**Inovação 2 - Monitoramento:**
- **Tempo estimado:** 1 semana
- **Equipe:** 1 QA Engineer
- **Tecnologias:** Postman, Newman, GitHub Actions
- **Investimento:** Muito baixo (infraestrutura existente)

### Riscos Consolidados e Mitigações
| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| Instabilidade da API | Alta | Alto | Implementar retry logic e timeouts configuráveis |
| Falsos positivos | Média | Médio | Configurar thresholds e validações robustas |
| Requisições excessivas | Baixa | Médio | Limitar frequência de execução (30min-1h) |
| Dependência de ambiente externo | Baixa | Alto | Usar containers e ambientes isolados |

---

## Roadmap de Implementação

### Fase 1: Pipeline CI/CD (Semana 1-2)
- [ ] Configurar GitHub Actions workflow
- [ ] Adaptar coleção Postman existente
- [ ] Testar execução automatizada
- [ ] Configurar artefatos de relatório

### Fase 2: Monitoramento (Semana 3)
- [ ] Criar coleção health-check
- [ ] Implementar scripts de alerta
- [ ] Configurar execução periódica
- [ ] Testar critérios de alerta

### Fase 3: Integração e Refinamento (Semana 4)
- [ ] Integrar ambas as soluções
- [ ] Ajustar thresholds baseados em dados reais
- [ ] Documentar processo de manutenção
- [ ] Preparar para integrações futuras

---

## Considerações Finais

### Processo de Pensamento e Decisão

**Inovação 1 - Pipeline CI/CD:**
A escolha desta inovação surgiu da observação de um problema recorrente: a execução manual repetitiva de testes via Postman. Durante o desenvolvimento do projeto, identifiquei que a validação da API exigia execução constante dos mesmos cenários, consumindo tempo significativo e introduzindo risco de erro humano. A decisão de automatizar este processo com GitHub Actions + Newman foi **pragmática** - resolver um problema real com ferramentas acessíveis, demonstrando que inovação não precisa ser complexa para ser valiosa.

**Inovação 2 - Monitoramento Simulado:**
Esta inovação nasceu de uma perspectiva **profissional real**: "E se este sistema estivesse em produção?". A instabilidade identificada durante os testes manuais evidenciou a necessidade de monitoramento proativo. Pensei além do contexto acadêmico, imaginando um cenário onde usuários reais dependem da disponibilidade da API para fazer reservas de cinema. A solução de health checks automatizados representa a mentalidade DevOps de **responsabilidade compartilhada** pela saúde do sistema.

**Filosofia de Escolha:**
Ambas as inovações seguem o princípio de **"funcionalidade sobre novidade"** - priorizei soluções que:
- Resolvem problemas reais identificados no projeto
- São implementáveis com recursos disponíveis
- Agregam valor tangível ao processo de desenvolvimento
- Demonstram pensamento estratégico voltado para operações

**Observação:** Estas inovações foram concebidas como parte do processo de aprendizado e demonstração de capacidade de pensamento estratégico. Embora não tenham sido implementadas devido a limitações de tempo e instabilidade da aplicação base, representam oportunidades reais de melhoria para o projeto Cinema App.

**Próximos Passos:**
1. Validação das propostas com stakeholders
2. Priorização baseada em valor vs. esforço
3. Planejamento detalhado de implementação
4. Execução faseada conforme roadmap

---

## Documentação Relacionada

- [Plano de Testes Backend](./test-plan-backend.md) - Estratégia de QA
- [User Stories](./user-stories/) - Requisitos atuais
- [Relatório de Testes](./relatório-de-testes.md) - Resultados da execução de testes e análise geral do projeto
- [README Principal](../README.md) - Visão geral do projeto