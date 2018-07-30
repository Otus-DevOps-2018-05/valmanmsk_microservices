# valmanmsk_microservices
valmanmsk microservices repository

# ДЗ-13:

## Что сделано

- Установлен docker
- Запущен контейнер hello-world
- Изучены команды docker
- Создали образ и контейнера
- Сохранили вывод docker images в файл

## Задание со *

- Сравнил вывод команды docker inspect для контейнера и для образа

# ДЗ-14:

## Что сделано

- Создал новый проект doker на GCE
- Установил docker-machine
- Создал Docker-host с помощью docker-machine
- Создал файлы Dockerfile, mongod.conf, db_config и start.sh
- Собрал образ
- Запустил контейнер из этого образа
- Зарегистрировался на Docker Hub
- Загрузил на него образ
- Запустил контейнер из образа на Docker Hub

## Задание со *

- Создал конфигурационные файлы Terraform, для создания инстансов в GCE
- Создал плейбуки Ansible для установки docker-ce и запуска контейнера из своего образа на Docker Hub
- Создал шаблон Packer для создания образа с установленным docker-ce в GCE

# ДЗ-15:

## Что сделано

- Создал docker-host с помощью docker-machine
- Подключился к нему с помощью ```eval $(docker-machine env docker-host)```
- Создал файлы Dockerfile внутри папок post-py, comment и ui
- Собрал образы с сервисами
- Запустил контейнеры
- Проверил работу сервисов по порту 9292
- Уменьшил размеры образов с помощью линтера hadolint
- Создал и подключил к контенеру docker volume

## Задания с *

- Запустил контейнеры с другими сетевыми алиасами:
```docker run -d --network=reddit --network-alias=post_db1 --network-alias=comment_db1 mongo:latest
docker run -d --network=reddit --network-alias=post1 --env POST_DATABASE_HOST=post_db1 valmanmsk/post:1.0
docker run -d --network=reddit --network-alias=comment1 --env COMMENT_DATABASE_HOST=comment_db1 valmanmsk/comment:1.0
docker run -d --network=reddit --env POST_SERVICE_HOST=post1 --env COMMENT_SERVICE_HOST=comment1 -p 9292:9292 valmanmsk/ui:1.0
```
- Собрал образ ui на основе alpine linux. На версии 3.8 приложение не работает, поэтому собрал на версии 3.7

