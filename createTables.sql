-- Table: Branch
CREATE TABLE Branch (
    Branch_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Manager VARCHAR(100)
);

-- Table: Car
CREATE TABLE Car (
    Car_ID SERIAL PRIMARY KEY,
    Branch_ID INT NOT NULL,
    Make VARCHAR(100) NOT NULL,
    Model VARCHAR(100) NOT NULL,
    Year INT NOT NULL,
    Price NUMERIC(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL CHECK (Status IN ('New', 'Used', 'Sold')),
    VIN VARCHAR(17) UNIQUE NOT NULL,
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

-- Table: Customer
CREATE TABLE Customer (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Table: Employee
CREATE TABLE Employee (
    Employee_ID SERIAL PRIMARY KEY,
    Branch_ID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    Salary NUMERIC(10, 2),
    FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

-- Table: Sales
CREATE TABLE Sales (
    Sale_ID SERIAL PRIMARY KEY,
    Car_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    Sale_Date TIMESTAMP NOT NULL,
    Sale_Amount NUMERIC(10, 2) NOT NULL,
    Financing_Option BOOLEAN NOT NULL,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Table: Service
CREATE TABLE Service (
    Service_ID SERIAL PRIMARY KEY,
    Car_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    Service_Date TIMESTAMP NOT NULL,
    Service_Type VARCHAR(100) NOT NULL,
    Service_Cost NUMERIC(10, 2),
    Service_Notes TEXT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Table: Finance
CREATE TABLE Finance (
    Finance_ID SERIAL PRIMARY KEY,
    Sale_ID INT NOT NULL,
    Loan_Amount NUMERIC(10, 2) NOT NULL,
    Interest_Rate NUMERIC(5, 2) NOT NULL,
    Loan_Term INT NOT NULL, -- in months
    Monthly_Payment NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (Sale_ID) REFERENCES Sales(Sale_ID)
);
