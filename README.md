#  📊 Superstore Marketing Analysis

<p align="center">

# 🚀 Customer & Marketing Analytics using Excel, SQL, Python, Statistics, RFM & BI

### Turning Customer Data into Actionable Marketing Insights

</p>

<p align="center">

<img src="https://img.shields.io/badge/Excel-Data%20Analysis-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white">
<img src="https://img.shields.io/badge/MySQL-SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/Python-Analytics-3776AB?style=for-the-badge&logo=python&logoColor=white">
<img src="https://img.shields.io/badge/Pandas-Analysis-150458?style=for-the-badge&logo=pandas&logoColor=white">
<img src="https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black">
<img src="https://img.shields.io/badge/Tableau-Visualization-E97627?style=for-the-badge&logo=tableau&logoColor=white">

</p>

## 📌 Project Overview

**Superstore Marketing Analysis** is an end-to-end **Data Analytics with GenAI Capstone Project** focused on understanding customer behavior, purchasing patterns, campaign response, customer segmentation, and marketing opportunities.

The project follows a complete analytics workflow — from **data understanding and validation** to **SQL data management, Python analysis, statistical testing, RFM segmentation, dashboard development, and business recommendations**.

The objective is to transform raw customer data into **actionable business insights** that can support customer targeting, marketing campaign optimization, and strategic decision-making.

---

## 🎯 Business Objectives

The project aims to answer key business questions such as:

* Which customer groups generate the highest revenue?
* Is higher income associated with higher customer spending?
* Which products/categories contribute most to total spending?
* Which purchasing channels are most frequently used?
* What customer characteristics are associated with campaign acceptance?
* Are there statistically significant differences in spending across customer groups?
* Which customers are Champions, Loyal Customers, At Risk, or Lost?
* Which customer segments should receive targeted marketing campaigns?
* What marketing strategies can improve customer engagement and campaign response?

---

# 📊 Dashboard Preview

## 🏢 Executive Customer & Campaign Dashboard

The executive dashboard provides a high-level view of customer behavior, spending, campaign performance, and purchasing activity.

<p align="center">

<img src="Images/EXECUTIVE CUSTOMER & CAMPAIGN DASHBOARD.png" alt="Executive Customer and Campaign Dashboard" width="100%">

</p>

### Dashboard Focus

- 👥 Customer overview
- 💰 Customer spending
- 📢 Campaign response
- 🛒 Purchase channels
- 📈 Business KPIs
- 🎯 Customer targeting

---

# 📈 Marketing & Customer Segment Dashboard

This dashboard focuses on customer segmentation, marketing performance, spending patterns, and customer behavior.

<p align="center">

<img src="Images/MARKETING & CUSTOMER SEGMENT DASHBOARD.png" alt="Marketing and Customer Segment Dashboard" width="100%">

</p>

### Analysis Includes

- Customer segments
- Campaign response
- Product spending
- Purchase channels
- Customer behavior
- Marketing opportunities

---

# 👥 Customer Segment Details

Customer segmentation is an important part of the project.

The analysis uses **RFM — Recency, Frequency, and Monetary Value** to group customers based on their purchasing behavior.

<p align="center">

<img src="Images/CUSTOMER SEGMENT DETAILS.png" alt="Customer Segment Details" width="100%">

</p>

### Main Customer Segments

🏆 **Champions**

💎 **Loyal Customers**

⭐ **Potential Loyalists**

🌱 **New Customers**

⚠️ **At Risk**

🔴 **Lost Customers**

# 🛠️ Tools & Technologies

| Tool                     | Purpose                                                 |
| ------------------------ | ------------------------------------------------------- |
| **Microsoft Excel**      | Data understanding, validation & quality checks         |
| **MySQL / SQL**          | Database design, ingestion & data analysis              |
| **Python**               | Data cleaning, EDA, statistical analysis & segmentation |
| **Pandas**               | Data manipulation                                       |
| **NumPy**                | Numerical analysis                                      |
| **Matplotlib / Seaborn** | Data visualization                                      |
| **SciPy / Statsmodels**  | Statistical & hypothesis testing                        |
| **Scikit-learn**         | Predictive modeling                                     |
| **Power BI / Tableau**   | Interactive dashboards                                  |
| **GitHub**               | Project documentation & version control                 |

