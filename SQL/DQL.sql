-- Q1
Show databases;
DESCRIBE superstore_campaign;
use superstore_campaign;
-- Q2
RENAME TABLE campaign_customers TO superstore_campaign;

SHOW TABLES;

-- Q 3
SELECT * FROM customer_info;

-- Q4
SELECT * FROM spending_profile;

-- Q5
SELECT * FROM channel_usage;

-- Q6 Check whether data

Select *
from superstore_campaign
limit 10;

-- Final SQL Structure
-- superstore_db
-- │
-- ├── superstore_campaign
-- │
-- ├── customer_info          ← Optional View
-- │
-- ├── spending_profile       ← Optional View
-- │
-- └── channel_usage          ← Optional View

-- Q7 Check: Data actually imported?

select * from superstore_campaign;
-- ✅ Import successful

-- Q 8 Check Total Number of Rows
select count(*) AS Total_Rows
from superstore_campaign;
-- Total_Rows 2240

-- Q 9 Check Duplicate IDs
select ID, Count(*) as ID_count
from superstore_campaign
group by ID
having count(*) > 1;
-- ✅ No duplicate customer IDs found.

-- Q10  Check Missing Required Fields
SELECT
    SUM(CASE WHEN Year_Birth IS NULL THEN 1 ELSE 0 END) AS Missing_Year_Birth,
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
    SUM(CASE WHEN Dt_Customer IS NULL THEN 1 ELSE 0 END) AS Missing_Dt_Customer,
    SUM(CASE WHEN Response IS NULL THEN 1 ELSE 0 END) AS Missing_Response
FROM superstore_campaign;

-- Q11  Check Income Range
select 
     min(income) as Minimum_income,
     max(income) as Maximum_income,
     avg(income) as Average_income
from superstore_campaign;

-- Q12 Check Spending Values
SELECT
    MIN(MntWines) AS Min_Wines,
    MAX(MntWines) AS Max_Wines,
    MIN(MntFruits) AS Min_Fruits,
    MAX(MntFruits) AS Max_Fruits,
    MIN(MntMeatProducts) AS Min_Meat,
    MAX(MntMeatProducts) AS Max_Meat,
    MIN(MntFishProducts) AS Min_Fish,
    MAX(MntFishProducts) AS Max_Fish,
    MIN(MntSweetProducts) AS Min_Sweet,
    MAX(MntSweetProducts) AS Max_Sweet,
    MIN(MntGoldProds) AS Min_Gold,
    MAX(MntGoldProds) AS Max_Gold
FROM superstore_campaign;

-- Q13 Check Purchase Counts
SELECT
    MIN(NumDealsPurchases) AS Min_Deals,
    MAX(NumDealsPurchases) AS Max_Deals,
    MIN(NumWebPurchases) AS Min_Web,
    MAX(NumWebPurchases) AS Max_Web,
    MIN(NumCatalogPurchases) AS Min_Catalog,
    MAX(NumCatalogPurchases) AS Max_Catalog,
    MIN(NumStorePurchases) AS Min_Store,
    MAX(NumStorePurchases) AS Max_Store,
    MIN(NumWebVisitsMonth) AS Min_WebVisits,
    MAX(NumWebVisitsMonth) AS Max_WebVisits
FROM superstore_campaign;

-- Q 14 Calculate Total Spending
SELECT
    SUM(
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    ) AS Total_Customer_Spending
FROM superstore_campaign;

-- Q 15 Check Response Distribution
SELECT
    Response,
    COUNT(*) AS Customer_Count
FROM superstore_campaign
GROUP BY Response
ORDER BY Response;

-- Q16 Calculate Response Rate
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responded_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Response_Rate_Percent
FROM superstore_campaign;

-- Q17 Final Step 4 Sanity Check
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT ID) AS Unique_IDs,
    MIN(Income) AS Min_Income,
    MAX(Income) AS Max_Income,
    SUM(MntWines + MntFruits + MntMeatProducts +
        MntFishProducts + MntSweetProducts + MntGoldProds) AS Total_Spend,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Total_Responses
