# schemas.sql

## Objective
This SQL file defines the structure of the Airbnb database by creating tables for testing and development purposes. It establishes the schema for key tables including Users, Properties, Bookings, Payments, Reviews, and Messages, ensuring a solid foundation for data storage and relationships.

## Notes
- The table definitions reflect real-world data requirements, incorporating multiple fields and constraints to simulate operational scenarios.
- Foreign key relationships and indexes are implemented to maintain data consistency and optimize query performance.

## Usage
- Ensure the database is set up and accessible before execution.
- Run this SQL file to create the necessary table structures, using a command such as:
  ```sql
  -- Example usage:
  -- mysql> source path/to/schemas.sql;