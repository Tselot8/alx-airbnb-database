-- Before refactoring with filter
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.created_at AS user_created_at,
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.created_at AS property_created_at,
    p.pricepernight,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.total_price > 500;  -- Added WHERE clause

-- After refactoring with filter
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM Booking b
INNER JOIN Users u ON u.user_id = b.user_id
INNER JOIN Property p ON p.property_id = b.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.total_price > 500;  -- Added WHERE clause
