module RailwayReservationSystem

sig Passenger {}
sig Train { capacity: one Int }
sig Seat { belongsTo: one Train }
sig Booking { passenger: one Passenger, seat: one Seat }
sig Ticket { booking: one Booking }

abstract sig Status {}
one sig Available, Reserved, Confirmed, Cancelled, WaitingList extends Status {}

sig SeatState { seat: one Seat, status: one Status }

-- Each seat has exactly one status
fact OneStatusPerSeat {
  all s: Seat | one ss: SeatState | ss.seat = s
}

-- Ticket must correspond to exactly one booking
fact TicketUniqueness {
  all t1, t2: Ticket | t1 != t2 => t1.booking != t2.booking
}

-- No double booking
fact NoDoubleBooking {
  all b1, b2: Booking |
    b1 != b2 =>
    not (b1.seat = b2.seat
         and (seatStatus[b1.seat] = Confirmed
         or  seatStatus[b1.seat] = Reserved))
}

-- Helper function
fun seatStatus[s: Seat]: Status {
  {st: Status | some ss: SeatState | ss.seat = s and ss.status = st}
}

-- Ticket only exists if booking seat is Confirmed
fact TicketRequiresConfirmedBooking {
  all t: Ticket | seatStatus[t.booking.seat] = Confirmed
}

-- Confirmed seats must not exceed capacity
fact CapacityConstraint {
  all tr: Train |
    #{b: Booking | b.seat.belongsTo = tr and seatStatus[b.seat] = Confirmed}
    <= tr.capacity
}

-- ASSERTION 1: One seat cannot have two confirmed passengers
assert NoTwoPassengersOneSeat {
  no b1, b2: Booking |
    b1 != b2 and b1.seat = b2.seat
    and seatStatus[b1.seat] = Confirmed
}

-- ASSERTION 2: Every ticket belongs to confirmed booking
assert TicketsAreValid {
  all t: Ticket | seatStatus[t.booking.seat] = Confirmed
}

-- ASSERTION 3: Cancelled seats have no active ticket
assert CancelledSeatHasNoTicket {
  no t: Ticket | seatStatus[t.booking.seat] = Cancelled
}

-- ASSERTION 4: Available seats have no confirmed booking
assert AvailableSeatHasNoConfirmedBooking {
  no b: Booking | seatStatus[b.seat] = Available
}

check NoTwoPassengersOneSeat for 5
check TicketsAreValid for 5
check CancelledSeatHasNoTicket for 5
check AvailableSeatHasNoConfirmedBooking for 5

pred show {}
run show for 4 Passenger, 2 Train, 6 Seat, 4 Booking, 2 Ticket