FROM superstore_campaign;

-- Data Quality Checks & Cleaning in SQL
-- Q1 Duplicate ID Check

select ID, Count(*) as ID_count
from superstore_campaign
group by ID
having count(*) > 1;
-- ✅ No duplicate IDs.

-- Q2 Missing Required Fields
SELECT
    SUM(CASE WHEN Year_Birth IS NULL THEN 1 ELSE 0 END) AS Missing_Year_Birth,
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
    SUM(CASE WHEN Dt_Customer IS NULL THEN 1 ELSE 0 END) AS Missing_Dt_Customer,
    SUM(CASE WHEN Response IS NULL THEN 1 ELSE 0 END) AS Missing_Response
FROM superstore_campaign;

-- Q3 Check Implausible Year_Birth
SELECT
    ID,
    Year_Birth
FROM superstore_campaign
WHERE Year_Birth < 1900
   OR Year_Birth > 2005;
   
-- Q4 Check Negative Income
SELECT
    ID,
    Income
FROM superstore_campaign
WHERE Income < 0;
-- there is no rows because of is not show posible income

-- Q5 Check Negative Monetary Values
SELECT
    ID,
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds
FROM superstore_campaign
WHERE MntWines < 0
   OR MntFruits < 0
   OR MntMeatProducts < 0
   OR MntFishProducts < 0
   OR MntSweetProducts < 0
   OR MntGoldProds < 0;
   
   -- The project requires monetary values to be non-negative
   
   -- Q6 Check Negative Purchase Counts
SELECT
    ID,
    NumDealsPurchases,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebVisitsMonth
FROM superstore_campaign
WHERE NumDealsPurchases < 0
   OR NumWebPurchases < 0
   OR NumCatalogPurchases < 0
   OR NumStorePurchases < 0
   OR NumWebVisitsMonth < 0;
-- there is no rows

-- Q7 Count zero spending
SELECT
    SUM(CASE WHEN MntWines = 0 THEN 1 ELSE 0 END) AS Zero_Wines,
    SUM(CASE WHEN MntFruits = 0 THEN 1 ELSE 0 END) AS Zero_Fruits,
    SUM(CASE WHEN MntMeatProducts = 0 THEN 1 ELSE 0 END) AS Zero_Meat,
    SUM(CASE WHEN MntFishProducts = 0 THEN 1 ELSE 0 END) AS Zero_Fish,
    SUM(CASE WHEN MntSweetProducts = 0 THEN 1 ELSE 0 END) AS Zero_Sweet,
    SUM(CASE WHEN MntGoldProds = 0 THEN 1 ELSE 0 END) AS Zero_Gold
FROM superstore_campaign;

-- Q8 Check Zero Purchase Counts
SELECT
    SUM(CASE WHEN NumDealsPurchases = 0 THEN 1 ELSE 0 END) AS Zero_Deals,
    SUM(CASE WHEN NumWebPurchases = 0 THEN 1 ELSE 0 END) AS Zero_Web,
    SUM(CASE WHEN NumCatalogPurchases = 0 THEN 1 ELSE 0 END) AS Zero_Catalog,
    SUM(CASE WHEN NumStorePurchases = 0 THEN 1 ELSE 0 END) AS Zero_Store,
    SUM(CASE WHEN NumWebVisitsMonth = 0 THEN 1 ELSE 0 END) AS Zero_WebVisits
FROM superstore_campaign;

-- Q9 Check Response
SELECT DISTINCT Response
FROM superstore_campaign
ORDER BY Response;

-- Q10 Check Complain
SELECT DISTINCT Complain
FROM superstore_campaign
ORDER BY Complain;

-- Q11 Standardise Education
select Education, count(*) AS Customers_count
from superstore_campaign
group by Education
order by Customers_count Desc;
-- Check for spaces
select Education
from superstore_campaign
where Education <> trim(Education);

