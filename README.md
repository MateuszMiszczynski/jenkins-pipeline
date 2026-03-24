# Jenkins Pipeline Project

This repository contains a multi-branch Jenkins Pipeline project demonstrating professional CI/CD workflows with Python, Bash scripts, and automated testing. The project is designed as a showcase for continuous integration, covering unit and integration testing, code coverage collection, and environment management.

## Table of Contents
- Project Structure  
- Technologies  
- Jenkins Configuration  
- Pipeline Stages  
- Running Locally  
- Tests  
- License  
- Screenshots  

## Project Structure

The structure has been optimized for separation of logic and different types of tests for each branch:

<img width="514" height="328" alt="image" src="https://github.com/user-attachments/assets/99954cb7-6780-45a5-aad9-305376fa2382" />



## Technologies

- Python 3.13 – Main programming language.  
- Bash – Scripting for automation and environment setup.  
- Pytest – Framework for Python testing.  
- BATS (Bash Automated Testing System) – Framework for testing shell scripts.  
- Jenkins – Automation server for Multibranch Pipelines.  
- Docker – Used for containerized builds and isolated test environments.  

## Jenkins Configuration

The project uses a Multibranch Pipeline, which allows automatic branch detection and execution of dedicated tests:

- Main Branch: Full pipeline (Unit + Integration + Bash + Coverage).  
- Dev Branch: Focus on integration tests and experimental Bash scripts.  
- Feature Branches: Quick unit tests for new functionality.  

Key environment settings:

- PYTHONPATH: To avoid `ModuleNotFoundError: No module named 'src'`, all test stages use `PYTHONPATH=.`  
- Pip Installation: In Jenkins virtualenv, dependencies are installed with `pip install -r requirements.txt` without `--user` flag to avoid issues in isolated environments.  

## Pipeline Stages

- Checkout SCM: Pull code from the respective repository branch.  
- Install: Install dependencies from requirements.txt and BATS if not present in the image/system.  
- Unit Tests: Run Python unit tests using pytest.  
- Integration Tests: Verify component collaboration (mainly on main and dev branches).  
- Bash Tests: Test `.sh` scripts using bats.  
- Coverage: Generate code coverage report (`pytest --cov=src`).  
- Archive: Archive test results in `.xml` format as Jenkins artifacts.  

## Running Locally

To run the project and tests locally, follow these steps:

### 1. Build and run Jenkins container
```bash
docker build -t jenkins-python .
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-python
```

Jenkins will be available at http://localhost:8080
.

2. Unlock Jenkins
 ```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
Use the password in the Jenkins UI.

4. Initial Setup
Install suggested plugins.
Create an admin user.
5. Configure Multibranch Pipeline
New Item -> Multibranch Pipeline, name: jenkins-pipeline
Source (fork my repo) -> Git: https://github.com/YourRepo
Add credentials if repo is private.
Set Script Path to Jenkinsfile.
Optional: Enable periodic branch scanning.
7. Pipeline Overview

Stages executed automatically per branch:

Checkout repository
Install Python dependencies
Unit Tests (PYTHONPATH=. for src)
Integration Tests
Bash Tests
Coverage
Archive results

This pipeline covers Python tests, Bash scripts, and code coverage.

Unit: `PYTHONPATH=. pytest tests/unit`  
Integration: `PYTHONPATH=. pytest tests/integration`  
Bash: `bats tests/bash/test_generate_files.bats`  

## Tests

- Unit Tests: Check isolated functions in `src/main.py` and modules in `src/feature1/`.  
- Integration Tests: Verify full CLI workflow, including file system operations in temporary directories.  
- Bash Tests: Ensure correct operation of data-generating scripts (`generate_files.sh`) and experimental scripts.  

## License

This project is available under the Apache-2.0 license.

## Screenshots

- **Main Branch Build:**  
  ![Main Build]
  <img width="945" height="697" alt="image" src="https://github.com/user-attachments/assets/5be7af80-ad42-4b55-a633-2dab1ab2017a" />
  <img width="945" height="697" alt="image" src="https://github.com/user-attachments/assets/5ba21e04-6cb3-498b-860e-7ac8e00a673b" />


  Failed attepts:
  <img width="924" height="1158" alt="image" src="https://github.com/user-attachments/assets/8648f787-6d5d-4594-bf5c-d9daf8290695" />




- **Feature Branch Build:**  
  ![Feature Build]<img width="945" height="434" alt="image" src="https://github.com/user-attachments/assets/5b2c0024-2e26-47be-ada7-e6e8bae4f704" />


- **Dev Branch Build:**  
  ![Dev Build]<img width="945" height="416" alt="image" src="https://github.com/user-attachments/assets/b5e0cbcd-1f9b-4042-94f8-7a4f06571e72" />


<img width="945" height="436" alt="image" src="https://github.com/user-attachments/assets/6ce37986-2eca-4575-8f8e-4b9e89d83887" />