---

# 📂 Project Workflow

```text
Superstore Marketing Analysis
│
├── Step 1 — Excel
│   └── Data Understanding
│
├── Step 2 — Excel
│   └── Data Validation
│
├── Step 3 — SQL
│   └── Database Design & Table Creation
│
├── Step 4 — SQL
│   └── Data Ingestion & Sanity Checks
│
├── Step 5 — Python
│   └── Connect Python to SQL
│
├── Step 6 — Python
│   └── Exploratory Data Analysis
│
├── Step 7 — Statistics
│   └── Hypothesis Testing
│
├── Step 8 — Python
│   └── RFM & Customer Segmentation
│
├── Step 9 — Power BI / Tableau
│   └── Executive Dashboard
│
└── Step 10 — Business Analysis
    ├── Key Insights
    ├── Statistical Findings
    ├── Customer Segments
    └── Marketing Recommendations
```

---

# 🔎 Step 1 — Data Understanding | Excel

The first stage focuses on understanding the structure and meaning of the dataset.

### Activities

* Reviewed all customer-level variables
* Identified demographic attributes
* Examined product spending variables
* Reviewed purchase-channel variables
* Identified campaign response variables
* Created basic exploratory summaries
* Documented business questions and hypotheses

### Key Data Areas

* Customer demographics
* Income
* Household composition
* Customer tenure
* Product spending
* Purchase channels
* Website activity
* Campaign response
* Complaints

---

# ✅ Step 2 — Data Validation | Excel

The dataset was validated before loading it into the SQL database.

### Data Quality Checks

* Checked unique customer IDs
* Identified missing required fields
* Checked invalid or zero values
* Reviewed monetary columns
* Validated purchase-count columns
* Identified implausible birth years
* Checked categorical consistency
* Reviewed duplicate records
* Created a data quality log

### Required Field Validation

Example Excel formula:

```excel
=IF(OR([@Response]="",[@Income]="",[@Year_Birth]="",[@Dt_Customer]=""),"Missing","OK")
```

This ensures important fields are not blank.

---

# 🗄️ Step 3 — Database Design & Table Creation | SQL

The validated dataset was converted into a structured relational database.

### Database Tasks

* Created the marketing analysis database
* Designed the customer table
* Defined appropriate data types
* Created primary/unique keys
* Applied `NOT NULL` constraints where required
* Added validation constraints
* Structured spending and purchase variables

### Example Table

```sql
CREATE TABLE superstore_campaign (
    ID INT PRIMARY KEY,
    Year_Birth INT,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income DECIMAL(12,2),
    Kidhome INT,
    Teenhome INT,
    Dt_Customer DATE,
    Recency INT,
    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,
    Response INT,
    Complain INT
);
```

---

# 📥 Step 4 — Data Ingestion & Sanity Checks | SQL

After creating the database structure, the validated dataset was loaded into SQL.

### Sanity Checks

Performed SQL checks for:

* Total number of records
* Duplicate customer IDs
* Missing values
* Minimum and maximum values
* Distinct customer counts
* Total spending
* Purchase-channel activity
* Campaign response counts

### Example Queries

```sql
SELECT COUNT(*) 
FROM superstore_campaign;
```

```sql
SELECT COUNT(DISTINCT ID)
FROM superstore_campaign;
```

```sql
SELECT 
    MIN(Income) AS Min_Income,
    MAX(Income) AS Max_Income,
    AVG(Income) AS Avg_Income
FROM superstore_campaign;
```

---

# 🐍 Step 5 — Connect Python to SQL

Python was connected to the SQL database to perform advanced analysis.

### Technologies

* Python
* Pandas
* SQLAlchemy
* PyMySQL
* MySQL

### Example Connection

```python
from sqlalchemy import create_engine

engine = create_engine(
    "mysql+pymysql://username:password@localhost/database_name"
)

df = pd.read_sql(
    "SELECT * FROM superstore_campaign",
    engine
)
```

This approach allows the analysis to work directly with the structured SQL dataset.

---

# 📈 Step 6 — Exploratory Data Analysis | Python

Python was used for detailed exploratory data analysis.

