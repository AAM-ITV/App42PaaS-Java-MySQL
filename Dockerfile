# Используем Tomcat образ
FROM tomcat:9-jdk11-openjdk-slim

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y git maven

# Клонируем репозиторий
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git /usr/local/tomcat/webapps/hello

# Переходим в директорию проекта
WORKDIR /usr/local/tomcat/webapps/hello

# Собираем проект с помощью Maven
RUN mvn clean package

# Копируем WAR файл в директорию Tomcat
RUN cp target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Открываем порт 8080
EXPOSE 8080
