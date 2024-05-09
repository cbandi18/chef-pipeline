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
        script {
            // Set environment variables
            def chefServerUrl = 'https://api.chef.io/organizations/valpo18'
            def chefPemFilePath = "${pwd()}/.chef/cbandi.pem"

            // Upload cookbook using knife command
            withCredentials([file(credentialsId: 'chef_secret', variable: 'CHEF_SECRET')]) {
                sh ''' 
                    env
                    pwd
                    #mkdir .chef
                    echo "$CHEF_SECRET" > .chef/cbandi.pem
                    ls $pwd/.chef/cbandi.pem
                    knife cookbook upload --cookbook-path $pwd sample \
                          --config ./config.rb \
                          --server-url "${chefServerUrl}" \
                          --key $pwd/.chef/cbandi.pem
                '''
            }
        }
    }
}



    }
}
