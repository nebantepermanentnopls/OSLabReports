# Отчет по лабораторной работе №2

Отчет предоставлен в виде синтетического выполнения задания, он никак не связан с лабораторными работами [1](https://github.com/nebantepermanentnopls/OSLabReports/tree/master/lab1) и [2](https://github.com/nebantepermanentnopls/OSLabReports/tree/master/lab2), так как они были выполнены задолго до написания данного отчета.

## Выполнение задания

1) После создания аккаунта создадим пустой репозиторий:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image1.png)

2) Генерируем ssh-ключ, который будет использоваться для подключения к github, с помощью программы ssh-keygen:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image2.png)

Ключ хранится в каталоге пользователя, в папке ```.ssh```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image3.png)

Прикрепим его в настройках github:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image10.png)

3) Инициализируем репозиторий в корневой папке проекта командой git init, которая создает каталог ```.git```, содержащий все необходимые файлы репозитория - основу git репозитория.

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image4.png)

4) Создаем файл README.md, который должен содержать основную информацию о проекте:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image5.png)

5) Индексируем и добавляем файлы под версионный контроль:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image6.png)

git add - команда для добавления содержимого рабочей директории в индекс (staging area) для последующего коммита.

git commit - это команда для записи индексированных изменений в репозиторий git. Ключ ```-m``` нужен для написания сообщения фиксации 'Initial commit', без данного флага нам нужно будет предложено писать сообщение в редакторе(это дольше):

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image6.1.png)

6) Для просмотра состояния файлов используется команда ```git status```. Например, после каких-либо действий проделанных над проектом(добавление индексо, коммитов), может сложиться следующуя картина:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image7.png)

* надпись "Changes to be committed" показывает нам проиндексированные файлы, которые готовы к коммиту;

* "Changes not staged for commit, modified" гоприт об измененных файлах:

* "Untracked files" показывает новые файлы, о которых git еще не известно.

Для просмотра истории комитов используется ```git log```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image8.png)

7) Для настройки подключения к удаленному серверу используется команда ```git remote add```, чтобы выгрузить свои наработки в главный репозиторий используется команда ```git push```:

![](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab3/images/image11.png)

Если у вас на компьютере не лежит последняя версия проекта(кто-то выполнил ```git push``` раньше вас или вы что-то изменили в проекте через сайт и т.д.), то вам для успешной выгрузки данных на удаленный сервер нужно будет выполнить git pull, чтобы загрузить последнюю версию проекта.

**Вывод**: в ходе выполнения данной работы былиполучены базовые навыки работы с git, которые использовались при оформлении остальных лабораторных работ из [курса ОС](https://github.com/bykvaadm/OS/tree/master/admin).





