# Jenkins for Android

## Installation

```
$ bash jenkins_setup.sh
```

## Setup Jenkins

### Install plugins

* Android Lint Plugin
* Android Emulator Plugin
* Android Signing Plugin
* Google Play Publisher Plugin
* Github Integration Plugin

### Configure environment variables

[管理Jenkins] > [設定系統]

![Imgur](http://i.imgur.com/ZlJm6t4.png)

![Imgur](http://i.imgur.com/FRvaXiw.png)

### Create credentials

Create username with password for your Github account

![Imgur](https://i.imgur.com/ArmsUVj.png)

Create secret text for apk signing password

![Imgur](https://i.imgur.com/YAlMqZb.png)

Get JSON key or P12 key from your Google play console ([設定] > [API存取權] > [建立服務帳戶])

Create Google Service Account from private key

![Imgur](http://i.imgur.com/zSb31zv.png)

### Github Jenkins webhook

In the project settings

![Imgur](http://i.imgur.com/1RNPsPf.png)

![Imgur](http://i.imgur.com/kJIEpGQ.png)

### Create multibranch pipeline project

Setup branch source

![Imgur](https://i.imgur.com/MPOMVpB.png)