﻿#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Изменение количества во всех строках таблицы
	Дано Я открываю навигационную ссылку "e1cib/data/Document.PurchaseInvoice?ref=b76cbacb2511e57d11ebeab0dfce221b"
	И для каждой строки таблицы "ItemList" я выполняю используя колонку "N"
		И в таблице "ItemList" в поле "Количество" я ввожу текст "10"
	
Сценарий: Удаление строк таблицы
	И пока в таблице "ItemList" количество строк ">" 0 Тогда
		И в таблице "ItemList" я удаляю строку

Сценарий: Изменение вида цен по условию
	Дано Я открываю навигационную ссылку "e1cib/data/Document.PurchaseInvoice?ref=b76cbacb2511e57d11ebeab0dfce221b"
	И для каждой строки таблицы "ItemList" я выполняю
		Если таблица "ItemList" содержит строки Тогда
			| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
			| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
			И в таблице "ItemList" я перехожу к строке:
				| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
				| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
			И в таблице "ItemList" я выбираю текущую строку
			И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPriceType"
			Тогда открылось окно 'Виды цен'
			И в таблице "List" я перехожу к строке:
				| 'Валюта' | 'Код' | 'Наименование'      | 'Ссылка'            |
				| 'USD'    | '4'   | 'Цена поставщика 2' | 'Цена поставщика 2' |
			И в таблице "List" я выбираю текущую строку
			*Для выхода из рекурсии
			Если в таблице "ItemList" я перехожу к следующей строке Тогда
			Иначе я прерываю цикл
	И таблица  "ItemList" не содержит строки:
		| 'Номенклатура'             | 'Характеристика' | 'Вид цены'          |
		| 'Товар с характеристиками' | 'S/Красный'      | 'Цена поставщика 1' |
							
Сценарий: Перебор элементов справочника Номенклатура
	И в таблице "List" я перехожу к первой строке
	И для каждой строки таблицы "List" я выполняю
		И в таблице "List" я выбираю текущую строку
		Тогда не появилось окно предупреждения системы
		И я закрываю текущее окно

Сценарий: Создание большого объема данных (справочник Ед. измерения)
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"ед. изм " + $Шаг$' в переменную "ЕдиницаИзмерения"
		И я проверяю или создаю для справочника "Units" объекты:
			| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en'     | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Units?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | ''     | 1          | ''          | ''    | '$ЕдиницаИзмерения$' | ''                 | ''               | ''               |          |          |          |          |         |

		
		
	