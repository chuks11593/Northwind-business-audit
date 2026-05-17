NORTHWIND SALES AND OPERATIONAL AUDIT:
This project is a business analysis of Northwind Traders. I used SQL to structure and clean the data, Python (Pandas) to look for deeper trends, and Tableau to build an interactive dashboard. The goal of this project is to help managers make better decisions about sales, shipping performance, and customer retention.

🛠️ Tools I Used
SQL: To join multiple tables together and clean raw database files.

Python (Pandas): To check for correlations in the data.

Tableau: To design an interactive dashboard for business owners.

📊 Key Solutions in This Project
1. Customer Retention Tiers (Tableau Dashboard Sheet 6).
   
The Problem: The data contains historical dates from the 1990s. Comparing these old dates to the current calendar year made every customer look like they had abandoned the business.

The Solution: I used a Level of Detail (LOD) expression in Tableau to count the days since a customer's last purchase relative to the newest date in the dataset.

The Result: This created a reliable "To-Call List" that groups customers into active, slowing, or at-risk categories so the sales team can win back old clients.

2. Frequently Bought Together Matrix (Tableau Dashboard Sheet 7).
   
The Problem: Tableau naturally compares a product to itself, creating a distracting diagonal line across the view instead of showing different product pairings.

The Solution: I went into the Data Source tab and created a Self-Join on the order_details tables using the "Not Equal To" (<>) operator.

The Result: This removed the duplicate matches and created a clean heat map. Managers can now instantly see which different products are frequently bought together to design discount bundles.

3. Shipping and Category Performance (Tableau Dashboard Sheet 1 & 2).
   
The Problem: The business needed an easy way to spot shipping delays and track product performance.

The Solution: I built a bar chart measuring the average days late for each shipping provider, alongside a Treemap comparing product categories.

The Result: The business can now identify which shipping company is the most reliable and see exactly which categories drive the highest sales volume.

4. Country's Top selling products (Tableau Dashboard Sheet 4).
   
The Problem: It was hard to see which products were selling best in individual countries because all the data was crammed into one giant bar chart. A user had to scroll through a long list just to find information for a single region.

The Solution: I linked Sheet 4 (Map) and Sheet 5 (Bar Chart) using a Dashboard Filter Action. Now, the map works as a clickable filter. When you click on any country, the bar chart instantly updates to show only the top-selling products for that specific country, sorted from highest to lowest sales.

The Result: This makes the dashboard much cleaner and easier to use. Instead of looking at a confusing wall of data, users can just click a country on the map to get the exact sales insights they need right away.

📁 Repository Structure
01_SQL_Scripts/ — SQL queries used to join data and calculate revenue.

02_Python_Analysis/ — Jupyter Notebook files for trend analysis.

03_Tableau_Dashboard/ — The workbook file containing the finished dashboard views.

🚀 How to Use
Look into the 01_SQL_Scripts folder to see how the database tables are connected.

Look into the 02_Python_Analysis folder to observe deeper trends.

Open the 03_Tableau_Dashboard file to interact with the maps and charts.
