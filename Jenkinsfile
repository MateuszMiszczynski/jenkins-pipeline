pipeline {
    agent any
    stages {
        stage('Install') { steps { sh 'pip install -r requirements.txt' } }
        stage('Integration Tests') {
            steps {
                echo "Running integration tests for Dev"
                sh 'pytest tests/integration --maxfail=1 -q'
            }
        }
        stage('Bash Scripts') {
            steps {
                echo "Testing experimental Bash scripts"
                sh 'bats scripts/experimental.sh'
            }
        }
    }
    post {
        always { echo "Dev build finished: ${currentBuild.currentResult}" }
    }
}