### Analysis Areas

#### Customer Demographics

* Age distribution
* Education
* Marital status
* Household composition
* Income distribution

#### Spending Analysis

* Total customer spending
* Product-level spending
* Spending distribution
* High-value customers
* Low-value customers

#### Purchase Behavior

* Web purchases
* Store purchases
* Catalog purchases
* Deal purchases
* Website visits

#### Campaign Analysis

* Response rate
* Response by demographics
* Response by income
* Response by spending
* Response by purchase channel

### Example Derived Metric

```python
df["Total_Spend"] = (
    df["MntWines"]
    + df["MntFruits"]
    + df["MntMeatProducts"]
    + df["MntFishProducts"]
    + df["MntSweetProducts"]
    + df["MntGoldProds"]
)
```

---

# 📊 Step 7 — Statistical Analysis & Hypothesis Testing

Statistical methods were used to determine whether observed differences and relationships were statistically significant.

### 1. Group Comparisons

Used:

* Independent t-test
* Mann–Whitney U test

Example:

> Do customers who accepted the campaign have significantly higher spending than customers who did not?

---

### 2. ANOVA / Kruskal-Wallis

Used to compare spending across multiple customer groups.

Example:

> Does customer spending differ significantly across education groups?

---

### 3. Chi-Square Test

Used to examine relationships between categorical variables.

Example:

> Is Education associated with Campaign Response?

---

### 4. Correlation Analysis

Examined relationships such as:

```text
Income ↔ Total Spending
Website Visits ↔ Web Purchases
Recency ↔ Campaign Response
```

---

### 5. Predictive Modeling

Potential models include:

* Logistic Regression
* Decision Tree
* Random Forest

The objective is to identify variables that influence campaign acceptance.

---

# 👥 Step 8 — RFM Analysis & Customer Segmentation

Customer segmentation was performed using **RFM Analysis**.

### RFM Framework

| Metric        | Meaning                               |
| ------------- | ------------------------------------- |
| **Recency**   | How recently the customer purchased   |
| **Frequency** | How frequently the customer purchased |
| **Monetary**  | How much the customer spent           |

Customers were assigned RFM scores and grouped into meaningful business segments.

### Example Segments

* 🏆 Champions
* 💎 Loyal Customers
* ⭐ Potential Loyalists
* 🌱 New Customers
* ⚠️ At Risk
* 🔴 Lost Customers

### Example Segmentation Logic

```python
def customer_segment(score):
    if score >= 13:
        return "Champions"
    elif score >= 10:
        return "Loyal Customers"
    elif score >= 7:
        return "Potential Loyalists"
    else:
        return "At Risk"
```

The segmentation helps the business develop **different marketing strategies for different customer groups**.

---

# 📊 Step 9 — Executive Dashboard | Power BI / Tableau

The final analysis was transformed into an interactive executive dashboard.

### Dashboard KPIs

* Total Customers
* Total Revenue / Spending
* Average Customer Spend
* Campaign Response Rate
* Average Income
* Web Purchases
* Store Purchases
* Catalog Purchases

### Dashboard Visualizations

* Customer segment distribution
* Income vs Total Spending
* Spending by product category
* Campaign response analysis
* Purchase-channel analysis
* Customer demographics
* RFM segment performance

### Interactivity

The dashboard supports interactive analysis using:

* Filters
* Slicers
* Drill-down
* Customer segments
* Demographic categories
* Campaign response
* Purchase channels

---

# 💼 Step 10 — Business Analysis

The final stage converts analytical results into business recommendations.

## Key Insights

The analysis focuses on identifying:

* High-value customers
* High-performing product categories
* Strong purchasing channels
* Campaign-responsive customer groups
* Low-engagement customers
* Customers at risk of churn
* Demographic patterns
* Income-spending relationships

---

## 📌 Statistical Findings

Statistical testing helps distinguish between:

```text
Observed Difference
        ↓
Statistical Test
        ↓
p-value
        ↓
Significant / Not Significant
        ↓
Business Interpretation
```

This ensures that recommendations are supported by statistical evidence rather than assumptions.

---

# 🎯 Marketing Recommendations

Based on the combined EDA, statistical analysis, and customer segmentation:

