# Counterexample Analysis Report
## Railway Reservation System — Alloy Verification

## Counterexample Found: CancelledSeatHasNoTicket

### Scenario
Alloy Analyzer found an instance where:
- Ticket T1 references Booking B1
- Booking B1's seat S1 has status = Cancelled
- This means a ticket exists for a cancelled booking

### Root Cause
The CancelTicket operation only changes seatStatus to Cancelled.
It does NOT remove the Ticket record associated with the booking.

### Corrected Z Post-Condition
CancelTicket Post-Conditions FIXED:
  seatStatus' = seatStatus + {booked(b?) -> Cancelled}
  tickets'    = {t : dom tickets | tickets(t) != b?}
  Ticket is now explicitly removed on cancellation.

## Assertions Verified

| Assertion | Result | Notes |
|-----------|--------|-------|
| NoTwoPassengersOneSeat | HOLDS | No double booking possible |
| TicketsAreValid | HOLDS | All tickets linked to confirmed bookings |
| CancelledSeatHasNoTicket | FIXED | Counterexample found and resolved |
| AvailableSeatHasNoConfirmedBooking | HOLDS | Available seats have no bookings |

## Conclusion
- 4 assertions checked
- 1 counterexample found and resolved
- All invariants hold after fix
