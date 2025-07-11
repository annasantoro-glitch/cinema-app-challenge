# 🎬 Cinema App Challenge

![Status](https://img.shields.io/badge/status-v1.0%20released-green)
![Sprint](https://img.shields.io/badge/sprint-08-blue)
![Week](https://img.shields.io/badge/week-15-lightgrey)
![Tech](https://img.shields.io/badge/Robot_Framework-✓-green)
![Type](https://img.shields.io/badge/Automated_Tests-Fullstack-blue)

---

## General Description

This repository contains the complete implementation of tests (manual and automated) applied to the *Cinema App* application — a movie management system with CRUD operations, authentication, and reservations. The project was developed as part of the **Final Challenge** of the QA track, demonstrating mastery over strategic planning, test execution, automation, and technical documentation.

### 📊 Project Summary
- **29 Automated Scenarios** with Robot Framework
- **36 Manual Scenarios** via Postman
- **6 Resource Modules** with reusable keywords
- **Complete Documentation** with plans, reports, and innovations
- **Comprehensive Coverage** of API, exploratory UI, and hybrid flows

### 🏆 Technical Highlights
- **Modular Architecture**: Reusable resources and scalable structure
- **Professional Documentation**: Strategic plans, mind maps, and reports
- **Best Practices**: Git workflow, standardized naming, and code review
- **Innovation**: CI/CD and automated monitoring proposals
- **Traceability**: 100% mapping of US → AC → Test Scenarios

---

## Index

- [General Description](#general-description)
- [Prerequisites](#prerequisites)
- [How to Run](#how-to-run)
- [Technologies Used](#technologies-used)
- [Technical Structure](#technical-structure)
- [Development Workflow](#development-workflow)
- [Documentation and Planning](#documentation-and-planning)
- [Results and Reports](#results-and-reports)
- [Test Coverage](#test-coverage)
- [Project Status](#project-status)
- [Collaboration](#collaboration)
- [Credits](#credits)
- [External References](#external-references)
- [About Me](#about-me)
- [Portuguese Version](#portuguese-version)

---

## Prerequisites

- Python 3.8+
- Robot Framework
- RequestsLibrary
- Access to Cinema App API

## How to Run

### Installation
```bash
pip install robotframework
pip install robotframework-requests
```

### Configuration
1. Configure environment variables in `automated-tests/resources/variables/variables.resource`
2. Adjust API URLs as needed
3. Ensure Cinema App API is running

### Running Tests
```bash
# Run all automated tests
robot automated-tests/tests/

# Run specific suite
robot automated-tests/tests/auth_tests.robot

# Run with specific tags
robot --include api automated-tests/tests/

# Run with custom report
robot --outputdir automated-tests/results automated-tests/tests/
```

### Reports
After execution, reports are generated in:
- `log.html` - Detailed log
- `report.html` - Summary report
- `output.xml` - Structured data

---

## Technologies Used

- **Jira** for issue and bug tracking
- **Robot Framework** for test automation
- **Postman** for manual testing
- **XMind** for mind mapping
- **GitHub** for version control
- **MongoDB Atlas** for database hosting and control
- **Swagger** for API technical reading and endpoint documentation

---

## Technical Structure

> The project focuses on API test automation using Robot Framework, with an organized structure for reusable resources and comprehensive test suites.

```bash
cinema-project/
├── automated-tests/         # Robot Framework automated tests
│   ├── resources/           # Reusable keywords and variables
│   │   ├── variables/       # Base configurations and variables
│   │   ├── auth.resource    # Authentication keywords
│   │   ├── movies.resource  # Movie keywords
│   │   ├── reservations.resource # Reservation keywords
│   │   ├── sessions.resource # Session keywords
│   │   ├── theaters.resource # Theater keywords
│   │   └── users.resource   # User keywords
│   ├── tests/               # Automated test suites
│   │   ├── auth_tests.robot
│   │   ├── movies_tests.robot
│   │   ├── reservations_tests.robot
│   │   ├── sessions_tests.robot
│   │   ├── theaters_tests.robot
│   │   └── users_tests.robot
│   └── results/             # Execution results
├── docs/                    # Documentation and planning
│   ├── mind map/            # Mind maps in PNG
│   ├── user-stories/        # User Stories and acceptance criteria
│   ├── innovation-roadmap.md # Innovation roadmap
│   ├── test-cases.md        # Detailed test cases
│   └── test-plan-backend.md # Backend test plan
├── manual-tests/            # Manual tests and Postman collections
│   ├── Cinema App.postman_collection.json
│   ├── Cinema App.postman_environments_globals.json
│   └── README.md
├── README-en.md             # English version
└── README.md                # Main documentation
```

---

## Development Workflow

### Branch Structure
- **main**: Main and stable branch → Contains the final and integrated version of the project. Only merge via Pull Request after review and testing
- **develop**: Continuous integration environment → Gathers deliveries from automation, documentation, and testing features

### Functional Scope Branches
- **feature/automation**: API and UI automation with Robot Framework → Includes test creation, keywords and setup (backend), graphical interface with Selenium, element mapping and visual scripts (frontend)
- **feature/docs**: General documentation → README.md, diagrams, test plan, mind maps, traceability, risk matrix

### Best Practices
- Use kebab-case naming (ex: `feature/docs-risk-matrix`)
- Atomic commits and messages with pattern: `feat:`, `test:`, `fix:`, `docs:`, `refactor:`
- Mandatory Pull Requests for merge to main
- Code review before integration

---

## Documentation and Planning

All documentation files are available in the [`/docs`](./docs) folder of this repository:

### Main Documentation:
- **test-plan-backend.md** - Strategic backend testing plan
- **test-cases.md** - Detailed test cases
- **test-execution-report.md** - Execution report and analysis
- **innovation-roadmap.md** - Proposed innovation roadmap

### User Stories:
- **user-stories/** - Directory with all User Stories organized by module
- **acceptance-criteria-overview.md** - Overview of acceptance criteria

### Mind Maps:
- **mental-map (auth-info-movies).png** - Authentication and movies mapping
- **mental-map (reservations-sessions-setup).png** - Reservations and sessions mapping
- **mental-map (theaters-users).png** - Theaters and users mapping

### Manual Tests:
- **manual-tests/** - Postman collections and execution guides

---

## Results and Reports

Test results are stored in the `/automated-tests/results` directory and include:

- **log.html** - Detailed execution log with screenshots
- **report.html** - Summary report with statistics
- **output.xml** - Structured data for CI/CD integration

### How to Interpret Results
- ✅ **PASS** - Test executed successfully
- ❌ **FAIL** - Test failed, check log for details
- **Execution Time** - Endpoint performance
- **Tags** - Test categorization (api, positive, negative)

### Common Troubleshooting
- **Error 401**: Check authentication token
- **Error 403**: Check user permissions
- **Timeout**: Check API connectivity
- **Duplicate data**: Clean test database

---

## Test Coverage

### Coverage Summary
- **29 Automated Scenarios** (Robot Framework)
- **36 Manual Scenarios** (Postman)
- **13 Main Endpoints** tested
- **6 Functional Modules** covered

### Tested Endpoints

| Module | Endpoint | Methods | Authentication | Status |
|--------|----------|---------|----------------|---------|
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

### Implemented Test Types
- **🟢 Positive Tests**: Success flows (happy path)
- **🔴 Negative Tests**: Error validations and edge cases
- **🔒 Security Tests**: Authentication and authorization
- **📊 Validation Tests**: Data integrity and formats
- **🔍 Exploratory Tests**: Manual UI and flow validation

### Covered Test Scenarios
- **Authentication**: Registration, login, profile, tokens
- **Authorization**: Admin vs common user, access control
- **Complete CRUD**: Create, read, update, delete
- **Validations**: Required data, formats, duplicates
- **Negative Cases**: Invalid data, unauthorized
- **Integrity**: Relationships between entities

---

## Project Status

### Current Version: v1.0
**Delivered:**
- ✅ Complete strategic planning
- ✅ 29 automated scenarios (Robot Framework)
- ✅ 36 manual scenarios (Postman)
- ✅ Comprehensive technical documentation
- ✅ Coverage analysis and reports
- ✅ Innovation roadmap

### Future Roadmap (v2.0)
**Planned for future development:**
- 🔄 Expansion of bad path scenarios
- 🔄 Complete coverage of remaining endpoints
- 🔄 API automation refinement
- 🔄 HTML element mapping
- 🔄 UI automation implementation
- 🔄 CI/CD pipeline with GitHub Actions

**Note:** This project represents a solid and functional foundation for API testing, with professional documentation and scalable structure for future expansions.

---

## Collaboration

I would like to thank my squad for their support and assistance during the development of this project, whether through direct technical support or indirect advice that was fundamental to the successful implementation:

### 🦇 Squad Gotham
- [Ádony Lagares](https://www.linkedin.com/in/adony-lagares/)
- [Ana Carolina Rosa](https://www.linkedin.com/in/ana-carolina-correa-rosa/)
- [Marcos Paulo Freitas](https://www.linkedin.com/in/marcos-freitas/)

---

## Credits

This project was developed based on the **Cinema App** application, created by Jacques Schmitz.

📎GitHub: [juniorschmitz](https://github.com/juniorschmitz)  
📎LinkedIn: [Jacques Schmitz](https://www.linkedin.com/in/jacques-schmitz-junior)

---

## External References

- [Original back-end repository](https://github.com/juniorschmitz/cinema-challenge-back)
- [Original front-end repository](https://github.com/juniorschmitz/cinema-challenge-front)

---

## About Me

My name is **Anna Santoro**, I'm an IT student at Unicesumar and currently an intern at Compass UOL, focusing on Quality Assurance and automation. I have interests in both technical areas (such as automation and cloud) and leadership roles (such as QA Lead or Project Manager). I'm building a solid foundation to make technical decisions with awareness, exploring diverse approaches with a critical and practical perspective.

**Contact**: [LinkedIn](https://www.linkedin.com/in/anna-santoro)

---

## Portuguese Version

The Portuguese version of this README is available in [`README.md`](./README.md).