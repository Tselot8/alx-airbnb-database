-- Create a partitioned booking table based on start_date
CREATE TABLE Booking_Partitioned (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending','confirmed','canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
) PARTITION BY RANGE (start_date);

-- Partition of Booking_Partitioned of bookings made in 2024
CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
ALTER TABLE Booking_2024
ADD PRIMARY KEY(booking_id, start_date);

-- Partition of Booking_Partitioned of bookings made in 2025
CREATE TABLE Booking_2025 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
ALTER TABLE Booking_2025
ADD PRIMARY KEY(booking_id, start_date);

--Inserting sample data into the Booking_Partitioned table
