pipeline {
    agent any 
    
    environment {
        GIT_REPO_URL = 'https://github.com/Anup-maurya/CaseStudyBatch01.git'
        GIT_BRANCH = 'main'
        TERRAFORM_DIR = 'terraform'
        AWS_ACCESS_KEY_ID     = credentials('Access_key_Id')
        AWS_SECRET_ACCESS_KEY = credentials('Secret_access_key')
        AWS_DEFAULT_REGION    = 'eu-west-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: "${GIT_REPO_URL}", branch: "${GIT_BRANCH}"
            }
        }

        stage('Terraform') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    echo "Running Terraform commands..."
                    sh 'terraform init'
                    sh 'terraform validate '
                    sh """
                            terraform apply -auto-approve \
                            -var "ansible_public_key=${env.ANSIBLE_PUBLIC_KEY}"
                        """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
        always {
            echo 'This will always run, whether the build is successful or not.'
        }
    }
}

