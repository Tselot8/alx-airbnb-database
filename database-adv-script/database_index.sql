-- Create Indexes
CREATE INDEX idx_user_email ON Users(email);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);
CREATE INDEX idx_booking_total_price ON Booking(total_price);

-- Measure query performance using EXPLAIN ANALYZE

-- Users table: lookup by email
EXPLAIN ANALYZE
SELECT *
FROM Users
WHERE email = 'alice@example.com';

-- Property table: filter by location
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'New York';

-- Booking table: composite lookup by user_id + property_id
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 'u1' AND property_id = 'p1';

-- Booking table: filter by total_price
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE total_price > 500;
