CREATE DATABASE superstore_campaign;

USE superstore_campaign;



CREATE TABLE superstore_campaign (
    ID INT PRIMARY KEY,
    
    Year_Birth INT NOT NULL,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income DECIMAL(12,2) NOT NULL,
    
    Kidhome INT,
    Teenhome INT,
    Dt_Customer DATE NOT NULL,
    Recency INT,

    MntWines DECIMAL(12,2),
    MntFruits DECIMAL(12,2),
    MntMeatProducts DECIMAL(12,2),
    MntFishProducts DECIMAL(12,2),
    MntSweetProducts DECIMAL(12,2),
    MntGoldProds DECIMAL(12,2),

    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,

    Complain INT NOT NULL,
    Response INT NOT NULL,

    CONSTRAINT chk_income
        CHECK (Income >= 0),

    CONSTRAINT chk_spending
        CHECK (
            MntWines >= 0
            AND MntFruits >= 0
            AND MntMeatProducts >= 0
            AND MntFishProducts >= 0
            AND MntSweetProducts >= 0
            AND MntGoldProds >= 0
        ),

    CONSTRAINT chk_purchase_counts
        CHECK (
            NumDealsPurchases >= 0
            AND NumWebPurchases >= 0
            AND NumCatalogPurchases >= 0
            AND NumStorePurchases >= 0
            AND NumWebVisitsMonth >= 0
        ),

    CONSTRAINT chk_response
        CHECK (Response IN (0,1)),

    CONSTRAINT chk_complain
        CHECK (Complain IN (0,1))
);

-- Optional Views  1 — customer_info
CREATE VIEW customer_info AS
SELECT
    ID,
    Year_Birth,
    Education,
    Marital_Status,
    Income,
    Kidhome,
    Teenhome,
    Dt_Customer,
    Recency
FROM superstore_campaign;

-- Spending Profile View
CREATE VIEW spending_profile AS
SELECT
    ID,
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds,
    (
        MntWines +
        MntFruits +
        MntMeatProducts +
        MntFishProducts +
        MntSweetProducts +
        MntGoldProds
    ) AS Total_Spend
FROM superstore_campaign;
 
 -- Channel Usage View
 CREATE VIEW channel_usage AS
SELECT
    ID,
    NumDealsPurchases,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebVisitsMonth
FROM superstore_campaign;


