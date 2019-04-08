FROM centos:7.6.1810

ENV JAVA_VERSON 1.8.0   
ENV MAVEN_VERSION 3.3.3
#ENV GECKODRIVER_VERSION 0.24.0
ENV JAVA_HOME /usr/lib/jvm/java
ENV MAVEN_HOME /usr/share/maven

#RUN yum -y update && \
RUN yum -y install java-${JAVA_VERSON}-openjdk java-${JAVA_VERSON}-openjdk-devel which firefox

RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-${MAVEN_VERSION} /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

WORKDIR /app
COPY . /app

RUN mvn clean verify
