## 배포 요약

### 🛠️ Tech Stack
- **Cloud** : GCP Compute Engine (Ubuntu 22.04 LTS, e2-medium)
- **Container** : Docker, Docker Compose
- **Web Server** : Nginx
- **SSL/TLS** : Let's Encrypt (Certbot)

### 🛠️ 과정
1. **GCP VM 인스턴스 생성** : 서울 리전에 Ubuntu 서버 컴퓨터 구동.
2. **도커 환경 구축** : 서버에 접속하여 Docker 및 Docker Compose 설치 및 계정 권한 부여.
3. **소스 코드 배포** : 깃허브 레포지토리를 클론하여 최신 코드 반영.
4. **리버스 프록시(Nginx)** : 외부 요청(80, 443 포트)를 받아 내부 스프링 컨테이너로 토스해 주는 환경 빌드.
5. **HTTPS 보안 적용** : 구매한 도메인(`umc-deploy.store`)을 GCP 외부 IP와 DNS 연동한 후, Certbot 컨테이너를 통해 무료 인증서를 발급 받아 보안 연결.
