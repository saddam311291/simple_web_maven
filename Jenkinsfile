pipeline {
    agent any

    tools {
        git 'DefaultGit'   // Make sure this matches your Jenkins Git tool name
        maven 'maven-399'  // Make sure this matches your Maven tool name
        jdk 'jdk17'        // Make sure this matches your JDK tool name
    }

    environment {
        APP_PORT = '8085'
        APP_IP = '192.168.1.51'
    }

    stages {
        stage('Checkout') {
            steps {
                // Replace with your Git repo URL and branch
                git url: 'https://github.com/saddam311291/simple_web_maven.git', branch: 'main'
            }
        }

        stage('Clean and Install') {
            steps {
                // Use 'bat' for Windows shell commands
                bat 'mvn clean install'
            }
        }

        stage('Build with Maven') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t simple_web_maven .'
            }
        }

        stage('Run JAR') {
            steps {
                // Windows doesn't have 'pkill' or 'nohup' — you need Windows commands or a workaround
                // Here is a simple example to kill the process by name (adjust if needed)
                bat '''
                taskkill /F /IM java.exe || echo No Java process found
                start /B java -jar target\\simple_web_maven-0.0.1-SNAPSHOT.jar --server.port=%APP_PORT% --server.address=%APP_IP% > app.log 2>&1
                '''
            }
        }
    }
}
