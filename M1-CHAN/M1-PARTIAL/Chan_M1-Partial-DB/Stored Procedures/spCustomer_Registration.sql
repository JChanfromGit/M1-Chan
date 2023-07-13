CREATE PROCEDURE [dbo].[spCustomer_Registration]
	@userName nvarchar(20),
	@firstName nvarchar(30),
	@lastName nvarchar(25),
	@nickname nvarchar(15),
	@emailaddress nvarchar(25),
	@password nvarchar(30)
AS
begin
	set nocount on;
	INSERT INTO dbo.Customer_Preview
		(UserName, FirstName, LastName, Nickname, EmailAddress, Password)
		VALUES (@userName, @firstName, @lastName, @nickname, @emailaddress, @password)
end
RETURN 0