-- Q12 Standardise Marital Status
select Marital_Status, count(*) AS Customers_count
from superstore_campaign
group by Marital_Status
order by Customers_count Desc;
-- Check spaces
Select Marital_Status
from csuperstore_campaign
where Marital_Status <> Trim(Marital_Status);

-- Q13 Create a Clean View
CREATE VIEW cleaned_campaign AS
SELECT
    ID,
    Year_Birth,
    TRIM(Education) AS Education,
    TRIM(Marital_Status) AS Marital_Status,
    Income,
    Kidhome,
    Teenhome,
    Dt_Customer,
    Recency,
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds,
    NumDealsPurchases,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebVisitsMonth,
    Complain,
    Response
FROM superstore_campaign;

-- Q15 Final Data Quality Summary
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT ID) AS Unique_IDs,

    SUM(CASE WHEN Year_Birth IS NULL THEN 1 ELSE 0 END) AS Missing_Year_Birth,
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS Missing_Income,
    SUM(CASE WHEN Dt_Customer IS NULL THEN 1 ELSE 0 END) AS Missing_Dt_Customer,
    SUM(CASE WHEN Response IS NULL THEN 1 ELSE 0 END) AS Missing_Response,

    SUM(CASE WHEN Income < 0 THEN 1 ELSE 0 END) AS Negative_Income,

    SUM(CASE
        WHEN MntWines < 0
          OR MntFruits < 0
          OR MntMeatProducts < 0
          OR MntFishProducts < 0
          OR MntSweetProducts < 0
          OR MntGoldProds < 0
        THEN 1 ELSE 0
    END) AS Negative_Spending,

    SUM(CASE
        WHEN NumDealsPurchases < 0
          OR NumWebPurchases < 0
          OR NumCatalogPurchases < 0
          OR NumStorePurchases < 0
          OR NumWebVisitsMonth < 0
        THEN 1 ELSE 0
    END) AS Negative_Counts
FROM superstore_campaign;

-- Exploratory SQL Analysis
-- Q1 Total_Customers
select count(*) AS Total_customers
from cleaned_campaign;

-- Q2 Customer Distribution by Education
Select  Education, Count(*) AS Customers_count
from cleaned_campaign
group by Education
order by Customers_count;
-- Business question: Which education group has the largest number of customers?

-- Q3 Customer Distribution by Marital Status
Select Marital_Status, Count(*) AS Customers_count
From Cleaned_campaign
group by Marital_Status
order by Customers_count;
-- Business question: Which marital-status segment represents the largest customer base?

-- Q4 Average Income by Education
Select Education, Count(*) As Customers,
       round(avg(Income),2) AS Avg_income
from cleaned_campaign
group by Education
order by Avg_Income Desc;
-- Business question: Which education segment has the highest average income?

-- Q5 Total Spending by Product Category
SELECT
    SUM(MntWines) AS Total_Wines,
    SUM(MntFruits) AS Total_Fruits,
    SUM(MntMeatProducts) AS Total_Meat,
    SUM(MntFishProducts) AS Total_Fish,
    SUM(MntSweetProducts) AS Total_Sweets,
    SUM(MntGoldProds) AS Total_Gold
FROM cleaned_campaign;
-- This tells us which product category generates the most spending.

-- Q6 Average Spending per Customer
SELECT
    ROUND(AVG(MntWines), 2) AS Avg_Wines,
    ROUND(AVG(MntFruits), 2) AS Avg_Fruits,
    ROUND(AVG(MntMeatProducts), 2) AS Avg_Meat,
    ROUND(AVG(MntFishProducts), 2) AS Avg_Fish,
    ROUND(AVG(MntSweetProducts), 2) AS Avg_Sweets,
    ROUND(AVG(MntGoldProds), 2) AS Avg_Gold
FROM cleaned_campaign;
-- Business question: What does the average customer spend across product categories?

-- Q7 Total Customer Spending
SELECT
    ID,
    (
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    ) AS Total_Spend
FROM cleaned_campaign
ORDER BY Total_Spend DESC;

-- Q8 Top 10 Highest-Spending Customers
SELECT
	ID,
	(MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    ) AS Total_Spend
