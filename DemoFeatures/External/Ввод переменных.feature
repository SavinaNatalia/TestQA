﻿#language: ru

@tree
@IgnoreOnCIMainBuild

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Переменные:
	НачалоПериода = '{Строка(НачалоМесяца(НачалоДня(ТекущаяДата())) + 43200)}';
	СерединаПериода = '{Строка(НачалоМесяца(НачалоДня(ТекущаяДата())) + День(КонецМесяца(ТекущаяДата()))/2 * 86400 + 43200)}';
	КонецПериода = '{Строка(КонецМесяца(КонецДня(ТекущаяДата())))}';