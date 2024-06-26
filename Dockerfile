# FROM: imageName
FROM ubuntu:20.04


# Bilgilendirme
LABEL maintainer="deneme@gmail.com"


#Çevresel Değişkenler
ENV APP_NAME="Ubuntu Apache Tomcat JRE Deploy"
ENV VERSION="v1.0.0"
ENV PORT="http://localhost:8080"


# Çalıştırmak
RUN echo "App Name: $APP_NAME "
RUN echo "Version $VERSION"
RUN echo "Port: $PORT"

# Data Persist (Kalıcılığı)
VOLUME /tmp

# Tomcat Configuration
# tomcat-users.xml (Rol Management)
# context.xml (<!-- -->)

# Tomcat War Added
# COPY ./sample.war /usr/local/tomcat/webapps
# http://localhost:<PORT>/sample


# Dockerfile Çalışırken etkileşimli soruları önlemek istiyorsak
ENV DEBIAN_FRONTEND=noninteractive


## JRE
RUN apt-get update && \ 
apt-get install -y openjdk-11-jre-headless curl && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# Tomcat Set
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Tomcat Directory 
RUN mkdir -p $CATALINA_HOME

# Tomcat Instal tar.gz
RUN curl -L https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.25/bin/apache-tomcat-10.1.25.tar.gz  -o /tmp/tomcat.tar.gz && \
tar xzf /tmp/tomcat.tar.gz -C $CATALINA_HOME --strip-components=1 && \
rm /tmp/tomcat.tar.gz

# EXPOSE
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh","run"]


# HealtCheck: Uygulamanın Sağlık kontrolü
# --interval=30s : Her 30 saniyede bir çalışsın (saniye)
# --timeout=30s : SAğlık kontrolünün tamamlanması için beklenen süre (saniye)
# --start-period=5s : Konteynar başlatıldıkran sonta sağlık kontrolünü için 5 saniye bekle
# --retries=3 : Sağlık kontrolü başarısızsa 3 defa deneme yapsın
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD wget --quiet --trier=1 --spider http://localhost:8080 exit 1


######################################################
# Eğer Dockerfile olarak yazılmışsa
# docker build -t my_tomcat2 .
# 
# Eğer Dockerfile ismi değiştirmişsek (CustomDockerfileTomcat)
# docker build -t my_tomcat2 -f CustomDockerfileTomcat .
# 
# docker container run -d --name tomcat_container -p 1111:8080  my_tomcat2
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 