### 🏆 Champions

* Provide loyalty rewards
* Offer premium products
* Introduce referral programs
* Encourage repeat purchases

### 💎 Loyal Customers

* Personalized offers
* Cross-selling
* Product recommendations
* Loyalty benefits

### ⚠️ At-Risk Customers

* Re-engagement campaigns
* Personalized discounts
* Reminder campaigns
* Limited-time offers

### 🔴 Lost Customers

* Win-back campaigns
* Special incentives
* Personalized communication
* Analyze reasons for inactivity

### 📈 High-Income Customers

* Premium product campaigns
* High-value bundles
* Exclusive offers

---

# 📁 Project Structure

```text
Superstore-Marketing-Analysis/
│
├── README.md
│
├── Data/
│   └── superstore_campaign.csv
│
├── Excel/
│   ├── Data_Understanding.xlsx
│   ├── Data_Validation.xlsx
│   └── Data_Quality_Log.xlsx
│
├── SQL/
│   ├── 01_Create_Database.sql
│   ├── 02_Create_Table.sql
│   ├── 03_Data_Ingestion.sql
│   └── 04_Sanity_Checks.sql
│
├── Python/
│   ├── 01_SQL_Connection.ipynb
│   ├── 02_EDA.ipynb
│   ├── 03_Statistical_Analysis.ipynb
│   └── 04_RFM_Segmentation.ipynb
│
├── Dashboard/
│   ├── PowerBI/
│   │   └── Superstore_Marketing_Dashboard.pbix
│   │
│   └── Tableau/
│       └── Superstore_Marketing_Dashboard.twbx
│
├── Images/
│   ├── dashboard.png
│   ├── rfm_segments.png
│   └── analysis.png
│
└── Reports/
    └── Business_Recommendations.pdf
```

---

# 📌 Key Deliverables

| Stage              | Deliverable                |
| ------------------ | -------------------------- |
| Excel              | Data Understanding         |
| Excel              | Data Validation            |
| SQL                | Database Schema            |
| SQL                | Data Ingestion             |
| SQL                | Sanity Checks              |
| Python             | SQL Connection             |
| Python             | EDA                        |
| Statistics         | Hypothesis Testing         |
| Python             | RFM Segmentation           |
| Power BI / Tableau | Executive Dashboard        |
| Business Analysis  | Insights & Recommendations |

---

# 🚀 End-to-End Analytics Pipeline

```text
Raw Customer Data
       ↓
Excel Data Understanding
       ↓
Excel Data Validation
       ↓
SQL Database Design
       ↓
SQL Data Ingestion
       ↓
SQL Sanity Checks
       ↓
Python + SQL Connection
       ↓
Exploratory Data Analysis
       ↓
Statistical Testing
       ↓
RFM Analysis
       ↓
Customer Segmentation
       ↓
Power BI / Tableau Dashboard
       ↓
Business Insights
       ↓
Marketing Recommendations
```

---

# 💡 Business Value

This project demonstrates how raw customer data can be transformed into a structured **data-driven marketing strategy**.

The combination of:

**Data Quality + SQL + Python + Statistics + RFM + BI + Business Analysis**

provides a complete framework for:

* Customer targeting
* Campaign optimization
* Customer retention
* Customer segmentation
* Revenue improvement
* Data-driven decision-making

---

# 👨‍💻 Skills Demonstrated

* Data Cleaning & Validation
* Excel Data Analysis
* SQL Database Design
* SQL Data Analysis
* Python Data Analysis
* Exploratory Data Analysis
* Statistical Hypothesis Testing
* RFM Analysis
* Customer Segmentation
* Data Visualization
* Power BI / Tableau
* Business Intelligence
* Marketing Analytics
* Business Recommendations
* Git & GitHub

---

# 📜 Project Status

**Status:** 🚧 In Progress

The project is being developed step-by-step from data preparation through final business recommendations.

---

## ⭐ Conclusion

The **Superstore Marketing Analysis** project demonstrates a complete analytics lifecycle, starting from raw customer data and ending with actionable marketing recommendations.

The goal is not only to analyze data, but to answer **real business questions using data, statistics, customer segmentation, and interactive dashboards**.