FROM cleaned_campaign
order by Total_Spend Desc
limit 10;
-- Business question: Who are the top-value customers based on total product spending?

-- Q9 Average Spending by Education
SELECT
    Education,
    COUNT(*) AS Customers,
    ROUND(
        AVG(
            MntWines +
            MntFruits +
            MntMeatProducts +
            MntFishProducts +
            MntSweetProducts +
            MntGoldProds
        ), 2
    ) AS Avg_Total_Spend
FROM cleaned_campaign
GROUP BY Education
ORDER BY Avg_Total_Spend DESC;
-- This connects customer profile → purchasing behaviour.

-- Q10 Purchase Channel Usage
SELECT
    SUM(NumWebPurchases) AS Web_Purchases,
    SUM(NumCatalogPurchases) AS Catalog_Purchases,
    SUM(NumStorePurchases) AS Store_Purchases,
    SUM(NumDealsPurchases) AS Deal_Purchases
FROM cleaned_campaign;

-- Q11 Average Channel Usage
SELECT
    ROUND(AVG(NumWebPurchases), 2) AS Avg_Web_Purchases,
    ROUND(AVG(NumCatalogPurchases), 2) AS Avg_Catalog_Purchases,
    ROUND(AVG(NumStorePurchases), 2) AS Avg_Store_Purchases,
    ROUND(AVG(NumDealsPurchases), 2) AS Avg_Deal_Purchases,
    ROUND(AVG(NumWebVisitsMonth), 2) AS Avg_Web_Visits
FROM cleaned_campaign;

-- Q12 Response Analysis
SELECT
    Response,
    COUNT(*) AS Customers
FROM cleaned_campaign
GROUP BY Response
ORDER BY Response;

-- Q13 Campaign Response Rate
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responded,
    ROUND(
        100.0 * SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Response_Rate
FROM cleaned_campaign;
-- Business interpretation: Response_Rate = X%

-- Q14 Response Rate by Education
SELECT
    Education,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responded,
    ROUND(
        100.0 * SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Response_Rate
FROM cleaned_campaign
GROUP BY Education
ORDER BY Response_Rate DESC;

-- Q15 Response Rate by Marital Status
SELECT
    Marital_Status,
    COUNT(*) AS Customers,
    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responded,
    ROUND(
        100.0 * SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Response_Rate
FROM cleaned_campaign
GROUP BY Marital_Status
ORDER BY Response_Rate DESC;

-- Q15 Response by Income Segment
SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income < 60000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Segment,

    COUNT(*) AS Customers,

    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responded,

    ROUND(
        100.0 * SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Response_Rate

FROM cleaned_campaign
GROUP BY
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income < 60000 THEN 'Medium Income'
        ELSE 'High Income'
    END
ORDER BY Response_Rate DESC;

-- Q17 Response vs Spending

SELECT
    Response,
    COUNT(*) AS Customers,

    ROUND(
        AVG(
            MntWines +
            MntFruits +
            MntMeatProducts +
            MntFishProducts +
            MntSweetProducts +
            MntGoldProds
        ), 2
    ) AS Avg_Total_Spend,

    ROUND(AVG(Income), 2) AS Avg_Income

FROM cleaned_campaign
GROUP BY Response;

-- Q18 Recency vs Response
SELECT
    CASE
        WHEN Recency <= 30 THEN '0-30 Days'
        WHEN Recency <= 60 THEN '31-60 Days'
        WHEN Recency <= 90 THEN '61-90 Days'
        ELSE '90+ Days'
    END AS Recency_Group,

    COUNT(*) AS Customers,

    SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END) AS Responded,

    ROUND(
        100.0 * SUM(CASE WHEN Response = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Response_Rate

FROM cleaned_campaign

GROUP BY
    CASE
        WHEN Recency <= 30 THEN '0-30 Days'
        WHEN Recency <= 60 THEN '31-60 Days'
        WHEN Recency <= 90 THEN '61-90 Days'
        ELSE '90+ Days'
    END

ORDER BY Response_Rate DESC;
