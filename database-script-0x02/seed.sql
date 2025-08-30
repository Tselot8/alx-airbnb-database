-- Users
INSERT into Users(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('u1', 'Alice', 'Johnson', 'alice@example.com', 'hash_pw1', '1234567890', 'guest', NOW()),
    ('u2', 'Bob', 'Smith', 'bob@example.com', 'hash_pw2', '0987654321', 'host', NOW()),
    ('u3', 'Charlie', 'Brown', 'charlie@example.com', 'hash_pw3', NULL, 'guest', NOW()),
    ('u4', 'Diana', 'Miller', 'diana@example.com', 'hash_pw4', '5551234567', 'host', NOW()),
    ('u5', 'Ethan', 'Wong', 'ethan@example.com', 'hash_pw5', NULL, 'admin', NOW());

-- Properties
INSERT into Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('p1', 'u2', 'Cozy Apartment in Downtown', 'Modern 1-bedroom apartment near city center.', 'New York', 120.00, NOW(), NOW()),
    ('p2', 'u2', 'Beach House Retreat', 'Beautiful beach house with ocean view.', 'Miami', 250.00, NOW(), NOW()),
    ('p3', 'u4', 'Mountain Cabin', 'Rustic cabin surrounded by nature trails.', 'Denver', 150.00, NOW(), NOW()),
    ('p4', 'u4', 'City Loft', 'Spacious loft in the heart of the city.', 'Chicago', 200.00, NOW(), NOW()),
    ('p5', 'u2', 'Suburban Home', 'Comfortable home in a quiet neighborhood.', 'San Francisco', 180.00, NOW(), NOW());

-- Bookings
INSERT into Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('b1', 'p1', 'u1', '2025-09-10', '2025-09-15', 600.00, 'confirmed', NOW()),
    ('b2', 'p2', 'u3', '2025-10-01', '2025-10-05', 1000.00, 'pending', NOW()),
    ('b3', 'p3', 'u1', '2025-11-20', '2025-11-22', 300.00, 'canceled', NOW());

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('pay1', 'b1', 600.00, NOW(), 'credit_card'),
    ('pay2', 'b2', 1000.00, NOW(), 'paypal'),
    ('pay3', 'b3', 300.00, NOW(), 'stripe');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('r1', 'p1', 'u1', 5, 'Fantastic stay! Clean and comfortable apartment.', NOW()),
    ('r2', 'p3', 'u1', 3, 'Nice cabin but a bit cold at night.', NOW()),
    ('r3', 'p2', 'u3', 4, 'Great location and beautiful views!', NOW());

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('m1', 'u1', 'u2', 'Hi Bob, is the apartment available for early check-in?', NOW()),
    ('m2', 'u2', 'u1', 'Hi Alice, yes early check-in is possible at 11am.', NOW()),
    ('m3', 'u3', 'u2', 'Hello, can I bring pets to the beach house?', NOW()),
    ('m4', 'u2', 'u3', 'Hi Charlie, unfortunately pets are not allowed.', NOW());