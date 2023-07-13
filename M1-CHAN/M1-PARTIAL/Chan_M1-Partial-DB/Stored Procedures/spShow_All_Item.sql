CREATE PROCEDURE [dbo].[spShow_All_Item]
AS
begin
	SELECT [Id], [ItemCode], [ItemName], [ItemBrand], [UnitPrice], [CustomerId]
	FROM dbo.Customer_Item
end
RETURN 0
