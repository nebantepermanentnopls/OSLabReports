# Отчет по лабораторной работе №5

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

