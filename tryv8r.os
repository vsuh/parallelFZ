﻿#use v8runner

	Конфигуратор = Новый УправлениеКонфигуратором();
	Конфигуратор.УстановитьКонтекст("/F C:\bases\uat.tst","admin", "kzueirf");
	ПараметрыЗапуска = Конфигуратор.ПолучитьПараметрыЗапуска();
	ПараметрыЗапуска.Добавить("/LoadCfg""C:\source.cf""");
СИ = Новый СистемнаяИнформация;
Сообщить(""+СИ.Версия);
Для Каждого аа Из ПараметрыЗапуска Цикл
    Сообщить(аа);
КонецЦикла;
h= Конфигуратор.

