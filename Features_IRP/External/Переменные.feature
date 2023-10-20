#language: ru

@tree
//@ExportScenarios
@IgnoreOnCIMainBuild

Переменные:
	ЗаголовокФормыСпискаПоступления = '{!Metadata.Documents.PurchaseInvoice.ListPresentation}'
	ЗаголовокПодсистемыЗакупок = '{!Metadata.Subsystems.PurchaseAP.Synonym}'
	*ПроверяемыеЗначения
		| 'Имя'                       | 'Представление'               | 'Значение' |
		| 'СуммаДокументаПоступления' | 'Сумма документа поступления' | '900,00'   |
	ИтоговаяСуммаОтчета = 'R12C3';
	СообщениеШКНенайден = '{R().S_019}'
	
	//Сообщение = '{Nstr("en=""Barcode %1 not found.""; ru=""Штрихкод %1 не найден.""")}'

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
