pipeline {
    agen {
        label 'AGENT-1'
    }
    options{
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    environment{
        DEBUG = 'true'
        appVersion = ''
        region = 'us-east-1'
        project = 'e-commerce'
        account_id = 396608804248
        component = 'backend'
        env = 'dev'
    }
    stages{
        stage('Read the Version'){
            steps {
                script{
                    def packageJson = readJsonfile: 'package.json'
                    appVersion = packageJson.version
                    echo "App Version: ${appVersion}"
                }
            }
        }
        stage('Install Dependencies'){
            steps{
                sh 'npm install'
            }
        }
        stage('Docker Build'){
            steps{
                withAWS(region: ${region}, credentials: 'aws-creds'){
                    sh """
                        aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${account_id}.dkr.ecr.us-east-1.amazonaws.com

                        docker build -t ${account_id}.dkr.ecr.us-east-1.amazonaws.com/${project}/${env}/${component}:${appVersion} .

                        docker images

                        docker push ${account_id}.dkr.ecr.us-east-1.amazonaws.com/${project}/${env}/${component}:${appVersion}
                    """
                }
            }

        }
        stage('Deploy'){
            steps {
                withAWS(region: ${region}, credentials: 'aws-creds'){
                    sh """
                        aws eks update-config --region ${region} --name ${project}-${env}
                        cd helm
                        sed -i 's/IMAGE_VERSION/${appVersion}/g' values-${env}.yaml
                        helm upgrade --install ${component} -n ${project} -f values-${env}.yaml . 
                    """
                }
            }
        }
    }
    post{
        always{
            echo "This secion executes always"
            deleteDir()
        }
        success {
            echo "This section executes if pipeline success"
            deleteDir()
        }
        failure{
            echo " This section executes if pipeline fails"
            deleteDir()
        }
    }
}