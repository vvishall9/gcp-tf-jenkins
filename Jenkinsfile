pipeline {
   agent any
   environment {
       GOOGLE_CREDENTIALS = credentials('gcp-key') // Jenkins credential ID for GCP Service Account
       TF_VAR_project = 'dev-gce-test'
       GIT_TOKEN = credentials('git-token')
   }
   stages {
       stage('Checkout') {
           steps {
               // Checkout the code from GitHub repository
               git branch: 'main', url: 'https://${GIT_TOKEN}@github.com/vvishall9/gcp-tf-jenkins.git'
           }
       }
       stage('Setup Terraform') {
           steps {
               // Install Terraform if not already installed or use Terraform plugin
               sh 'curl -fsSL https://apt.releases.hashicorp.com /gpg | sudo apt-key add -'
               sh 'sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"'
               sh 'sudo apt-get update && sudo apt-get install terraform'
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
