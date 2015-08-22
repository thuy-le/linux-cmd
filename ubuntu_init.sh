#!/bin/bash
# update
sudo apt-get update -y
# essentials
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y git
sudo apt-get install -y vim
# Java
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk
# Maven
sudo apt-get install -y maven
# Docker
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker ${USER}
sudo gpasswd -a ${USER} docker
sudo service docker restart
# jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins
sudo usermod -aG docker jenkins
sudo gpasswd -a jenkins docker
sudo service docker restart
sudo service jenkins restart
# LAMP
sudo apt-get install -y apache2
sudo apt-get install -y mysql-server libapache2-mod-auth-mysql php5-mysql
sudo apt-get install -y php5 libapache2-mod-php5 php5-mcrypt
# skype
sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update -y && sudo apt-get install -y skype pulseaudio:i386
# nodejs
sudo apt-get update -y
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.profile 
sudo ln -s "$(which nodejs)" /usr/bin/node
# wordpress
sudo apt-get update -y
sudo echo "DROP DATABASE IF EXISTS `wordpress`; CREATE DATABASE `wordpress`; DROP USER `wordpressuser`@localhost; FLUSH PRIVILEGES; CREATE USER `wordpressuser`@localhost IDENTIFIED BY 'wordpress101'; GRANT ALL PRIVILEGES ON `wordpress`.* TO `wordpressuser`@localhost; FLUSH PRIVILEGES;" > wordpress.sql
sudo cat wordpress.sql | mysql -u root -palecsu
sudo rm wordpress.sql
sudo mkdir wordpress
cd wordpress
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
sudo apt-get install -y php5-gd libssh2-php
#######
echo 'Installation finished. Please logout from your user and login again for some feartures to work properly.'
