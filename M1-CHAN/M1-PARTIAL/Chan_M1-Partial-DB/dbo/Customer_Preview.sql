CREATE TABLE [dbo].[Customer_Preview]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserName] NVARCHAR(20) NOT NULL, 
    [FirstName] NVARCHAR(30) NOT NULL, 
    [LastName] NVARCHAR(25) NOT NULL, 
    [Nickname] NVARCHAR(15) NOT NULL, 
    [EmailAddress] NVARCHAR(25) NOT NULL, 
    [Password] NVARCHAR(30) NOT NULL
)
