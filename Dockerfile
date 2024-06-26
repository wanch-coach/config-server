# FROM docker
# COPY --from=docker/buildx-bin:latest /buildx /usr/libexec/docker/cli-plugins/docker-buildx

# 서버를 구동시킬 자바를 받아옵니다.
FROM azul/zulu-openjdk:17-latest as build

# `JAR_FILE` 이라는 이름으로 build 한 jar 파일을 지정합니다.
ARG JAR_FILE=./build/libs/*.jar

# 지정한 jar 파일을 app.jar 라는 이름으로 Docker Container에 추가합니다.
ADD ${JAR_FILE} app.jar

ARG ENCRYPT_KEY
ENV ENCRYPT_KEY $ENCRYPT_KEY

# app.jar 파일을 실행합니다.
ENTRYPOINT ["java","-Duser.timezone=Asia/Seoul", "-jar","/app.jar"]
