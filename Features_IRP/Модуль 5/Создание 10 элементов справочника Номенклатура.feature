#language: ru

@tree

Функционал: Создание 10 элементов справочника Номенклатура

Как Тестировщик я хочу
создать несколько элементов справочника Номенклатура
чтобы протестировать поведение системы  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание 10 элементов справочника Номенклатура
	И я запоминаю в переменную "Шаг" значение '1'
	И я делаю 10 раз
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture' | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en'        | 'Description_hash' | 'Description_ru'        | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' |                |          |          | ''            | 'Товар с номером $Шаг$' | ''                 | 'Товар с номером $Шаг$' | ''               | 90       | 100      | 0.6      | '2'      | '2'     |
	И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"