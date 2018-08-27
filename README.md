# Homeworks

## Homework №5
GitlabCI #1
Основная задача

Задание со звездочкой:
1.dadsadds1

2.Добавлена интеграция с личным каналом в группе DevOps Team
`https://devops-team-otus.slack.com/messages/CB569E79D`

## Homework №4

Основные задачи

* Сравнил работу драйвера none, host
* Изучил работу драйвероа bridge.
* Построил работу сервиса с одной общей сетью и разделенной без доступа для UI к БД.
* Создал образы docker-compose: с одной bridge-сетью и с двумя bridge-сетях.
* Выполнена параметризация в файл .env.
* Параметеризирован значение базового имени проекта.

(Задание со *)

* Создан файл docker-compose.override.yml, который позволяет:
* изменять код каждого из приложений, не выполняя сборку образа;
* запускать puma для ruby приложений в debug режиме с двумя воркерами (флаги --debug и -w 2).

## Homework №3

* Запускаем контейнеры с другими алиасами и переопределяем переменные окружения при запуске контейнера:
                docker run -d --network=reddit --network-alias=db -v reddit_db:/data/db mongo:latest
                docker run -d --network=reddit --network-alias=post1 -e "POST_DATABASE_HOST=db" sereganaci/post:1.0
                docker run -d --network=reddit --network-alias=comment1 -e "COMMENT_DATABASE_HOST=db" sereganaci/comment:1.0
                docker run -d --network=reddit -p 9292:9292   -e "POST_SERVICE_HOST=post1" -e "COMMENT_SERVICE_HOST=comment1" sereganaci/ui:1.0
* Образ на основании alpine (ui/Dockerfile.1)

## Homework №2

* Подняли хост на GCE под Docker-CE средствами docker-machine
* Поработали удаленно с хостом через docker-machine
* Изучили разницу вывода

        docker run --rm -ti tehbilly/htop
        Отражает процессы только внутри контейнера
        docker run --rm --pid host -ti tehbilly/htop
        Отражает процессы как в контейнере так и на хосте

* Собрали окружение приложения reddit в Dockerfile с 4 скриптами конфигурации
* Загрузили на Docker-Hub
* Выгрузили образ в Docker Hub на другое РМ и проверили запуск
* Выполнил задание со *

        Поднятие окружения через terraform
        из ./docker-monolith/infra/terraform/> terraform apply - создали bucket для backend
        из ./docker-monolith/infra/terraform/stage> terraform apply - подняли два хоста и правила firewall
        из ./docker-monolith/infra/ansible> ansible-playbook ./playbook/main - Настроили хосты с docker и поднятым контейнером нашего образа sereganaci/otus-reddit:1.0 на Docker Hub
        из ./docker-monolith/infra/packer> packer build -var-file variable.mjson docker.json - собрали образ в GCE с предустановленным Docker-CE

## Homework №1

* Вывод docker images list + разница между образом и контейнером
 ./dockermonolith/docker-1.log
