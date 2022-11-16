pipeline {
    agent any
    environment{
        MYSQL_ROOT_PASSWORD='1234'
    }
    parameters {
        string(name: 'MYSQL_ROOT_PASSWORD', defaultValue: '1234', description: 'MySQL password')
    }
    stages {
        stage ("Initialize Jenkins Env") {
         steps {
            bat '''
            echo "PATH = ${PATH}"
            echo "M2_HOME = ${M2_HOME}"
            '''
         }
        }
        stage('Download Code') {
            steps {
//                echo 'checking out'
               checkout scm
            }
        }
//         stage('Execute Tests'){
//             steps {
// //                 echo 'Testing'
//                 bat 'mvn test'
//             }
//         }
        stage('Build Application'){
            steps {
                echo 'Building...'
                bat 'mvn install -Dmaven.test.skip=true'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                bat 'docker build -t pranavpatel986/banking:0.0.2 .'
            }
        }
       stage('Create Database') {
            steps {
                echo 'Running Database Image'
            //    bat 'docker kill bankmysql 2> /dev/null'
            //    bat 'docker kill cloudbank 2> /dev/null'
            //    bat 'docker rm bankmysql 2> /dev/null'
            //    bat 'docker rm cloudbank 2> /dev/null'
//                 bat 'docker stop bankmysql || true && docker rm bankmysql || true'
                bat 'docker run --detach --name=bankmysql --env="MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" -p 3307:3306 mysql'
//                 bat 'sleep 20'
            //  bat 'docker exec -i bankmysql mysql -uroot -proot < sql_dump/onlinebanking.sql'
                bat 'docker exec -i bankmysql mysql -uroot -p${MYSQL_ROOT_PASSWORD} < sql_dump/onlinebanking.sql'
            }
        }
        stage('Deploy and Run') {
            steps {
                echo 'Running Application'
//                 bat 'docker stop cloudbank || true && docker rm cloudbank || true'
                bat 'docker run --detach --rm -p 8080:8080 -t --link bankmysql:localhost pranavpatel986/banking:0.0.2'
            }
        }
    }
}