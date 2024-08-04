FROM php:fpm-alpine

WORKDIR /var/www/html

COPY src .

RUN docker-php-ext-install pdo pdo_mysql

# 컨테이너의 특정 폴더(소스 코드가 복사되는 작업 디렉토리)에 대한 쓰기 액세스 권한 부여
RUN chown -R www-data:www-data /var/www/html
# www-data 유저? php 이미지에 의해 생성된 디폴트 유저 -> 쓰기 권한을 가지고 있지 않음

# # 비권한 사용자로 설정하기
# RUN addgroup -g 1003 laravel && adduser -G laravel -g "Laravel User" -s /bin/sh -D laravel
# # default -gid 1000 -> 1000번은 이미 호스트 그룹에 있음
# # HOST_USER=$(id -u), HOST_GROUP=$(id -g) 으로 확인해서 직접 매핑 하기
# USER laravel





# CMD 또는 ENTRYPOINT가 없으면 베이스 이미지의 디폴트 명령을 사용 -> CMD 또는 ENTRYPOINT를 사용함
# 여기서는 PHP 인터프리터를 호출하는 명령이 베이스 이미지에 있음