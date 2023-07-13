CREATE PROCEDURE [dbo].[spCustomer_Login]
	@username nvarchar(20),
	@password nvarchar(30)
AS
begin

	set nocount on;
	SELECT [Id], [UserName], [Password]
	FROM dbo.Customer_Preview
	WHERE UserName = @username
	AND Password = @password;

end
RETURN 0