pipeline {
    agent any
    environment {
        APPLICATION_NAME = 'demo-web-app'
        DEPLOYMENT_GROUP = 'demo-web-app-group'
        AWS_REGION = 'us-east-1'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/abhisran/web-app-cicd.git'
            }
        }
        stage('Deploy via CodeDeploy') {
            steps {
                script {
                    sh '''
                        aws deploy create-deployment \
                            --application-name $APPLICATION_NAME \
                            --deployment-group-name $DEPLOYMENT_GROUP \
                            --github-location repository=abhisran/web-app-cicd,commitId=$(git rev-parse HEAD) \
                            --region $AWS_REGION
                    '''
                }
            }
        }
    }
}
