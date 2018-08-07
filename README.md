# Homeworks

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
