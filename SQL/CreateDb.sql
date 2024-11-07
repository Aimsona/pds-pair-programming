CREATE TABLE Person (
    Id INTEGER PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(255) NOT NULL
);

CREATE TABLE [Order](
	Id INTEGER PRIMARY KEY NOT NULL,
	PersonId INT NOT NULL,
	[Date] DATETIME NOT NULL,	
	CONSTRAINT FK_Person FOREIGN KEY (PersonId) REFERENCES Person(Id)
);

CREATE TABLE Product(
	Id INTEGER PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(500) NOT NULL,
	Cost DECIMAL(19,2) NOT NULL
);

CREATE TABLE OrderItem(
	Id INTEGER PRIMARY KEY NOT NULL,
	OrderId INT NOT NULL,
	ProductId INT NOT NULL,
	CostAtTimeOfSale DECIMAL(19,2) NOT NULL,
	NumberOfItems INT NOT NULL,
	CONSTRAINT FK_Order FOREIGN KEY (OrderId) REFERENCES [Order](Id),
	CONSTRAINT FK_Product FOREIGN KEY (ProductId) REFERENCES Product(Id)
);

INSERT INTO Person (Id, Name) VALUES (1, 'Steve');
INSERT INTO Person (Id, Name) VALUES (2, 'Tom');
INSERT INTO Person (Id, Name) VALUES (3, 'Gary');

INSERT INTO Product (Id, Name, Cost) VALUES (1, 'Monitor', 200); 
INSERT INTO Product (Id, Name, Cost) VALUES (2, 'CPU', 150);
INSERT INTO Product (Id, Name, Cost) VALUES (3, 'RAM', 50);
INSERT INTO Product (Id, Name, Cost) VALUES (4, 'Motherboard', 100);

INSERT INTO [Order] (Id, PersonId, [Date]) VALUES (1, 2, '2019-12-05'); -- Tom Order 1
INSERT INTO [Order] (Id, PersonId, [Date]) VALUES (2, 2, '2019-12-20'); -- Tom Order 2
INSERT INTO [Order] (Id, PersonId, [Date]) VALUES (3, 1, '2019-12-06'); -- Steve Order
INSERT INTO [Order] (Id, PersonId, [Date]) VALUES (4, 3, '2019-12-07'); -- Gary Order

INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (1, 1, 2, 170.00, 2);  -- Tom Order 1
INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (2, 1, 4, 100.00, 2);  -- Tom Order 1

INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (3, 2, 3, 170.00, 2);  -- Tom Order 2

INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (4, 3, 2, 150.00, 1); -- Steve Order
INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (5, 3, 4, 100.00, 1); -- Steve Order 
INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (6, 3, 3, 50.00, 2);  -- Steve Order 
INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (7, 3, 1, 180.50, 2); -- Steve Order

INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (8, 4, 3, 50.00, 2);  -- Gary Order 
INSERT INTO OrderItem (Id, OrderId, ProductId, CostAtTimeOfSale, NumberOfItems)  VALUES (9, 4, 1, 180.50, 3); -- Gary Order 
