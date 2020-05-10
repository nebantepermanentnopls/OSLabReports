# Отчет по лабораторной работе №5

[Репозиторий с образом, который получился в ходе выполнения лабораторной работы](https://hub.docker.com/r/nebantepermanentnopls/lab5docker)

## Часть 1(проверка работоспособности установленного docker daemon и изучение этого контейнера)

* После установки и проверки работоспособности docker`a изучаем образ:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image1.png)

Видим информацию о образе(на скрине не весь вывод): версию, что должен выполнять CMD и т.д.

#### Изучим содержимое контейнера:

```
mkdir /tmp/hello && cd /tmp/hello && docker save hello-world -o hello.tar && \
tar xvf hello.tar 1>/dev/null && rm hello.tar && echo -e "\ncontents of container:\n" && ls
```

Команда создает каталог, сохраняет в нем архив контейнера, распаковывает архив, оставляя в каталоге только содержимое контейнера.

Вот, что "приезжает" вместе с контейнером:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image2.png)


#### Посмотрим содержимое файлов и каталога

* Содержимое manifest.json:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image3.png)

Указан конфиг, версия и место, где хранятся слои. Слои хранятся в каталоге ***, в архиве layer.tar.

* Содержание файла ***.json:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image4.png)

В файле находится конфигурационная информация контейнера.

* Единственный подкаталог в каталоге имеет следующее содержимое:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image6.png)

* Файл json содержит информацию, которая фигурирует в выводе команды ```docker inspect hello-world```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image7.png)

* Смотрим, что в архиве:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image8.png)

Архив содержит один файл - это ```hello```.

## Часть 2(основные команды для работы с docker)

#### Запускаем контейнер разными способами

* Команда ```docker run nginx```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image9.png)

При запуске командой ```docker run``` без флага, контейнер отрабатывает процесс который указан в ```CMD```
и отключается, так как nginx работает постоянно, этого не происходит.

* Команда ```docker run -ti nginx```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image10.png)

При запуске контейнера с флагом ```-ti```, который предусматривает взаимодействие из текущей консоли, взаимодействовать мы не можем, так как в nginx не предусмотрено взаимодействие.

* Команда ```docker run -d nginx```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image11.png)

Флагом ```-d``` пускаем контейнер в фоновом режиме.

* Смотрим информацию командой ```docker ps```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image12.png)

Все 3 процесса работают, значит при запуске контейнера с флагом ```-d``` его работа происходит в фоновом режиме.

#### Переопределение CMD

Пробуем переопределить CMD, указав в конце строки свою команду:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image13.png)

Запустился bash, как и задумано.

#### Подключаемся к запущенному контейнеру

Для того, чтобы подключился к запущенному контейнеру используют ```exec``` или ```attach```. Воспользуемся ```exec```, так как он более часто используется:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image14.png)

Подключение прошло успешно, bash работает новым процессом в контейнере.

#### Остановка процесса

Используем ```kill``` для остановки контейнера:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image15.png)

## Часть 3(сборка собственного образа)

* Находим директорию sources.list.d в контейнере с основой в виде debian:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image16.png)

* Создаем файл debian.list с deb репозиторием, который будет использоваться в нашем контейнере:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image17.png)

* Помещаем debian.list в контейнер командой COPY, получаем слудуюющее содержимое Dockerfile:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image18.png)

CMD ["bash"] нужен для работы с контейнером во время выполнения лабораторной работы, позже CMD будет переопределен.

Собираем контейнер и смотрим, что получилось:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image19.png)

#### Добавляем в Dockerfile строки, которые соответствуют следующим операциям:

* Выполнить обновление apt-кеша -> ```RUN apt-get update```.

* Обновить все пакеты в контейнере -> ```RUN apt-get -y upgrade```.

* Установить веб сервер nginx -> ```RUN apt-get -y install nginx```(флаг ```-y``` нужен для автоматического ответа на вопрос при установке).

* Очистить скачанный apt-cache -> ```RUN apt-get clean```.

* Удалить содержимое директории /var/www/ -> ```RUN rm -rf /var/www/*```(```-r```- рекурсивное удаление подкаталогов и файлов в них, ```-f``` запрет на вывод ошибок).

* Создать в директории /var/www/ директорию с именем вашего сайта и папку с картинками (company.com/img) -> ```RUN mkdir -p var/www/nebante.com/img```(```-p``` создает каталоги, которые отсутствуют на пути).

* Поместить из папки с докер файлом в директорию /var/www/company.com файл index.html -> ```COPY index.html /var/www/nebante.com```.

Команда COPY нужна для перемещения файлов с хостовой ОС в контейнер. Существует команда ADD, которая может не только переносить файлы, но и разархивировать их и загружать с интернета).

* Поместить из папки с докер файлом в директорию /var/www/company.com/img файл img.jpg -> ```COPY img.html /var/www/nebante.com/img```.

* Задать рекурсивно на папку /var/www/company.com права "владельцу - читать, писать, исполнять; группе - читать, исполнять, остальным - только читать" -> ```RUN chmod -R 754 var/www/nebante.com```.

* С помощью команды useradd создать пользователя <ваше имя> -> ```RUN useradd Alexey```.

* С помощью команды groupadd создать группу <ваша фамилия> -> ```RUN groupadd Chistyakov```.

* С помощью команды usermod поместить пользователя <ваше имя> в группу <ваша фамилия> -> ```RUN usermod -aG Chistyakov Alexey```.

* Рекурсивно присвоить созданных пользователя и группу на папку /var/www/company.com -> ```RUN chown -R Alexey:Chistyakov var/www/nebante.com```.

* Воспользоваться конструкцией (sed -i 's/ЧТО ЗАМЕНИТЬ/НА ЧТО ЗАМЕНИТЬ/g' имя_файла) и заменить в файле /etc/nginx/sites-enabled/default следующую подстроку (/var/www/html) так, чтобы она соответствовала (/var/www/company.com) -> ```RUN sed -i 's/\/var\/www\/html/\/var\/www\/nebante.com/g' /etc/nginx/sites-enabled/default```.

* С помощью команды sed проделать операцию замены пользователя, от имени которого запускается nginx -> RUN sed -i 's/user www-data/user Alexey/g' /etc/nginx/nginx.conf

* После добавления вышеперечисленных команд мы получили Dockerfile: 

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image21.png)

#### Проверка работоспособности контейнера

* Запускаем контейнер и подключаемся к нему через ```docker exec``` и проверяем, какой пользователь запустил наш nginx:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image22.png)

Запуск nginx прошел не от пользователя www-data, а от пользователя Alexey, как мы и хотели.

* Запускаем контейнер с портами в аргументах: ```docker run -ti -p 80:80 test``` и подключаемся к 127.0.0.1:80 в браузере, получаем:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image23.png)

* Загружаем образ на docker hub:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab5/images/image24.png)

[Репозиторий](https://hub.docker.com/r/nebantepermanentnopls/lab5docker)










































