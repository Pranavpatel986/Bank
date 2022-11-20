pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="359983627261"
        AWS_DEFAULT_REGION="us-east-2"
        IMAGE_REPO_NAME="jenkins-pipline-build"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }
    tools{
    	maven 'maven'
    }

    stages {



        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/Pranavpatel986/Bank.git']]])
            }
        }
        stage('Built maven'){
            steps{
                script{
                    sh 'mvn clean install'
                }
            }
        }



    // Building Docker images
    stage('Building image') {
      steps{
        script {
          //dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
          //sh 'docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} jenkins-pipline-build'
          sh 'docker build -t banking:0.1 .'
          sh 'docker tag Banking:0.1 ${IMAGE_REPO_NAME}:${IMAGE_TAG}'
        }
      }
    }

    stage('Logging into AWS ECR') {
            steps {
                script {
                sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                }

            }
        }

    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{
         script {
                sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:${IMAGE_TAG}"
                sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
         }
        }
      }
    }
}



// pipeline {
//     agent any
//
//     parameters {
//         string(name: 'MYSQL_ROOT_PASSWORD', defaultValue: '1234', description: 'MySQL password')
//     }
//     stages {
//         stage ("Initialize Jenkins Env") {
//          steps {
//             bat '''
//             echo "PATH = ${PATH}"
//             echo "M2_HOME = ${M2_HOME}"
//             '''
//          }
//         }
//         stage('Download Code') {
//             steps {
// //                echo 'checking out'
//                checkout scm
//             }
//         }
// //         stage('Execute Tests'){
// //             steps {
// // //                 echo 'Testing'
// //                 bat 'mvn test'
// //             }
// //         }
//         stage('Build Application'){
//             steps {
//                 echo 'Building...'
//                 bat 'mvn install -Dmaven.test.skip=true'
//             }
//         }
//         stage('Build Docker Image') {
//             steps {
//                 echo 'Building Docker image'
//                 bat 'docker build -t pranavpatel986/banking:0.0.2 .'
//             }
//         }
// //        stage('Create Database') {
// //             steps {
// //                 echo 'Running Database Image'
// //             //    bat 'docker kill bankmysql 2> /dev/null'
// //             //    bat 'docker kill cloudbank 2> /dev/null'
// //             //    bat 'docker rm bankmysql 2> /dev/null'
// //             //    bat 'docker rm cloudbank 2> /dev/null'
// // //                 bat 'docker stop bankmysql || true && docker rm bankmysql || true'
// //                 bat 'docker run --detach --name=bankmysql --env="MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" -p 3307:3306 mysql'
// // //                 bat 'sleep 20'
// //             //  bat 'docker exec -i bankmysql mysql -uroot -proot < sql_dump/onlinebanking.sql'
// //                 bat 'docker exec -i bankmysql mysql -uroot -p${MYSQL_ROOT_PASSWORD} < /code/src/main/resources/sql/V1__20190307_Create_Tables_Online_Banking.sql'
// //             }
// //         }
//         stage('Deploy and Run') {
//             steps {
//                 echo 'Running Application'
// //                 bat 'docker stop cloudbank || true && docker rm cloudbank || true'
//                 bat 'docker run --detach --rm -p 8080:8080 -t --link bankmysql:localhost pranavpatel986/banking:0.0.2'
//             }
//         }
//     }
// }