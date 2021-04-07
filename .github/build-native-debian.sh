#!/bin/sh

set -ex

cd "$(dirname "$(dirname "$0")")"

# Add stretch for Java 8
#cat <<END > /etc/apt/sources.list.d/stretch.list
#deb http://deb.debian.org/debian stretch main
#deb http://security.debian.org/debian-security stretch/updates main
#END

#apt-get update -y
#apt-get install -y --no-install-recommends openjdk-8-jdk-headless make gcc libc6-dev texinfo
# Needs to be split, otherwise a newer version of OpenJDK is pulled
#apt-get install -y --no-install-recommends ant
#rm archive/*
#ant jar && ant archive-platform-jar

export DEBIAN_FRONTEND="noninteractive"
apt-get update -y && apt-get install -y openjdk-11-jdk=11.0.7+10-3ubuntu1 openjdk-11-jre=11.0.7+10-3ubuntu1 openjdk-11-jdk-headless=11.0.7+10-3ubuntu1 openjdk-11-jre-headless=11.0.7+10-3ubuntu1 wget curl
java -version
wget https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.6.3/apache-maven-3.6.3-bin.tar.gz 
tar -xzf apache-maven-3.6.3-bin.tar.gz  
export PATH=`pwd`/apache-maven-3.6.3/bin/:$PATH 
mvn -v
mvn -B clean install -U -Pintegration	
