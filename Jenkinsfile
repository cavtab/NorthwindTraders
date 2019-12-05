pipeline {
  agent any
  stages {
    stage('01') {
      steps {
        openshiftBuild 'calvinho'
      }
    }
    stage('') {
      steps {
        openshiftDeploy 'calvinho'
      }
    }
  }
}