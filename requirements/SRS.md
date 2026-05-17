# Software Requirements Specification (SRS)
## Railway Reservation System — SVV Project

## 1. System Purpose
A Railway Reservation System (RRS) automates booking, managing, and cancelling train tickets.

## 2. Functional Requirements

### FR-1: Passenger Registration
- FR-1.1: System shall allow registration using unique email and password
- FR-1.2: System shall validate email is not already registered
- FR-1.3: System shall store Name, CNIC, email, phone number
- FR-1.4: System shall assign unique Passenger ID on registration

### FR-2: Authentication
- FR-2.1: System shall authenticate via email and password
- FR-2.2: System shall maintain session for authenticated users
- FR-2.3: System shall deny invalid credentials

### FR-3: Train Search
- FR-3.1: System SHALL search trains by source, destination, and date
- FR-3.2: System shall display matching trains with ID, name, timings

### FR-4: Seat Booking
- FR-4.1: Authenticated passenger shall select and book a seat
- FR-4.2: System shall assign unique Booking ID
- FR-4.3: Seat status shall change from Available to Reserved

### FR-5: Payment & Confirmation
- FR-5.1: System shall request payment after reservation
- FR-5.2: Booking status changes from Reserved to Confirmed on payment
- FR-5.3: If payment not completed within 15 minutes, seat released

### FR-6: Ticket Generation
- FR-6.1: System shall generate unique digital ticket on confirmation
- FR-6.2: Each confirmed booking corresponds to exactly one ticket

### FR-7: Cancellation
- FR-7.1: Authenticated passenger shall cancel confirmed booking
- FR-7.2: Cancelled seat released back to Available
- FR-7.3: Cancelled booking cannot be re-confirmed

## 3. Non-Functional Requirements
- NFR-1: Passwords stored using bcrypt hash
- NFR-2: System uptime 99.5% during peak hours
- NFR-3: Search results within 2 seconds for 1000 concurrent users
- NFR-4: Same seat cannot be Available and Reserved simultaneously
- NFR-5: System available 24/7
