FROM tenmaker/maven-base:1.0.7-jdk8-cloud

# MAINTAINER benwk
LABEL maintainer="benwk@delay.work"

# 设置环境变量
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# 安装中文字体
RUN apt-get install fontconfig

# 设置应用目录
WORKDIR /base
RUN mkdir -p /base/target /app

# 设置端口
EXPOSE 8080

# 容器启动
ENTRYPOINT exec java -Djava.securities.egd=file:/dev/./urandom -jar target/server.jar
