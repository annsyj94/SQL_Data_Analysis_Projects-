
SELECT * FROM Shopping.product; -- Use the table 

SELECT Product_Category,COUNT(Product_Category) 
AS "Number of Products" 
FROM Shopping.product 
GROUP BY Product_Category; -- Count number of products 

SELECT * FROM Shopping.customer 
WHERE  Province = 'ONTARIO' 
AND Customer_Segment = 'CONSUMER'; -- Find the province 'Ontario' and 'CONSUMER'

SELECT * FROM Shopping.customer 
WHERE NOT  Province = 'BRITISH COLUBIA' 
AND NOT Province = 'NOVA SCOTIA' AND NOT Province = 'SASKACHEWAN' 
AND NOT Customer_Segment='CONSUMER'; -- Delete British Columbia, Nova Scotia, Saskachewan and Consumer 

SELECT Province,COUNT(Province) 
AS "Number of Provinces" 
FROM Shopping.customer GROUP BY Province; -- Count number of provinces.

SELECT Order_ID,Order_Date,Order_Priority FROM Shopping.order
WHERE NOT Order_Priority = 'NOT SPECIFIED'
AND NOT Order_Priority = 'CRITICAL'
ORDER BY Order_ID DESC; -- Not include 'Not Specified' and 'Critica'

DELETE FROM Shopping.order
WHERE Order_Priority = 'NOT SPECIFIED' 
AND Order_Priority = 'CRITICAL'; -- Delete them 

SELECT Ship_Mode, COUNT(Ship_Mode) 
AS "Number of Ship_Mode" 
FROM Shopping.shipping 
GROUP BY Ship_Mode; -- Find number of ship_modes

SELECT * FROM Shopping.market; -- Read the table 

SELECT Ship_id, Ship_mode 
FROM Shopping.shipping
WHERE EXISTS (SELECT Ship_id FROM Shopping.market 
WHERE Shopping.market.Ship_id = Shopping.shipping.Ship_id
 AND Shipping_Cost<40);-- Use EXISTS to test for the existence of any record in a subquery

SELECT DISTINCT (Shopping.market.Prod_id), 
Shopping.product.Product_Sub_Category
FROM Shopping.market
INNER JOIN Shopping.product
ON Shopping.product.Prod_id = Shopping.market.Prod_id; -- Select record that have matching values in both tables 


CREATE TABLE `Shopping`.`userID` (
  `ID` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Middle_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Mobile` VARCHAR(15) NULL,
  `Email` VARCHAR(15) NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`)); -- Create the table 'userID'


