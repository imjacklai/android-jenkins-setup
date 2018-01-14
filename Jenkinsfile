node {
  stage('checkout') {
    echo 'checkout from github'
    git url: 'https://github.com/imjacklai/android-jenkins.git', branch: 'master'
  }

  stage('copy file') {
    echo 'copy file'
    sh "sudo cp /home/imjacklai/google-services.json ${env.WORKSPACE}/app/"
  }

  stage('clean') {
    echo 'clean'
    sh './gradlew clean'
  }

  stage('test') {
    echo 'test'
    sh './gradlew test'
  }

  if (env.BRANCH_NAME == 'master') {
    stage('build apk') {
      echo 'build apk'
      withCredentials([string(credentialsId: 'android_signing_password', variable: 'PASSWORD')]) {
        sh '''
          set +x
          ./gradlew -PkeyAlias='android' -PkeyPassword=${PASSWORD} -PstorePassword=${PASSWORD} -PstoreFile='/home/imjacklai/ctl.jks' assembleRelease
        '''
      }
    }

    stage('upload to google play') {
      echo 'upload to google play'
      androidApkUpload googleCredentialsId: 'android-jenkins', apkFilesPattern: '**/*-release.apk', trackName: 'alpha', recentChangeList: [[language: 'zh-TW', text: "Alpha 新版上架！"]]
    }
  }
}
