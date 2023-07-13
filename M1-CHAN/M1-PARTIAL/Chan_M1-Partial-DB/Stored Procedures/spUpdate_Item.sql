CREATE PROCEDURE [dbo].[spUpdate_Item]
	@itemId int,
	@itemCode nvarchar(20),
	@itemName nvarchar(30),
	@itemBrand nvarchar(20),
	@unitPrice decimal(18, 2),
	@itemSize NVARCHAR(15),
    @itemType NVARCHAR(20),
    @itemVariant NVARCHAR(20),
    @itemRemarks NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Customer_Item
	SET 
		ItemCode = @itemCode,
		ItemName = @itemName,
		ItemBrand = @itemBrand,
		UnitPrice = @unitPrice,
		ItemSize = @itemSize,
		ItemType = @itemType,
		ItemVariant = @itemVariant,
		ItemRemarks = @itemRemarks
	WHERE Id = @itemId;
END