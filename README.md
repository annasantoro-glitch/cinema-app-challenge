# 🎬 Cinema App Challenge

![Status](https://img.shields.io/badge/status-em%20andamento-yellow)
![Sprint](https://img.shields.io/badge/sprint-08-blue)
![Semana](https://img.shields.io/badge/semana-15-lightgrey)
![Tech](https://img.shields.io/badge/Robot_Framework-✓-green)
![Type](https://img.shields.io/badge/Testes_Automatizados-Fullstack-blue)

---

## Descrição Geral

Este repositório contém a implementação dos testes manuais e automatizados aplicados à aplicação *Cinema App* — um sistema de gerenciamento de filmes com operações de CRUD, autenticação e busca.

O projeto foi desenvolvido como parte do **Challenge Final** da trilha de QA, e visa demonstrar domínio sobre planejamento, execução e automação de testes em aplicações reais, com foco especial em qualidade, cobertura e boas práticas.

---

## Índice

- [Descrição Geral](#descrição-geral)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura Técnica](#estrutura-técnica)
- [Documentação e Planejamento](#documentação-e-planejamento)
- [Versão em Inglês](#english-version)
- [Créditos](#créditos)
- [Referências Externas](#referências-externas)

---

## Tecnologias Utilizadas

- Robot Framework (com RequestsLibrary, BrowserLibrary e SeleniumLibrary)
- Postman + QAlity (para testes manuais)
- XMind (para mapa mental)
- Confluence (para documentação)
- Jira (para issues e rastreabilidade)
- GitHub + GitHub Projects (para versionamento e organização)

---

## Estrutura Técnica

> A automação será desenvolvida em duas etapas: primeiro para o back-end (API), depois para o front-end (UI). As pastas refletem essa separação.

```bash
cinema-app-challenge/
├── api/                     # Testes e documentação da API
│   ├── tests/               # Casos automatizados (Robot)
│   ├── resources/           # Keywords, helpers, vars
│   ├── logs/                # Execuções automatizadas
│   └── README.md            # Explicação da automação da API

├── frontend/                # Testes e documentação do front-end
│   ├── tests/               # Casos automatizados com Selenium
│   ├── resources/           # Element locators, keywords visuais
│   ├── logs/                # Execuções e prints
│   └── README.md            # Explicação da automação da UI

├── docs/                    # PDFs, exportações e relatórios
├── .gitignore
└── README.md                # Apresentação geral do projeto
```

---

## Documentação e Planejamento

Todos os arquivos de documentação estão disponíveis na pasta [`/docs`](./docs) deste repositório, em formato `.pdf`, e cobrem os seguintes tópicos:

- Plano de Testes (Cenários, Riscos, Rastreabilidade, Visão de Cobertura)
- User Stories
- Mapa Mental (exportado do XMind)
- Relatórios de Execução:
  - Testes Manuais (Postman + QAlity)
  - Testes Automatizados (Robot Framework + VSCode)

---

## English Version

The English version of this README will be available soon in [`README-en.md`](./README-en.md).

---

## Créditos

Este projeto foi desenvolvido com base na aplicação **Cinema App**, criada por Jacques Schmitz.

📎GitHub: [juniorschmitz](https://github.com/juniorschmitz)  
📎LinkedIn: [Jacques Schmitz](https://www.linkedin.com/in/jacques-schmitz-junior)

---

## Referências Externas

- [Repositório original do back-end](https://github.com/juniorschmitz/cinema-challenge-back)
- [Repositório original do front-end](https://github.com/juniorschmitz/cinema-challenge-front)
