# Booking Query Refactoring

## Overview
This project refactors an SQL query that retrieves booking information along with associated user, property, and payment details.  
The original query suffered from **performance bottlenecks** due to wide column selection, sequential scans, and inefficient joins.  
The refactored version focuses on **scalability, maintainability, and performance optimization**.

---

## Purpose
The purpose of the refactoring was to:
- Improve query execution time on larger datasets.
- Reduce memory and CPU usage caused by nested hash joins.
- Select only the necessary columns for downstream use.
- Ensure the query structure is clean, readable, and efficient.

---

## What the Code Does
1. **Original Query**  
   - Selected almost every column from all tables (`Booking`, `Users`, `Property`, `Payment`).  
   - Relied on sequential scans and multiple nested hash joins.  
   - Returned more data than needed.

2. **Refactored Query**  
   - Retrieves **essential booking details** (dates, total price, status).  
   - Joins only the necessary user and property fields.  
   - Uses a **LEFT JOIN** for payments since they are optional.  
   - Introduces indexes to improve query plans on large datasets.  

---

## Observations
- On **small datasets**, there is no noticeable difference in performance since sequential scans and hash joins are already fast.  
- On **large datasets**, the following improvements are observed:
  - **Index scans** replace sequential scans, lowering I/O cost.  
  - **Smaller select lists** reduce memory usage during joins.  
  - **Simplified join logic** avoids unnecessary nested hash joins.  
- Overall, the query is now **optimized for scale** while remaining clear and maintainable.

---

## Key Takeaway
The refactoring ensures that as the database grows, query performance remains efficient by focusing on:
- **Column selectivity**  
- **Join efficiency**  
- **Index utilization**
