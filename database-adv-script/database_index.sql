CREATE INDEX idx_user_email ON User(email);

CREATE INDEX idx_property_location ON Property(location);

CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);
CREATE INDEX idx_booking_total_price ON Booking(total_price);