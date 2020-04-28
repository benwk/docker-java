FROM tenmaker/maven-base:1.0.7-jdk8-cloud

MAINTAINER benwk

# 设置环境变量
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# 设置应用目录
WORKDIR /app
RUN mkdir -p /app/target

# 设置端口
EXPOSE 8080

# 容器启动
ENTRYPOINT exec java -Djava.securities.egd=file:/dev/./urandom -Dspring.profiles.active=native -jar target/server.jar
