FROM centos:7.6.1810

ENV JAVA_VERSON 1.8.0   
ENV MAVEN_VERSION 3.3.3
ENV FIREFOX_VERSION 43.0
ENV JAVA_HOME /usr/lib/jvm/java
ENV MAVEN_HOME /usr/share/maven
ENV DISPLAY localhost:0.0

#RUN yum -y update && \
RUN yum -y install java-${JAVA_VERSON}-openjdk java-${JAVA_VERSON}-openjdk-devel which wget xorg-x11-server-Xvfb bzip2 dbus-x11 \
  && dbus-uuidgen > /var/lib/dbus/machine-id

RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-${MAVEN_VERSION} /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

RUN wget --no-verbose -O /tmp/firefox.tar.bz2 https://ftp.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-GB/firefox-$FIREFOX_VERSION.tar.bz2 \
  && rm -rf /opt/firefox \
  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
  && rm /tmp/firefox.tar.bz2 \
  && mv /opt/firefox /opt/firefox-$FIREFOX_VERSION \
  && chmod 755 /opt/firefox-$FIREFOX_VERSION \
  && ln -fs /opt/firefox-$FIREFOX_VERSION/firefox /usr/bin

WORKDIR /app
COPY . /app

RUN chmod +x ./src/main/scripts/bootstrap.sh
CMD './src/main/scripts/bootstrap.sh'
