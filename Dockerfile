FROM node:latest
MAINTAINER 'pezhvak'
RUN apt update
RUN echo "deb http://deb.debian.org/debian buster main\ndeb http://deb.debian.org/debian buster-updates main\ndeb http://deb.debian.org/debian-security buster/updates main" > /etc/apt/sources.list.d/debian.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A
RUN echo 'Package: *\nPin: release a=eoan\nPin-Priority: 500\n\nPackage: *\nPin: origin "ftp.debian.org"\nPin-Priority: 300\n\nPackage: chromium*\nPin: origin "ftp.debian.org"\nPin-Priority: 700' > /etc/apt/preferences.d/chromium.pref
RUN apt update
RUN apt install chromium -y
RUN mkdir -p /usr/share/app/
WORKDIR /usr/share/app
#RUN npm i playwright

CMD ['node']
