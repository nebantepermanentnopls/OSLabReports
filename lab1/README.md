# Отчет по лабораторной работе №1

В отчете предоставлены решения заданий из [SuzenEscape](https://github.com/bykvaadm/SuzenEscape).

В папке [screepts](https://github.com/nebantepermanentnopls/OSLabReports/tree/master/lab1/scripts) содержатся скрипты для решения заданий.

## Suzen1

![suzen1](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen1.jpg)
 
Использовали команду ls для просмотра содержимого каталога, увидели txt файл, открыли с помощью cat.
 
## Suzen2
 
![suzen2.1](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen2.1.jpg)
 
С помощью cat склеиваем все файлы начинающиеся с одного символа, например: cat =*, cat '('*, cat :*. 

![suzen2.2](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen2.2.jpg)

Пароль был в одном из файлов, которые начинаются с двоеточия (“ : ”).

## Suzen3

![suzen3](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen3.jpg)

Мы не имеем утилит cat, less и тд, поэтому читаем файл используя bash:
 *С помощью конструкции “while read line” мы читаем и сохраняем в line строки файла пока они не закончатся;
 *Конструкция do echo $line выводит строку, которая храниться в line($ нужен для указания на переменную line);
 *Done показывает конец цикла;
 *С помощью “< ‘-diary.txt-‘ ” мы направляем данные из дневника на ввод скрипту.

## Suzen14

![suzen14](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen14.jpg)

С помощью утилиты ls смотрим названия каталогов, которые являются частями ключа.

## Suzen15

![suzen15](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen15.jpg)

С помощью “cd ..” вышли из начальной директории, далее посмотрели ее название черед ls.

## Suzen16

![suzen16](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen16.jpg)

Для просмотра информации о пользователях можно двумя способами:
 *Команда id. Команда предназначена для вывода информации о пользователях. Если не указывать параметр, то выведется информация о текущем пользователе и его группах;
 *Команда groups показывает группы, в которых состоит пользователь.

## Suzen17

![suzen17](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen17.jpg)

С помощью флага –a утилиты ls просматриваем скрытые файлы.

## Suzen18

![suzen18](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen18.jpg)

Пользуемся утилитой man для прочтения мануала  diary.

## Suzen19

![suzen19](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen19.jpg)

Создаем директории через mkdir, ключ -p создает каталоги, которые отсутсвуют. Sleep и && используются для имитации скрипта, чтобы все выполнилось по порядку(как в скрипте) и ключ вывелся(может не вывестись, так как внешняя проверка)

## Suzen20

![suzen20](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen20.jpg)

Переходи в john  и удаляем все файлы с помощью rm. Флаг –r требуется для удаления каталогов, при удалении обычных файлов он не на что не влияет.

## Suzen21

![suzen21](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen21.jpg)

Используя утилиту rm с выражениями для удаления файлов. Утилита grep с ключом -o  используется для поиска подстроки в выводe ls(там много файлов, сложо искать), которая удовлетворяет регулярному выражению '[0-9a-zA-Z]\{28\}':
 *[0-9a-zA-Z]- подстрока состоит из только из букв и цифпр;
 *\{28\}- длинна подстроки равна 28(бекслэши используются для экранировки).

## Suzen22

![suzen22](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen22.jpg)

Пишем скрип для создания файлов,
“for i in `seq 1 999`” - конструкция, которая нужна для построения цикла от 1 до 999.
Файлы создаются с помощью утилиты touch. Комбинация ls и grep используется для быстрого, не ручного поиска.

## Suzen23

![suzen23](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen23.jpg)

Сначала заходим в каталог destination и с помощью bash и утилиты mv переименовываем все файлы, которые находятся в данной директории.
Потом заходим в source и перемещаем из данной директории в директорию destination, используя mv.

## Suzen24

![suzen24](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen24.jpg)

Создаем директорию Music в suzen.
Переходим в Desktop/music и копируем все содержимое утилитой cp.
Флаг –r нужен для копирования подкаталогов и файлов внутри данного каталога.

## Suzen25

![suzen25](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen25.jpg)

Через ls смотрим содержимое, через cat открываем.

## Suzen26

![suzen26.1](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen26.1.jpg)

![suzen26.2](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen26.2.jpg)

![suzen26.3](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen26.3.jpg)

Открываем файл через less, видим FIRST_FLAG_PART и пользуемся поиском(/…).

## Suzen27

![suzen27](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen27.jpg)

Запускаем утилиту tail с флагом -f для построчного чтения файла. Направляем вывод в grep для вывода ТОЛЬКО ключа.

## Suzen28

![suzen28.1](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen28.1.jpg)

Ищем что-то похожее на название начального файла через утилиту find, далее открываем и копируем все, кроме последней строчки, так как ее мы вставим другим способом из-за отсутствия символа переноса строки в копируемом файле.

![suzen28.2](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen28.2.jpg)

С помощью cat мы создаём файл, перенаправляя вывод в diary, пока не введем EOF.

![suzen28.3](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen28.3.jpg)

Последние 2 строчки вставляем через echo с флагом –e(позволяет использовать спец символы), чтобы исключить добавление “\n”.

![suzen28.4](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen28.4.jpg)

## Suzen29

![suzen29](https://github.com/nebantepermanentnopls/OSLabReports/blob/master/lab1/screenshots/suzen29.jpg)

Пользуемся командой echo для просмотра файлов в каталоге.
Находим скрытый файл и открываем его через echo, видим какой-то кривой вывод, среди которого можно увидеть флаг.











