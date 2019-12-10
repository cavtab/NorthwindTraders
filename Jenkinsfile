pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        git(url: 'https://github.com/cavtab/NorthwindTraders.git', branch: 'dotnetcore22', poll: true)
        openshiftBuild 'testappdotnet22ct'
      }
    }
    stage('Deploy') {
      steps {
        openshiftDeploy 'testappdotnet22ct'
      }
    }
    stage('verify ') {
      steps {
        openshiftVerifyDeployment 'testappdotnet22ct'
      }
    }
  }
}