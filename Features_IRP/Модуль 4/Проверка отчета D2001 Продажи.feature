﻿#language: ru

@tree

Функционал: Проверка отчета D2001 Продажи

Как Тестировщик я хочу
сформировать отчет D2001 Продажи
чтобы убедиться в корректном отображении документов возвратов в нем  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0601 Подготовительный сценарий (Реализации и возвраты товаров)
	Когда экспорт основных данных
	Когда экспорт документов продажи

Сценарий: _0602 Проверка отчета D2001 Продажи
И я закрываю все окна клиентского приложения
* Настройка варианта и формирование отчета
	И Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	Когда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	И я жду открытия окна 'Вариант "Default" отчета "D2001 Продажи"' в течение 20 секунд	
	Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
	И в таблице "SettingsComposerSettings" я перехожу к строке:
		| 'Использование' | 'Структура отчета'   |
		| 'Нет'           | '<Детальные записи>' |
	И в таблице "SettingsComposerSettings" я изменяю флаг с именем 'SettingsComposerSettingsUse'
	И в таблице "SettingsComposerSettings" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
	Тогда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R12C7' в течение 20 секунд
	И Табличный документ "Result" равен макету "Отчет D2001 Продажи" по шаблону