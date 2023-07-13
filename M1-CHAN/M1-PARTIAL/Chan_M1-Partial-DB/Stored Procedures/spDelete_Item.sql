CREATE PROCEDURE [dbo].[spDelete_Item]
	@itemId int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM dbo.Customer_Item
	WHERE Id = @itemId;
END