# Database Indexing Report

## Overview
This project focused on improving query performance across the **Users**, **Property**, and **Booking** tables using targeted indexing.  
Performance was measured and validated using `EXPLAIN ANALYZE`.

---

## Purpose
- Speed up lookups and filtering on frequently queried columns.  
- Optimize query plans for joins, filtering, and sorting.  
- Ensure indexes are applied selectively to avoid overhead.  

---

Queries:
-- Measure Users by email
EXPLAIN ANALYZE
SELECT *
FROM Users
WHERE email = 'alice@example.com';

-- Measure Property by location
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'New York';

-- Measure Booking by user_id + property_id
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 'u1' AND property_id = 'p1';

-- Measure Booking by total_price
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE total_price > 500;

---

## What the Code Does
1. **Users Table**
   - Index: `idx_user_email`  
   - Purpose: Speeds up lookups by email (e.g., login queries).  
   - Note: Already indexed during table creation.  

2. **Property Table**
   - Index: `idx_property_location`  
   - Purpose: Improves filtering by location (city/area).  
   - Note: Already indexed during table creation.  

3. **Booking Table**
   - Index: `idx_booking_user_property` → Optimizes lookups using `user_id` + `property_id`.  
   - Index: `idx_booking_total_price` → Optimizes range queries and sorting on `total_price`.  

---

## Observations
- **Users by Email** → Index scan was used, query very fast (~0.111 ms).  
- **Property by Location** → Index scan effective, query fast (~0.122 ms).  
- **Booking by User + Property** → Composite index reduced execution time significantly.  
- **Booking by Total Price** → Minor improvement observed; index benefits will scale with larger datasets.  

---

## Conclusion
- Indexes provided **noticeable performance improvements** on selective queries.  
- Pre-existing indexes on `Users.email` and `Property.location` were already highly effective.  
- New Booking indexes optimized lookups and reduced execution times.  
- Care was taken to **avoid over-indexing**, ensuring the database remains efficient and scalable.  
