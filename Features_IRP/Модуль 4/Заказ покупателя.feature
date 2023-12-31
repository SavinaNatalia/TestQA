﻿#language: ru

@tree

Функционал: Проверка заполнения полей документа

Как Тестировщик я хочу
проверить заполнение полей заказа покупателя
чтобы убедиться в правильности работы программы   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0401 Подготовительный сценарий (Заказ покупателя)
	Когда экспорт основных данных

Сценарий: _0402 Проверка заполнения реквизитов документа
И я закрываю все окна клиентского приложения
* Создание документа
	И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
* Проверка реквизита партнер
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '1'   | 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я выбираю текущую строку
	* Проверка заполнения полей и их доступности после заполнения реквизита Партнер
		Тогда значение поля "Контрагент" содержит текст "Клиент 1"
		Тогда значение поля "Соглашение" содержит текст "Соглашение с клиентами (расчет по документам + кредитный лимит)"
		Тогда значение поля "Склад" содержит текст "Склад 1 (с контролем остатка)"
		И элемент формы "Контрагент" доступен
	* Проверка заполнения полей и их доступности после очистки реквизита Партнер
		И я нажимаю кнопку очистить у поля с именем "Partner"
		Тогда значение поля "Контрагент" содержит текст ""
		Тогда значение поля "Соглашение" содержит текст ""
		И элемент формы "Контрагент" не доступен
	* Проверка перезаполнения полей
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Вид взаиморасчетов'         | 'Код' | 'Наименование'                                         |
			| 'Обычное' | 'По стандартным соглашениям' | '5'   | 'Общее соглашение (расчет по стандартным соглашениям)' |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'		
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'         |
			| '10'  | 'Розничный покупатель' |
		И в таблице "List" я выбираю текущую строку
		Тогда значение поля "Соглашение" содержит текст "Розничное"	