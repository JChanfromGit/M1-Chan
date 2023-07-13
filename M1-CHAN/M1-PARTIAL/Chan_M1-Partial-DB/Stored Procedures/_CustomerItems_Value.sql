﻿CREATE PROCEDURE [dbo].[_CustomerItems_Value]
AS
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (1, '04011-6789', 'Cookies and Cream', 'Selecta', 289.99, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (2, '03138-0689', 'Coffee Crumble', 'Selecta', 299.99, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (3, '54868-0106', 'Double Dutch', 'Selecta', 310.99, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (4, '20282-5433', 'Magnum Ice Cream Bar', 'Selecta', 80.00, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (5, '95292-7211', 'Macapuno Caramel', 'Magnolia', 295.00, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (6, '19723-0994', 'Tablea Yema', 'Magnolia', 300.00, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (7, '54200-1678', 'Orea Ice Cream', 'Nestle', 265.99, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (8, '06503-1532', 'Almond Brownie Fudge', 'Nestle', 285.99, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (9, '15043-3022', 'Mint Chocolate Chip', 'Big Scoop', 150.00, null, null, null, null, null);
	insert into dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId) values (10, '14901-0961', '2 in 1 Avocado Strawberry', 'Aice', 120.00, null, null, null, null, null);
RETURN 0