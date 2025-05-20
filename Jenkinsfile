pipeline {
    agent any

    tools {
        git 'DefaultGit'   // Make sure this matches your Jenkins Git tool name
        maven 'maven-399'  // Make sure this matches your Maven tool name
        jdk 'jdk17'        // Make sure this matches your JDK tool name
    }

    environment {
        APP_PORT = '9090'
        CONTAINER_NAME = 'simple_web_maven_container'
        IMAGE_NAME = 'simple_web_maven'
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
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t ${IMAGE_NAME} .'
            }
        }

         stage('Run Docker Container') {
                    steps {
                        bat """
                        docker stop ${CONTAINER_NAME} || echo Container not running
                        docker rm ${CONTAINER_NAME} || echo Container not found
                        docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:${APP_PORT} ${IMAGE_NAME}
                        """
                    }
         }
    }
}
