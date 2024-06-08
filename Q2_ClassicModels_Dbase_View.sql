
/*
1
Use customerNumber, orderNumber from tbl orders,
pull out customer Names based on customer number and product number then product name from orderdetails and products
Create a view for future uses
*/

SELECT 
    orders.customerNumber,
    customers.customerName,
    orders.orderNumber,
    orderdetails.productCode,
    products.productName
FROM
    orders
        INNER JOIN
    orderdetails ON orders.orderNumber = orderdetails.orderNumber
        INNER JOIN
    products ON orderdetails.productCode = products.productCode
        INNER JOIN
    customers ON customers.customerNumber = orders.customerNumber
ORDER BY customers.customerNumber;

/*
Created a view for the practised query
*/
CREATE VIEW Customer_Order_Details AS
    SELECT 
        orders.customerNumber,
        customers.customerName,
        orders.orderNumber,
        orderdetails.productCode,
        products.productName,
        products.buyPrice
    FROM
        orders
            INNER JOIN
        orderdetails ON orders.orderNumber = orderdetails.orderNumber
            INNER JOIN
        products ON orderdetails.productCode = products.productCode
            INNER JOIN
        customers ON customers.customerNumber = orders.customerNumber
    ORDER BY customers.customerNumber;
    
    
    -- Using the View as a tbl in later part of the development
    select * from Customer_Order_Details order by buyPrice desc;
    Select customerName, productName from Customer_Order_Details;
    
    -- Deleting a View
    Drop view if exists Customer_Order_Details;

    -- Creating a new view with Concat of the First and last name of the contact person.
CREATE VIEW Customer_Order_Details2 AS
    SELECT 
        orders.customerNumber,
        customers.customerName,
        concat(customers.contactFirstname,' ',customers.contactLastName) as 'Contact Person',
        orders.orderNumber,
        orderdetails.productCode,
        products.productName,
        products.buyPrice
    FROM
        orders
            INNER JOIN
        orderdetails ON orders.orderNumber = orderdetails.orderNumber
            INNER JOIN
        products ON orderdetails.productCode = products.productCode
            INNER JOIN
        customers ON customers.customerNumber = orders.customerNumber
    ORDER BY customers.customerNumber;
    
    Select * from Customer_Order_Details2;
    
    
