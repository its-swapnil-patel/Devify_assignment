# Devify_assignment_readme_file

README - DevifyX Franchise Store Locator & Manager

Project Title:
Franchise Store Locator & Manager - MySQL Schema & Query System

Author:
Swapnil Patil

Database Name:
devify

Overview:
This project is part of an internship assignment for DevifyX. It involves building a normalized MySQL database schema and writing SQL queries for a franchise-based store locator and management system. No frontend/backend was implemented — the entire system is designed and demonstrated using SQL.

Schema Summary:
1. Franchise
   - Stores franchise brand information.
2. Store
   - Contains location and geodata for each store.
3. StoreManager
   - Tracks individual managers assigned to each store.
4. OperatingHours
   - Maintains open/close times per store per day.
5. StoreStatus
   - Tracks whether a store is Open, Closed, etc.
6. StoreServices
   - Lists services offered by stores (e.g., Delivery, Pickup).

Features Implemented:
✅ Fully normalized schema using foreign keys  
✅ Sample data: 10+ realistic entries per table  
✅ Search queries: by city, state, service, and geo-coordinates  
✅ Reporting queries: stores per franchise, status-wise count, multi-store managers  

Tools Used:
- MySQL 8.0+
- ChatGPT (for guidance and code verification)

Submission File:
- devify_assignment.sql (includes schema, data, and all queries)

Notes:
- Proximity search is implemented as a basic latitude/longitude filter.
- ENUMs are used where fixed values apply (days, statuses).
- Data constraints and referential integrity are enforced via keys and types.

Thank you!

