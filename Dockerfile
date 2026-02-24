# ----------------------------------------------------------------------
# 1. 빌더 스테이지 (Flutter Web 빌드)
# ----------------------------------------------------------------------
FROM dart:3.9.2 as builder 

ARG ENVIRONMENT=dev
ARG SENTRY_RELEASE

ENV PATH="/usr/local/flutter/bin:${PATH}"

# Flutter SDK 설치
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
RUN flutter channel stable && flutter upgrade && flutter config --enable-web

WORKDIR /app
COPY pubspec.* ./
COPY . .
RUN flutter pub get
# 주입된 ARG ENVIRONMENT를 사용하여 해당 환경만 빌드
RUN flutter build web --release \
  --source-maps \
  --dart-define=ENVIRONMENT=${ENVIRONMENT} \
  --dart-define=SENTRY_RELEASE=${SENTRY_RELEASE} \
  --no-tree-shake-icons --base-href=/

# ----------------------------------------------------------------------
# 2. 프로덕션 스테이지 (Nginx)
# ----------------------------------------------------------------------
FROM nginx:alpine as production

# ARG ENVIRONMENT를 사용하여 복사 경로 결정 (Dev: /dev, Prod: /prod)
ARG ENVIRONMENT=dev

# 빌드된 Flutter Web 정적 파일을 Nginx 기본 루트에 복사
COPY --from=builder /app/build/web /usr/share/nginx/html

# 기본 Nginx에 사용자 정의 설정 파일을 복사합니다.
COPY nginx/${ENVIRONMENT}.conf /etc/nginx/conf.d/default.conf

# Nginx 시작 (기본 이미지의 CMD 사용)
CMD ["nginx", "-g", "daemon off;"]