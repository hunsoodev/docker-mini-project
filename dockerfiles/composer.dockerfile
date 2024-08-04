FROM composer:latest

# 비권한 사용자로 설정하기
RUN addgroup -g 1003 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel
# default -gid 1000 -> 1000번은 이미 호스트 그룹에 있음
# HOST_USER=$(id -u), HOST_GROUP=$(id -g) 으로 확인해서 직접 매핑 하기

USER laravel

WORKDIR /var/www/html 
# Laravel 프로젝트가 생성되는 루트 폴더가 됨

ENTRYPOINT [ "composer", "--ignore-platform-reqs"]
# composer 실행파일 : composer 이미지와 컨테이너 내부에 존재
# + 플래그 추가 : composer에 의해 실행되는 모든 명령 작성 

# --ignore-platform-reqs : 일부 종속성이 누락되더라도 경고나 오류 없이 실행할 수 있음