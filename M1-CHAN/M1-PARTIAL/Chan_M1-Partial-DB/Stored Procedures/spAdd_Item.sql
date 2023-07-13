CREATE PROCEDURE [dbo].[spAdd_Item] 
    @itemId int,
    @itemCode NVARCHAR(20), 
    @itemName NVARCHAR(50), 
    @itemBrand NVARCHAR(30),  
    @unitPrice DECIMAL(18, 2),
    @itemSize NVARCHAR(15),
    @itemType NVARCHAR(20),
    @itemVariant NVARCHAR(20),
    @itemRemarks NVARCHAR(50),
    @customerId int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.Customer_Item (ItemId, ItemCode, ItemName, ItemBrand, UnitPrice, ItemSize, ItemType, ItemVariant, ItemRemarks, CustomerId)
	VALUES (@itemId, @itemCode, @itemName, @itemBrand, @unitPrice, @itemSize, @itemType, @itemVariant, @itemRemarks, @customerId);
END
