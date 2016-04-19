Перем _ Экспорт;
Перем флСкрипт Экспорт;
Перем Версия Экспорт;
Перем ж;
Перем dbg;

Procedure init()
	флСкрипт = Новый Файл(ТекущийСценарий().Источник);
	КаталогСкрипта = флСкрипт.Путь;
  УстановитьТекущийКаталог(КаталогСкрипта);
	Отказ = Ложь;
	СИ = Новый СистемнаяИнформация;
	//Сообщить("Версия 1Scr: "+СИ.Версия+"   -----[ "+флСкрипт.ИмяБезРасширения+" ]------    "+Версия);
	lg("Версия 1Scr: "+СИ.Версия+"   -----[ "+флСкрипт.ИмяБезРасширения+" ]------    "+Версия);
	ПодключитьСценарий(КаталогСкрипта+флСкрипт.ИмяБезРасширения+".lib", "lib");
	ж = Новый lib();
  lg("Инициализация");
	ж.Инициализировать(ЭтотОбъект, Отказ);
	Если Отказ Тогда
		exit(3);
	КонецЕсли;



EndProcedure // init()

Procedure lg(text, lvl = 0) Export
	Space = Лев("          ", lvl*2+2);
	Если lvl <= dbg Тогда
		Message(""+CurrentDate()+"["+lvl+"]"+Space+text);
	КонецЕсли;

EndProcedure

Procedure main()
	Контекст = Новый Структура(
		"tsk_dir, tsk_lst, log_file, obj"
		, _["tsk_dir"], _["tsk_lst"], _["log_file"], ЭтотОбъект);
	Для каждого задача Из _["tasks"] Цикл
		ИмяФайлаЗадачи = "" + _["tsk_dir"] + "/" + задача.Значение["name"];
		ФайлЗадачи = Новый Файл(ИмяФайлаЗадачи);
		Если ФайлЗадачи.Существует() Тогда
			ИмяКласса = "_"+задача.Ключ+"_"+ФайлЗадачи.ИмяБезРасширения;
			здч = ЗагрузитьСценарий(ФайлЗадачи.ПолноеИмя, Контекст);
			 здч.run();
		КонецЕсли;
	КонецЦикла;
EndProcedure // main()

//[ ****************************************************** ]//
Версия = "6.4.19 VSCraft@2016";
dbg = 5;
init();
main();