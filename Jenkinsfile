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
    environment {
        CHEF_PEM_FILE_PATH = '/home/student/.chef/cbandi.pem'
    }
    steps {
        sh '''
            knife --config config.rb \
                  --server-url $(https://manage.chef.io/organizations/valpo18) \
                  --client-key $CHEF_PEM_FILE_PATH \
                  cookbook upload mywebserver
        '''
    }
}

    }
}
