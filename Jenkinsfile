pipeline {
    agent any
    environment {
        PIP_REQUIREMENTS = 'requirements.txt'
    }
    options {
        timestamps()
        ansiColor('xterm')
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh "python3 -m pip install --upgrade pip"
                sh "pip install -r ${PIP_REQUIREMENTS}"
            }
        }
        stage('Unit Tests') {
            when {
                anyOf {
                    branch 'main'
                    branch 'develop'
                    branch pattern: "feature/.*", comparator: "REGEXP"
                    branch pattern: "hotfix/.*", comparator: "REGEXP"
                }
            }
            steps {
                sh 'pytest tests/unit --maxfail=1 --disable-warnings -q'
            }
        }
        stage('Integration Tests') {
            when {
                anyOf {
                    branch 'main'
                    branch 'develop'
                }
            }
            steps {
                sh 'pytest tests/integration --maxfail=1 --disable-warnings -q'
            }
        }
        stage('Bash Tests') {
            when {
                branch 'main'
            }
            steps {
                sh 'bats tests/bash/test_generate_files.bats'
            }
        }
        stage('Coverage Report') {
            when {
                branch 'main'
            }
            steps {
                sh 'pytest --cov=src tests/unit tests/integration'
                sh 'echo "Coverage generated"'
            }
        }
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: '**/test_results/*.xml', allowEmptyArchive: true
            }
        }
    }
    post {
        always {
            echo "Build finished with status: ${currentBuild.currentResult}"
        }
        success {
            echo "All tests passed!"
        }
        failure {
            echo "Some tests failed!"
        }
    }
}
