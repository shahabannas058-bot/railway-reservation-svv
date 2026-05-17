# Validation Checklist
## Railway Reservation System — SVV Project

| # | Validation Item | Derived From | Status | Notes |
|---|----------------|--------------|--------|-------|
| V-01 | Passenger cannot book without registration | FR-1.4, FR-5.1 | PASS | Verified in Z pre-condition |
| V-02 | Available seat becomes Reserved on booking | FR-5.3 | PASS | Z post-condition verified |
| V-03 | Reserved seat becomes Confirmed on payment | FR-6.2 | PASS | VDM post-condition verified |
| V-04 | Confirmed booking produces exactly one ticket | FR-7.3 | PASS | Alloy assertion holds |
| V-05 | One seat cannot have two confirmed bookings | NFR-4.1 | PASS | Alloy assertion holds |
| V-06 | Cancelled booking releases seat | FR-8.2 | PASS | Z post-condition verified |
| V-07 | Cancelled ticket removed from ticket store | Alloy Counterexample | FIXED | Counterexample found and resolved |
| V-08 | Payment timeout releases Reserved seat | FR-6.3 | PASS | Modeled as conditional transition |
| V-09 | Admin can view all bookings | FR-10.2 | PASS | SRS requirement verified |
| V-10 | Total confirmed seats never exceed capacity | NFR-4.2 | PASS | Alloy fact enforced |

## Final Summary
- Total Validation Items: 10
- Passed: 9
- Fixed: 1
- Failed: 0
- Overall Result: VALIDATED
