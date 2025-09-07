# Booking Table Partitioning & Performance Report

## Objective
Optimize queries on the `Booking` table, especially when filtering by `start_date`, using **range partitioning**. This ensures PostgreSQL scans only the relevant data instead of the entire table.

---

## Before Partitioning
- Queries scanned the **entire Booking table** when filtering by date.
- Sequential scans were slow and **did not scale well** with large datasets.
- Foreign key joins risked becoming slower as data volume increased.

---

## Partitioning Refactor
- The `Booking` table was split into yearly **partitions** (`Booking_2024`, `Booking_2025`).
- Queries now only scan the **relevant partition** based on the date.
- Each partition has its own primary key to maintain data integrity.
- Mock data was added for testing 2024 and 2025 bookings.

---

## Performance Tests
- Queries filtering for **2025 bookings** scanned only the `Booking_2025` partition.  
- Queries filtering for **2024 bookings** scanned only the `Booking_2024` partition.  
- Execution times were extremely fast (~0.03 ms).  
- **Partition pruning** ensured irrelevant partitions were skipped.

---

## Conclusion

| Aspect        | Before Partitioning              | After Partitioning                   |
| ------------- | -------------------------------- | ------------------------------------ |
| Table Scan    | Full table scan for date queries | Only relevant partition scanned      |
| Query Speed   | Slower on large datasets         | Extremely fast (~0.03 ms for tests)  |
| Scalability   | Poor for millions of bookings    | High, scales by partition            |
| Maintenance   | Single table, no segregation     | Easier to manage by year             |

### Key Takeaways
- **Range partitioning** drastically improves query speed by reducing I/O.  
- Partitions make it easier to manage large historical datasets.  
- Well-suited for use cases like bookings, where queries often filter by year or date range.
