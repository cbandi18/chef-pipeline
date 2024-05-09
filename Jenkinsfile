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
        CHEF_SECRET     = credentials('chef_secret')
    }
    steps {
        script {
            // Set environment variables
            def chefServerUrl = 'https://api.chef.io/organizations/valpo18'
            def chefPemFilePath = "${pwd()}/.chef/cbandi.pem"

            // Upload cookbook using knife command
                sh ''' 
                    env
                    pwd
                    #mkdir .chef
                    echo "$CHEF_SECRET" > .chef/cbandi.pem
                    ls .chef/cbandi.pem
                    knife cookbook upload --cookbook-path $(pwd) sample \
                          --config ./config.rb \
                          --server-url "${chefServerUrl}" \
                          --key .chef/cbandi.pem
                '''
        }
    }
}



    }
}
