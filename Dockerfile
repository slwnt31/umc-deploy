# 1. 빌드 스테이지 (Gradle 빌드 수행)
FROM eclipse-temurin:21-jdk-jammy AS build
WORKDIR /app

# 호스트의 모든 파일을 컨테이너의 /app으로 복사
COPY . .

# Gradle 빌드를 통해 jar 파일 생성 (테스트는 제외하여 빌드 속도 향상)
RUN ./gradlew bootJar -x test

# 2. 실행 스테이지 (실제 서버에서 구동될 경량 이미지)
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# 빌드 스테이지에서 생성된 jar 파일만 복사해옴
COPY --from=build /app/build/libs/*.jar app.jar

# Spring Boot 기본 포트 개방
EXPOSE 8080

# 애플리케이션 실행 명령어
ENTRYPOINT ["java", "-jar", "app.jar"]