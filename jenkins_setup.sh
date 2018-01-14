wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

if ! grep -q "deb https://pkg.jenkins.io/debian-stable binary/" "/etc/apt/sources.list"; then
  echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
fi

sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y unzip
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y jenkins

wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
unzip sdk-tools-linux-3859397.zip

cd ~

mkdir android-sdk
mv tools/ android-sdk/

yes Y | android-sdk/tools/bin/sdkmanager --update
android-sdk/tools/bin/sdkmanager "platforms;android-26" "build-tools;26.0.1" "extras;google;m2repository" "extras;android;m2repository"
yes Y | android-sdk/tools/bin/sdkmanager --licenses

echo "export ANDROID_HOME=/home/imjacklai/android-sdk" | sudo tee -a ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/tools" | sudo tee -a ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" | sudo tee -a ~/.bashrc

source .bashrc
sudo chmod -R 777 android-sdk/