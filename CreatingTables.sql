
CREATE TABLE Stores (
    StoreID INT IDENTITY(1,1) PRIMARY KEY,
    Street1 VARCHAR(100) NOT NULL,
    Street2 VARCHAR(100),
    City VARCHAR(50) NOT NULL,
    Zip VARCHAR(10) NOT NULL,
    OpenDate DATE NOT NULL,
    StoreName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    StartDate DATE NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Title VARCHAR(20) NOT NULL CHECK (Title IN ('Manager','Sales Associate','Cashier', 'Inventory Specialist')),
    Active BIT NOT NUll, --1 for active and 0 for inactive
    Street1 VARCHAR(100) NOT NULL,
    Street2 VARCHAR(100),
    Zip VARCHAR(10) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100) NOT NULL,
    Rate DECIMAL(10,2) NOT NULL,
    StoreID INT NOT Null,
    EndDate DATE,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    SalesDate DATE NOT NULL,
    SalesTime TIME  NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL CHECK (PaymentMethod IN ('Cash','Card')),
    EmployeeID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    StoreID INT NOT NULL,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT NOT NULL,
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID),
    ProductID INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    Quantity INT NOT NULL
);

CREATE TABLE TimeTracking (
    TimeID INT IDENTITY(1,1) PRIMARY KEY,
    TTDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    EmployeeID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductDescription VARCHAR(200),
    Category VARCHAR(20) NOT NULL CHECK (Category IN ('Food & Treats','Health & Wellness','Toys & Entertainment','Beds & Housing','Training & Behavior','Accessories','Litter & Waste Management', 'Habitat Supplies')),
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100) NOT NULL
);

