CREATE TABLE [dbo].[Customer_Item]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ItemId] INT NOT NULL, 
    [ItemCode] NVARCHAR(20) NOT NULL, 
    [ItemName] NVARCHAR(30) NOT NULL, 
    [ItemBrand] NVARCHAR(20) NOT NULL, 
    [UnitPrice] DECIMAL(18, 2) NOT NULL, 
    [ItemSize] NVARCHAR(15) NULL, 
    [ItemType] NVARCHAR(20) NULL, 
    [ItemVariant] NVARCHAR(20) NULL, 
    [ItemRemarks] NVARCHAR(50) NULL, 
    [CustomerId] INT NULL, 
    CONSTRAINT [FK_Customer_Item] FOREIGN KEY (ItemId) REFERENCES Customer_Preview(Id) 
)
