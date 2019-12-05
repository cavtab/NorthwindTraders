pipeline {
  agent any
  stages {
    stage('01') {
      steps {
        git(url: 'https://github.com/cavtab/NorthwindTraders.git', branch: 'dotnetcore22', poll: true)
        openshiftBuild 'testappdotnet22ct'
      }
    }
    stage('error') {
      steps {
        openshiftDeploy 'testappdotnet22ct'
      }
    }
  }
}