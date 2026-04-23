# Olist-E-Commerce-Delivery-Performance-Customer-Satisfaction-Analysis
This project analyzes delivery performance across Brazil's largest e-commerce marketplace to identify what drives late deliveries, how lateness affects customer ratings, and when the system is most strained.

## Key Findings
### The SP -> SE route is the core problem
The São Paulo → Espírito Santo shipping route has an 18.1% late rate, more than 2.5x the platform average of 7%. This single route is the largest identifiable driver of late deliveries across the entire dataset.

### Late deliveries cost nearly a full star
On-time orders averages a 4.0 review score. Late orders drop to 3.0-3.5 which is nearly a full point lower. Late orders are only 7% of volume but are disproportionately responsibe for the platform's lowest ratings

### Q4 seasonal spike points to seller capacity, not demand
Late rates spike in September-November, coinciding with high-volume periods. The pattern suggests seller processing capacity as the bottleneck, not poor demand forecasting since routes with the highest baseline late rates are also the ones that deteriorate most under volume pressure.

## Dashboard
<img width="1591" height="894" alt="dashboard" src="https://github.com/user-attachments/assets/d503c2bc-e3f4-4e3b-8857-38198dae1e40" />
The dashboard includes:
- KPI cards: total orders, avg delay (late orders), overall late rates, avg review score
-  Late rate % by shipping route (bar chart)
-  Seller state x product category late rate heatmap
-  Monthly trend: late rate vs. avg review score (dual-axis line chart)

## Dataset
- **Source**: Olist via Kaggle
- **Size**: ~110k orders across 9 relational tables
- **Date ranges**: September 2016 - October 2018
