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

