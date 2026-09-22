# Bank Loan Analysis & Financial Dashboard 🏦📊

## 🌟 Project Overview
This end-to-end data analytics project provides deep-dive operational and financial insights into a retail bank's lending portfolio. Utilizing **SQL (SQL Server)** for robust backend data aggregation and query testing alongside **Tableau** for dynamic frontend data visualization, this project empowers stakeholders with automated Key Performance Indicators (KPIs) and continuous monitoring tracks (Month-on-Month and Month-to-Date metrics).

### 🎯 Key Objectives:
*   Track loan application volume, funded values, and total collections.
*   Examine portfolio health by dividing segments into "Good Loans" versus "Bad Loans".
*   Provide multidimensional filters (State, Term, Purpose, Home Ownership) to unlock granular trends.

---

## 📊 Interactive Dashboards & Features
*Note: Please replace the image placeholders below with your actual uploaded image paths once added to your GitHub `Images/` folder.*

### 1. Summary Dashboard
Focuses on high-level financial health, highlighting loan classifications ("Good" vs. "Bad" loans) alongside key application volumes, interest margins, and debt-to-income distributions.

<img width="1505" height="832" alt="summary_dashboard" src="https://github.com/user-attachments/assets/84210280-0355-40f5-a497-1bfa6cfd1965" />


### 2. Overview Dashboard
Provides spatial mapping of loan distribution across regions, time-series visualization for application trends, and segment breakdowns by employment durations and loan purposes.

<img width="1512" height="846" alt="overview_dashboard" src="https://github.com/user-attachments/assets/c5c97bef-797b-4294-8c37-2a90328a5ad7" />


### 3. Details Dashboard
A complete transaction grid allowing users to drill directly down into individual borrower characteristics, specific sub-grades, dynamic calculations, and structured verification details.

<img width="1487" height="832" alt="details_dashboard" src="https://github.com/user-attachments/assets/8d4e29ef-e08d-4407-ab9f-f5326eeee95b" />


---

## 📈 Core Financial Metrics Found (Executive Summary)
Based on data transformations handled directly within our dataset:

| Financial Attribute | System Matrix Performance |
| :--- | :--- |
| **Total Loan Applications** | **38,576** applications processed globally |
| **Total Capital Funded** | **\$435.7M** total disbursed amount |
| **Total Revenue Collected** | **\$473.1M** recovered/received from payments |
| **Average Portfolio Interest Rate** | **12.0%** weighted average margin |
| **Average Debt-to-Income (DTI)** | **13.3%** systemic debt ratio balance |
| **Good Loan Rate Recovery** | **86.2%** of assets completely clear or active (`Fully Paid` / `Current`) |
| **Bad Loan / Charge-Off Deficit** | **13.8%** written-off loan loss value (`Charged Off`) |

---

## 💻 Tech Stack Used
*   **Database Management System:** Microsoft SQL Server (T-SQL)
*   **Business Intelligence Tool:** Tableau Desktop (2026.2)
*   **Documentation Medium:** Markdown / GitHub Pages

---

## 🗃️ Featured SQL Queries & Implementations
Below are snapshots of the technical transformations engineered to aggregate clean results for the interactive frontend layers.

### Portfolio Classification Code (Good vs. Bad Loans)
```sql
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / COUNT(id) AS Good_Loan_Percentage,
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Loan_Data;
```

### Multidimensional Regional Breakdowns
```sql
SELECT 
    address_state AS State,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM Bank_Loan_Data
GROUP BY address_state
ORDER BY Total_Loan_Applications DESC;
```

---

## 💡 Key Business Insights For Recruiters
1. **Positive Portfolio Health:** With an **86.2% Good Loan Rate**, the underwriting team is efficiently screening quality candidates.
2. **Deficit Monitoring:** The **13.8% Charge-off rate** represents higher interest margins (13.9% average) compared to fully-paid groups (11.6%), revealing clear trade-offs between risky consumer segments and gross returns.
3. **Debt-to-Income Stability:** The overall system average DTI sits tightly at **13.3%**, showing safe risk control standards across state divisions.

---
