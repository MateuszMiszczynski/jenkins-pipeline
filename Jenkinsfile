pipeline {
    agent any
    stages {
        stage('Install') { steps { sh 'pip install -r requirements.txt' } }
        stage('Unit Tests') {
            steps {
                echo "Running unit tests only for Feature"
                sh 'PYTHONPATH=. pytest tests/unit/feature1 --maxfail=1 -q'
            }
        }
    }
    post {
        always { echo "Feature build finished: ${currentBuild.currentResult}" }
    }
}
