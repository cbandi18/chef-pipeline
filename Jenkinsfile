pipeline {
    agent any
    
    stages {
        stage('Linting') {
            steps {
                sh 'foodcritic .'
            }
        }
        
        stage('Testing') {
            steps {
                sh 'chef exec rspec'
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
