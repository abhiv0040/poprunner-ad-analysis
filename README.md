# 📊 PopRunner Ad Effectiveness Analysis

**Author**: Abhishek Verma  
**Location**: Chicago,IL 
**Date**: March 2025  

---

## 🧠 Overview

This project analyzes the effectiveness of **digital advertisements**—specifically **email blasts** and **website pop-up messages**—on customer purchasing behavior for **PopRunner**, an online retailer. Using **SQL within R (sqldf)**, we examined customer demographics, engagement, and spending patterns across four structured datasets.

The analysis supports **data-driven marketing decisions** by determining which advertising strategy most effectively increases customer spending and how factors like **gender, age, and loyalty status** influence outcomes.

---

## 📂 Project Files

| File | Description |
|------|-------------|
| `poprunner_analysis.R` | Main R script using `sqldf` to analyze the four datasets |
| `consumer.csv` | Customer demographic and loyalty information |
| `email.csv` | Data on whether each customer opened the email blast |
| `pop_up.csv` | Records of pop-up ad engagement (received/saved discount code) |
| `purchase.csv` | Total purchase value for each customer |
| `PopRunner_Report.pdf` | Full technical report with executive summary, charts, and recommendations |

---

## 🎯 Objective

- Identify whether **email blasts** or **website pop-ups** better drive customer purchases.
- Evaluate demographic impact (age, gender, loyalty).
- Generate actionable marketing recommendations using data insights.

---

## 🔍 Key Questions Answered

1. Which advertisement channel (email or pop-up) drives more customer spending?
2. What percentage of customers engage with each type of ad?
3. How do demographics influence ad effectiveness?
4. Did the top spender open the email?
5. Did the lowest spender see a pop-up?

---

## 📊 Key Findings

| Metric | Email Ads | Pop-up Ads |
|--------|-----------|------------|
| Open Rate / Engagement | 8% opened | 33% saved discount |
| Avg. Spend (Engaged Users) | **$240.83** | $131.74 |
| Avg. Spend (Non-Engaged) | $126.12 | **$138.69** |
| Effectiveness | ✅ Strong impact | ❌ No measurable benefit |

- **Email campaigns were far more effective**, with those who opened emails spending nearly **double** the amount.
- **Pop-ups** had a high discount code save rate but **lower average spend**.
- **Male customers** spent more ($177.35) than females ($122.22), despite being fewer in number.
- Spending increased with **age** and **loyalty level**.

---

## 🧪 Use Cases (Nested Queries)

- **Top Spender** (Consumer ID: `5955534353`) **did open** the email.
- **Lowest Spender** (Consumer ID: `5887286353`) **did not receive** a pop-up.

---

## 🧠 Recommendations

1. **Prioritize Email Marketing**: Improve open rates with A/B testing on subject lines and content.
2. **Use Pop-Ups as Secondary Tools**: Trigger only for users who ignore emails.
3. **Demographic Targeting**: Personalize campaigns based on age, gender, and loyalty.
4. **Dynamic Discounts**: Offer customized promotions based on user behavior.
5. **Continuous Optimization**: Run controlled experiments (A/B tests) to refine strategies.

---

## 🛠 Tools Used

- **Language**: R
- **Database Querying**: SQL (via `sqldf` package)
- **Data Format**: `.csv` files
- **Visualization/Reporting**: PDF report (tables and summaries)

---

## 📈 Result Summary

| Type | Average Spend ($) | Total Sales ($) |
|------|-------------------|-----------------|
| All Customers | 135.21 | 1,221,254 |
| Email Opened | **240.83** | 172,432 |
| Email Not Opened | 126.12 | 1,048,822 |
| Pop-up Received | 131.74 | 594,929.80 |
| Pop-up Not Received | **138.69** | 626,324.50 |

---

## 📬 Contact

Feel free to connect or reach out via LinkedIn for feedback or collaboration opportunities.

---

> _“Data beats opinion — this project helped uncover how even a lower-engagement tool like email marketing can outperform flashy UI tactics like pop-ups when used correctly.”_

