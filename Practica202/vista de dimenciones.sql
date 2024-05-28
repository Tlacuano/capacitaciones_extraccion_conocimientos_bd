select 
	ProductID,
	Name,
	ISNULL(Color, 'No especificado') AS Color,
	ISNULL(Size, 'No especificado') AS Size,
	ISNULL(SizeUnitMeasureCode, 'N/A') AS UnitMeasure
from Production.Product;


select 
	PurchaseOrderID,
	YEAR(OrderDate) as OrderAnio,
	MONTH(OrderDate) as OrderMonth,
	YEAR(ShipDate) as ShipAnio,
	MONTH(ShipDate) as ShipMonth,
	SubTotal,
	TaxAmt,
	Freight,
	TotalDue
from Purchasing.PurchaseOrderHeader;

select 
	BusinessEntityID,
	Name
from Purchasing.Vendor;

select
	P.ProductID,
	POH.PurchaseOrderID,
	V.BusinessEntityID
from
	Production.Product P
JOIN Purchasing.PurchaseOrderDetail POD on P.ProductID = POD.ProductID
JOIN Purchasing.PurchaseOrderHeader POH on POD.PurchaseOrderID = POH.PurchaseOrderID
JOIN Purchasing.Vendor V on POH.VendorID = V.BusinessEntityID;
