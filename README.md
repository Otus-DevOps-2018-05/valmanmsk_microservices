# valmanmsk_microservices
valmanmsk microservices repository

# ДЗ-12:

## Что сделано

- Установлен docker
- Запущен контейнер hello-world
- Изучены команды docker
- Создали образ и контейнера
- Сохранили вывод docker images в файл

## Задание со *

- Сравнил вывод команды docker inspect для контейнера и для образа

# ДЗ-13:

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

# ДЗ-14:

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

# ДЗ-15:

## Что сделано:

- Создал docker-host с помощью docker-machine
- Подключился к нему с помощью ```eval $(docker-machine env docker-host)```
- Изучил None network driver и Host network driver с помощью запуска контейнера из образа joffotron/docker-net-tools
- Запустил проект reddit из образов созданных в прошлых ДЗ в одной сети reddit
- Запустил проект в двух сетях ```front_net и back_net```
- Изучил с помощью ```bridge-utils``` bridge-интерфейсы каждой из сетей
- Посмотрел правила iptables
- Убедился, что процесс ```docker-proxy``` запущен
- Установил docker-compose на локальную машину
- Создал файл ```docker-compose.yml```
- Собрал образы и запустил контейнеры из этих образов с помощью ```docker-compose```
- Отредактировал файл ```docker-compose.yml``` чтобы приложения запускались в разных сетях
- Параметризировал порт хоста, порт докера, протокол сервиса ui, параметризирвал версии сервисов
- Записал эти параметры в файл .env
- Убедился, что ```docker-compose up -d``` подхватывает переменные из файла .env
- Изменил базовое имя проекта с помощью параметра ```-p имя_проекта```, также можно прописать в файл .env параметр ```COMPOSE_PROJECT_NAME```
- Создал файл ```docker-compose.override.yml```, где создал и смаппил ```volumes``` чтобы код приложений был в файловой системе хоста
- В нем же прописал команду для запуска ```puma``` в дебаг режиме

# ДЗ-16:

## Что сделано:
- Создал инстанс gitlab-ci в GCE через Web
- Поставил docker с помощью docker-machine
- Инсталлировал docker-compose вручную
- Создал файл docker-compose.yml
- Запустил Gitlab-CI с помощью docker-composer
- Зашел на http://35.231.179.25
- Создал и настроил проект
- На локальной машине добавил remote gitlab
- Создал и запушил файл пиплайна
- На ВМ запустил и зарегистровал Runner
- Добавил исходный код reddit в gitlab
- Отредактировал пиплайн и добавил скрипт для тестирования reddit
- Убедился, что все тесты прошли успешно
- Выключил ВМ

# ДЗ-17:

## Что сделано:
- Создал новый проект в GCE
- Определил окружения DEV, STAGE и PROTUCTION
- Сделал чтобы job в STAGE и PRODUCTION, который имитирует деплой запускался вручную
- Добавил директиву, чтобы на STAGE и PRODUCTION деплой запускался только при наличии тэга определенного формата
- Создал динамическое окружение, которое создается для каждой ветки, кроме мастера

# ДЗ-18:

## Что сделано:
- Создал правила файрвола и docker хост в GCE
- Создал и запустил контейнер из готового образа Prometheus в dockerhub
- Проверил работу веб-интерфейса
- Собрал образ Prometheus
- Собрал образы микросервисов из папок в src с помощью скрипта ```docker_build.sh```
- Определил в файле docker/docker-compose.yml новый сервис prometheus и добавил сеть
- Поднял сервисы
- Проверил работу веб-интерфесов Prometheus и reddit
- Все Targets поднялись и находятся в состоянии UP
- В списке метрик нет ui_health. По ссылке http://ui:9090/metrics видно, что эти метрики закомментированы:
```
# TYPE ui_health gauge
# HELP ui_health Health status of UI service
# TYPE ui_health_post_availability gauge
# HELP ui_health_post_availability Check if Post service is available to UI
# TYPE ui_health_comment_availability gauge
# HELP ui_health_comment_availability Check if Comment service is available to UI
```
- Определил в файле docker/docker-compose.yml сервис node-exporter
- Прописал в Prometheus job для этого сервиса
- Собрал новый Docker для Prometheus
- Пересоздал сервисы
- Проверил, что в списке Targets появился новый endpoint
- С помощью метрики node_load1 проследил за ростом нагрузки при запуске: ```yes > /dev/null```
- Запушил собранные образы на DockerHub:
```
https://hub.docker.com/u/valmanmsk/
```

# ДЗ №19

## Что сделано:

- Создал docker-host в GCE
- Разделил файл docker-compose.yml на два. Перенес мониторинг в отдельный файл
- Добавил настройки для cAdvisor в docker-compose-monitoring.yml и в конфигурацию Prometheus
- Запустил сервисы приложения и мониторинга
- Проверил UI cAdvisor
- Добавил настройки для Grafana в docker-compose-monitoring.yml
- Запустил сервис grafana
- Проверил UI Grafana
- Добавил источник данных
- Скачал и импортировал дашборд Docker_and_system_monitoring
- Создал дашборды UI_Service_Monitoring и Business_Logic_Monitoring
- Собрал компонент Alertmanager
- Создал и настроил Incoming Webhook в персональном канале слака
- Создал файл alerts.yml с условиями срабатывания алерта
- Остановил сервис и убедился, что в слак приходит сообщение
- Запушил docker-образы в https://hub.docker.com/u/valmanmsk/

# ДЗ №20

## Что сделано:

- Обновил код микросервисов и собрал образы
- Создал отдельный композе-файл для логирования, в который входят fluentd, elasticsearch и kibana
- Собрал образ для fluentd
- Направил логи post в драйвер fluentd
- Поднял сервисы логирования
- Проверил интерфейс Kibana
- Добавил фильры для парсинга json логов в конфиг fluentd
- Направил логи ui в драйвер fluentd
- Добавил регулярное выражение для парсинга неструктуированных логов конфиг fluentd
- Использовал вместо регулярного выражения grok-шаблон
- Выполнил задания со *

# ДЗ №21

## Что сделано:

- Создал файлы с Deployment манифестами приложений
- Прошел туториал Kubernetes The Hard way
- Проверил что запускаются поды по ```kubectl apply -f <filename>``` для каждого yml-файла в папке reddit
- Автоматирзировал установку и запуск сервиса etcd с помощью Ansible. Подразумевается, что прошел все шесть предыдущих шагов из туториала.

