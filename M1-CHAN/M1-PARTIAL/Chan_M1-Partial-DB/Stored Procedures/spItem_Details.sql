CREATE PROCEDURE [dbo].[spItem_Details]
	@itemId int
AS
begin

	set nocount on;
	SELECT [Id], [ItemCode], [ItemName], [ItemBrand], [UnitPrice], [CustomerId]
	FROM dbo.Customer_Item
	WHERE Id = @itemId

end
RETURN 0
