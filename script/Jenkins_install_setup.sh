#!/bin/bash

# Get the kernel name
kernel=$(uname -s)

if [[ "$kernel" == "Linux" ]]; then
  # Commands to execute if the system is Linux
  echo "Running on Linux"
  # Add your Linux-specific commands here
  sudo yum install git maven -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  sudo yum upgrade
  # Add required dependencies for the jenkins package
  sudo yum install java-11-openjdk
  sudo yum install jenkins
  sudo systemctl daemon-reload

elif [[ "$kernel" == "Ubuntu" ]]; then
  # Commands to execute if the system is not Linux (assumed to be Ubuntu)
  echo "Running on Ubuntu"
  # Add your Ubuntu-specific commands here
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
       /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
       https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
       /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install jenkins

else
  echo "os is not supported"
fi
