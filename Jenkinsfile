pipeline {
   agent any
   environment {
       GOOGLE_CREDENTIALS = credentials('gcp-key') // Jenkins credential ID for GCP Service Account
       
       GIT_TOKEN = credentials('git-token')
   }
   stages {
       stage('Checkout') {
           steps {
               // Checkout the code from GitHub repository
               git branch: 'main', url: 'https://${GIT_TOKEN}@github.com/vvishall9/gcp-tf-jenkins.git'
           }
       }
       
       
       stage('Initialize Terraform') {
           steps {
               script {
                   withCredentials([file(credentialsId: 'gcp-service-account', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                       sh 'terraform init'
                   }
               }
           }
       }
       stage('Apply Terraform') {
           steps {
               script {
                   withCredentials([file(credentialsId: 'gcp-service-account', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                       sh 'terraform apply -auto-approve'
                   }
               }
           }
       }
   }
   post {
       success {
           echo 'Bucket created successfully'
       }
       failure {
           echo 'Failed to create the bucket'
       }
   }
}
