﻿#language: ru

@tree

Функционал: Проверка заполнения поля Организация в Заказе покупателя

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Переменные:
	*ОрганизацияСоглашения
		| 'Имя'          | 'Значение'               |
		| 'Код'          | '1'                      |
		| 'Наименование' | 'Собственная компания 1' |

Сценарий: Проверка заполнения поля Организация в Заказе покупателя
	И я закрываю все окна клиентского приложения
	* Создание нового документа	
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder" 
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
	* Заполнение партнера
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
	* Заполнение соглашения
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		Тогда открылось окно 'Соглашения'
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
			| 'Обычное' | 'По соглашениям'     | '3'   | 'Индивидуальное соглашение 2 (расчет по соглашениям)' |
		И в таблице "List" я выбираю текущую строку
	* Проверка заполненности поля Организация из соглашения
		Если элемент формы с именем "Company" стал равен 'ОрганизацияСоглашения.Наименование.Значение' Тогда
		Иначе
			* Самостоятельное заполнение реквизита Организация	
				И я нажимаю кнопку выбора у поля с именем "Company"
				Тогда открылось окно 'Организации'
				И в таблице "List" я перехожу к строке:
					| 'Код'                                | 'Наименование'                                |
					| 'ОрганизацияСоглашения.Код.Значение' | 'ОрганизацияСоглашения.Наименование.Значение' |
				И в таблице "List" я выбираю текущую строку