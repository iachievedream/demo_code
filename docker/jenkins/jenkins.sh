#!/bin/bash
cd /
sudo mkdir mydata
sudo chown -R 1000 mydata
cd mydata
sudo mkdir jenkins
sudo chown -R 1000 jenkins
sudo docker run --name myjenkins -d -p 8080:8080 -p 50000:50000 -v /mydata/jenkins:/var/jenkins_home jenkins/jenkins
cat /mydata/jenkins/secrets/initialAdminPassword