pipeline {
    agent any
    
    stages {
        stage('Linting') {
            steps {
                sh 'cookstyle mywebserver'
            }
        }
        
        stage('Testing') {
            steps {
                sh 'LANG=en_US chef exec rspec'
                
            }
        }
        
        
        stage('Deployment') {
            steps {
                sh 'knife --config config.rb cookbook upload mywebserver'
                
            }
        }
    }
}
