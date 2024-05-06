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
        
        stage('Cookbook Validation') {
            steps {
                sh 'knife cookbook test mywebserver'
            }
        }
        
        stage('Deployment') {
            steps {
                sh 'knife cookbook upload mywebserver'
            }
        }
    }
}
