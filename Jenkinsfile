pipeline {
    agent any

    tools {
        maven 'maven-399'
        jdk 'jdk17'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t simple_web_maven .'
            }
        }

        stage('Run JAR') {
            steps {
                // Stop running app if any and run jar in background
                sh '''
                pkill -f "java -jar simple_web_maven-0.0.1-SNAPSHOT.jar" || true
                nohup java -jar target/simple_web_maven-0.0.1-SNAPSHOT.jar > app.log 2>&1 &
                '''
            }
        }
    }
}
