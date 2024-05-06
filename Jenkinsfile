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
        CHEF_SERVER_URL = 'https://manage.chef.io/organizations/valpo18'
        CHEF_PEM_FILE_PATH = '/home/student/.chef/cbandi.pem'
    }
    steps {
        sh '''
            knife cookbook upload mywebserver \
                  --config config.rb \
                  --server-url "$CHEF_SERVER_URL" \
                  --key "$CHEF_PEM_FILE_PATH"
        '''
    }
}


    }
}
