pipeline {
  agent any

  parameters {
    choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Terraform Action')
  }

environment {
  AWS_DEFAULT_REGION = 'ap-south-1'
  TF_IN_AUTOMATION   = 'true'
  AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
  AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
}


  options {
    disableConcurrentBuilds()
    timestamps()
  }

  stages {

    stage('Terraform Init') {
      steps {
        dir('eks-1') {
           sh '''
            terraform init 
            '''
        }
      }
    }

    stage('Terraform Validate') {
      steps {
        dir('eks-1') {
          sh 'terraform validate'
        }
      }
    }

    stage('Terraform Plan') {
      when {
        expression { params.ACTION == 'apply' }
      }
      steps {
        dir('eks-1') {
          sh 'terraform plan -out=tfplan'
        }
      }
    }

    stage('Approval') {
      when {
        expression { params.ACTION == 'apply' }
      }
      steps {
        input message: 'Approve Terraform Apply?'
      }
    }

    stage('Terraform Apply') {
      when {
        expression { params.ACTION == 'apply' }
      }
      steps {
        dir('eks-1') {
          sh 'terraform apply -auto-approve tfplan'
        }
      }
    }

    stage('Approval Destroy') {
      when {
        expression { params.ACTION == 'destroy' }
      }
      steps {
        input message: 'Approve Terraform Destroy?'
      }
    }

    stage('Terraform Destroy') {
      when {
        expression { params.ACTION == 'destroy' }
      }
      steps {
        dir('eks-1') {
          sh 'terraform destroy -auto-approve'
        }
      }
    }
  }

  post {
    success {
      echo 'Pipeline completed successfully'
    }
    failure {
      echo 'Pipeline failed'
    }
  }
}
