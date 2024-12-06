-- Procedure: AddBranch
CREATE OR REPLACE FUNCTION AddBranch(
    branchName VARCHAR,
    branchAddress VARCHAR,
    branchPhone VARCHAR,
    branchManager VARCHAR
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Branch (Name, Address, Phone, Manager)
    VALUES (branchName, branchAddress, branchPhone, branchManager);
END;
$$ LANGUAGE plpgsql;

-- Procedure: UpdateBranch
CREATE OR REPLACE FUNCTION UpdateBranch(
    branchID INT,
    branchName VARCHAR,
    branchAddress VARCHAR,
    branchPhone VARCHAR,
    branchManager VARCHAR
) RETURNS VOID AS $$
BEGIN
    UPDATE Branch
    SET Name = branchName, Address = branchAddress, Phone = branchPhone, Manager = branchManager
    WHERE Branch_ID = branchID;
END;
$$ LANGUAGE plpgsql;

-- Procedure: AddCar
CREATE OR REPLACE FUNCTION AddCar(
    branchID INT,
    make VARCHAR,
    model VARCHAR,
    year INT,
    price DECIMAL,
    status VARCHAR,
    vin VARCHAR
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Car (Branch_ID, Make, Model, Year, Price, Status, VIN)
    VALUES (branchID, make, model, year, price, status, vin);
END;
$$ LANGUAGE plpgsql;

-- Procedure: UpdateCarStatus
CREATE OR REPLACE FUNCTION UpdateCarStatus(
    carID INT,
    newStatus VARCHAR
) RETURNS VOID AS $$
BEGIN
    UPDATE Car
    SET Status = newStatus
    WHERE Car_ID = carID;
END;
$$ LANGUAGE plpgsql;

-- Procedure: RecordSale
CREATE OR REPLACE FUNCTION RecordSale(
    carID INT,
    customerID INT,
    employeeID INT,
    saleDate TIMESTAMP,
    saleAmount DECIMAL,
    financingOption BOOLEAN
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Sales (Car_ID, Customer_ID, Employee_ID, Sale_Date, Sale_Amount, Financing_Option)
    VALUES (carID, customerID, employeeID, saleDate, saleAmount, financingOption);
    
    UPDATE Car
    SET Status = 'Sold'
    WHERE Car_ID = carID;
END;
$$ LANGUAGE plpgsql;

-- Procedure: AddCustomer
CREATE OR REPLACE FUNCTION AddCustomer(
    customerName VARCHAR,
    customerEmail VARCHAR,
    customerPhone VARCHAR,
    customerAddress VARCHAR
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Customer (Name, Email, Phone, Address)
    VALUES (customerName, customerEmail, customerPhone, customerAddress);
END;
$$ LANGUAGE plpgsql;

-- Procedure: UpdateCustomer
CREATE OR REPLACE FUNCTION UpdateCustomer(
    customerID INT,
    customerName VARCHAR,
    customerEmail VARCHAR,
    customerPhone VARCHAR,
    customerAddress VARCHAR
) RETURNS VOID AS $$
BEGIN
    UPDATE Customer
    SET Name = customerName, Email = customerEmail, Phone = customerPhone, Address = customerAddress
    WHERE Customer_ID = customerID;
END;
$$ LANGUAGE plpgsql;

-- Procedure: ScheduleService
CREATE OR REPLACE FUNCTION ScheduleService(
    carID INT,
    customerID INT,
    employeeID INT,
    serviceDate TIMESTAMP,
    serviceType VARCHAR,
    serviceCost DECIMAL,
    serviceNotes TEXT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Service (Car_ID, Customer_ID, Employee_ID, Service_Date, Service_Type, Service_Cost, Service_Notes)
    VALUES (carID, customerID, employeeID, serviceDate, serviceType, serviceCost, serviceNotes);
END;
$$ LANGUAGE plpgsql;

-- Procedure: AddEmployee
CREATE OR REPLACE FUNCTION AddEmployee(
    branchID INT,
    employeeName VARCHAR,
    role VARCHAR,
    phone VARCHAR,
    salary DECIMAL
) RETURNS VOID AS $$
BEGIN
    INSERT INTO Employee (Branch_ID, Name, Role, Phone, Salary)
    VALUES (branchID, employeeName, role, phone, salary);
END;
$$ LANGUAGE plpgsql;

-- Procedure: UpdateEmployee
CREATE OR REPLACE FUNCTION UpdateEmployee(
    employeeID INT,
    branchID INT,
    employeeName VARCHAR,
    role VARCHAR,
    phone VARCHAR,
    salary DECIMAL
) RETURNS VOID AS $$
BEGIN
    UPDATE Employee
    SET Branch_ID = branchID, Name = employeeName, Role = role, Phone = phone, Salary = salary
    WHERE Employee_ID = employeeID;
END;
$$ LANGUAGE plpgsql;

-- Procedure: GetBranches
CREATE OR REPLACE FUNCTION GetBranches()
RETURNS TABLE(Branch_ID INT, Name VARCHAR, Address VARCHAR, Phone VARCHAR, Manager VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT Branch.Branch_ID, Branch.Name, Branch.Address, Branch.Phone, Branch.Manager
    FROM Branch;
END;
$$ LANGUAGE plpgsql;


-- Procedure: GetSales
CREATE OR REPLACE FUNCTION GetSales()
RETURNS TABLE(Sale_ID INT, Car_ID INT, Customer_ID INT, Employee_ID INT, Sale_Date TIMESTAMP, Sale_Amount DECIMAL, Financing_Option BOOLEAN) AS $$
BEGIN
    RETURN QUERY
    SELECT Sales.Sale_ID, Sales.Car_ID, Sales.Customer_ID, Sales.Employee_ID, Sales.Sale_Date, Sales.Sale_Amount, Sales.Financing_Option
    FROM Sales;
END;
$$ LANGUAGE plpgsql;


-- Procedure: GetCars
CREATE OR REPLACE FUNCTION GetCars()
RETURNS TABLE(Car_ID INT, Branch_ID INT, Make VARCHAR, Model VARCHAR, Year INT, Price DECIMAL, Status VARCHAR, VIN VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT Car.Car_ID, Car.Branch_ID, Car.Make, Car.Model, Car.Year, Car.Price, Car.Status, Car.VIN
    FROM Car;
END;
$$ LANGUAGE plpgsql;


-- Procedure: GetCustomers
CREATE OR REPLACE FUNCTION GetCustomers()
RETURNS TABLE(Customer_ID INT, Name VARCHAR, Email VARCHAR, Phone VARCHAR, Address VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT Customer.Customer_ID, Customer.Name, Customer.Email, Customer.Phone, Customer.Address
    FROM Customer;
END;
$$ LANGUAGE plpgsql;


-- Procedure: GetServiceSchedules
CREATE OR REPLACE FUNCTION GetServiceSchedules()
RETURNS TABLE(Service_ID INT, Car_ID INT, Customer_ID INT, Employee_ID INT, Service_Date TIMESTAMP, Service_Type VARCHAR, Service_Cost DECIMAL, Service_Notes TEXT) AS $$
BEGIN
    RETURN QUERY
    SELECT Service.Service_ID, Service.Car_ID, Service.Customer_ID, Service.Employee_ID, Service.Service_Date, Service.Service_Type, Service.Service_Cost, Service.Service_Notes
    FROM Service;
END;
$$ LANGUAGE plpgsql;


-- Procedure: GetEmployees
CREATE OR REPLACE FUNCTION GetEmployees()
RETURNS TABLE(Employee_ID INT, Branch_ID INT, Name VARCHAR, Role VARCHAR, Phone VARCHAR, Salary DECIMAL) AS $$
BEGIN
    RETURN QUERY
    SELECT Employee.Employee_ID, Employee.Branch_ID, Employee.Name, Employee.Role, Employee.Phone, Employee.Salary
    FROM Employee;
END;
$$ LANGUAGE plpgsql;

