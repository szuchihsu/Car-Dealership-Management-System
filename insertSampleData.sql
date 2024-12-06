INSERT INTO Branch (Name, Address, Phone, Manager) VALUES
('Downtown Motors', '123 Main Street, Cityville', '555-1234', 'Alice Johnson'),
('Uptown Autos', '456 Elm Street, Townsville', '555-5678', 'Bob Smith');

-- Sample Data for Car
INSERT INTO Car (Branch_ID, Make, Model, Year, Price, Status, VIN) VALUES
(1, 'Toyota', 'Camry', 2023, 25000.00, 'New', '1HGBH41JXMN109186'),
(1, 'Honda', 'Civic', 2022, 22000.00, 'Used', '2HGBH41JXMN109187'),
(2, 'Ford', 'F-150', 2023, 30000.00, 'New', '3HGBH41JXMN109188'),
(2, 'Chevrolet', 'Malibu', 2021, 18000.00, 'Used', '4HGBH41JXMN109189'),
(1, 'Tesla', 'Model 3', 2023, 45000.00, 'New', '5HGBH41JXMN109190');

-- Sample Data for Customer
INSERT INTO Customer (Name, Email, Phone, Address) VALUES
('John Doe', 'john.doe@example.com', '555-1010', '789 Pine Street, Cityville'),
('Jane Smith', 'jane.smith@example.com', '555-2020', '123 Oak Avenue, Townsville'),
('Michael Green', 'michael.green@example.com', '555-3030', '456 Maple Lane, Cityville'),
('Sarah Connor', 'sarah.connor@example.com', '555-4040', '789 Cypress Way, Townsville');

-- Sample Data for Employee
INSERT INTO Employee (Branch_ID, Name, Role, Phone, Salary) VALUES
(1, 'Charlie Brown', 'Salesperson', '555-3030', 50000.00),
(2, 'Lucy Van Pelt', 'Technician', '555-4040', 45000.00),
(1, 'Linus Van Pelt', 'Manager', '555-5050', 70000.00),
(2, 'Peppermint Patty', 'Salesperson', '555-6060', 48000.00);

-- Sample Data for Sales
INSERT INTO Sales (Car_ID, Customer_ID, Employee_ID, Sale_Date, Sale_Amount, Financing_Option) VALUES
(1, 1, 1, '2024-01-15 10:00:00', 25000.00, TRUE),
(2, 2, 1, '2024-01-20 14:00:00', 22000.00, FALSE),
(4, 3, 4, '2024-02-10 16:00:00', 18000.00, TRUE),
(5, 4, 1, '2024-03-05 11:00:00', 45000.00, TRUE);

-- Sample Data for Service
INSERT INTO Service (Car_ID, Customer_ID, Employee_ID, Service_Date, Service_Type, Service_Cost, Service_Notes) VALUES
(2, 1, 2, '2024-02-01 09:30:00', 'Oil Change', 75.00, 'Changed oil and filter'),
(3, 2, 2, '2024-02-05 11:00:00', 'Tire Rotation', 50.00, 'Rotated all four tires'),
(4, 3, 2, '2024-03-01 14:00:00', 'Brake Inspection', 120.00, 'Replaced front brake pads'),
(5, 4, 4, '2024-04-01 10:30:00', 'Software Update', 0.00, 'Installed latest firmware');

-- Sample Data for Finance
INSERT INTO Finance (Sale_ID, Loan_Amount, Interest_Rate, Loan_Term, Monthly_Payment) VALUES
(1, 20000.00, 3.5, 60, 363.76),
(3, 15000.00, 4.0, 48, 339.00),
(4, 40000.00, 2.9, 72, 610.12);