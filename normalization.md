# Airbnb Database Normalization Report

## Objective
This report analyzes the Airbnb database schema for normalization, covering **First Normal Form (1NF)**, **Second Normal Form (2NF)**, and **Third Normal Form (3NF)**. The goal is to reduce redundancy, ensure data integrity, and design a scalable database.

---

## Step 1: First Normal Form (1NF)
- Each table must have atomic values, no repeating groups.
- **All tables** (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) store atomic values only. ✅  
- **Conclusion:** Schema satisfies **1NF**.

---

## Step 2: Second Normal Form (2NF)
- All non-key attributes must fully depend on the primary key.
- **User**: PK = `user_id`. All attributes depend on it. ✅  
- **Property**: PK = `property_id`. All attributes depend on it. ✅  
- **Booking**: PK = `booking_id`. All attributes depend on it. ✅  
- **Payment**: PK = `payment_id`. All attributes depend on it. ✅  
- **Review**: PK = `review_id`. All attributes depend on it. ✅  
- **Message**: PK = `message_id`. All attributes depend on it. ✅  
- **Conclusion:** Schema satisfies **2NF**.

---

## Step 3: Third Normal Form (3NF)
- No non-key attribute depends on another non-key attribute.
- **User, Property, Booking, Review, Message, Payment**: The schema exhibits no transitive dependencies, ensuring robust data integrity.
- **Design Consideration**: The structure avoids potential transitive dependencies, maintaining independence. ✅ 

- **Conclusion:** The database schema is fully normalized in **3NF**, designed to uphold data consistency and efficiency.
---

## Final Notes
- **1NF:** Atomic values in all columns.  
- **2NF:** Full dependency on primary keys.  
- **3NF:** No transitive dependencies.  

The Airbnb database schema ensures minimal redundancy, consistent data, and scalability for future expansion.
