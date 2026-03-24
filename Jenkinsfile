pipeline {
    agent any
    stages {
        stage('Install') { steps { sh 'pip install -r requirements.txt' } }
        stage('Unit Tests') { steps { sh 'pytest tests/unit' } }
        stage('Integration Tests') { steps { sh 'pytest tests/integration' } }
        stage('Bash Tests') { steps { sh 'bats tests/bash/test_generate_files.bats' } }
        stage('Coverage') { steps { sh 'pytest --cov=src tests/unit tests/integration' } }
        stage('Archive') { steps { archiveArtifacts artifacts: '**/test_results/*.xml', allowEmptyArchive: true } }
    }
}
