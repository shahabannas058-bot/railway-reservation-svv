# GitHub Issues Log
## Railway Reservation System — SVV Project

## Issue #1 — FR-3.1: Ambiguous train search requirement
- **Type:** Requirement Defect
- **Label:** ambiguity
- **Status:** Closed
- **Description:** Original requirement uses 'should' which is not mandatory. Search criteria not specified.
- **Resolution:** Updated to use SHALL with explicit parameters (source, destination, date)

## Issue #2 — FR-6.3: Non-verifiable payment timeout
- **Type:** Requirement Defect
- **Label:** non-verifiable
- **Status:** Closed
- **Description:** 'Payment should be done quickly' has no measurable criterion.
- **Resolution:** Timeout set to exactly 15 minutes as testable acceptance criterion.

## Issue #3 — FR-8.4 vs FR-10.3: Inconsistency in cancellation policy
- **Type:** Requirement Defect
- **Label:** inconsistency
- **Status:** Closed
- **Description:** FR-8.4 prohibits re-confirming cancelled bookings but FR-10.3 allows admin override.
- **Resolution:** Admin override permitted with mandatory audit log entry.

## Issue #4 — FR-4.1: Ambiguous seat availability display
- **Type:** Requirement Defect
- **Label:** ambiguity
- **Status:** Closed
- **Description:** Does not specify which class or date context to display seats for.
- **Resolution:** Display available seats per class for selected train and date.

## Issue #5 — NFR-3.1: Non-verifiable performance requirement
- **Type:** Requirement Defect
- **Label:** non-verifiable
- **Status:** Closed
- **Description:** 'System shall be fast' provides no numeric target.
- **Resolution:** Search results within 2 seconds for up to 1000 concurrent users.
