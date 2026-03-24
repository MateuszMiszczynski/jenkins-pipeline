pipeline {
    agent any
    stages {
        stage('Install') { steps { sh 'pip install -r requirements.txt' } }
        stage('Bash Scripts') {
            steps {
                echo "Testing experimental Bash scripts "
                sh 'bats scripts/experimental.sh'
            }
        }
    }
    post {
        always { echo "Dev build finished: ${currentBuild.currentResult}" }
    }
}
