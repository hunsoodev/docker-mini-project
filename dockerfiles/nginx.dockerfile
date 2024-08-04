FROM nginx:stable-alpine-slim

WORKDIR /etc/nginx/conf.d

COPY nginx/nginx.conf .

RUN mv nginx.conf default.conf

WORKDIR /var/www/html

COPY src .

# 실제 배포할때는 이미지에 복사되는 스냅샷이 중요해짐 -> 바인드 마운트x
