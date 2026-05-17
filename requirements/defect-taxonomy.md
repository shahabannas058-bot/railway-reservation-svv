# Requirement Defect Taxonomy
## Railway Reservation System

| Req ID | Original Requirement | Defect Type | Reason | Corrected Version |
|--------|---------------------|-------------|--------|-------------------|
| FR-3.1 | The system should search trains | Ambiguity | 'Should' is not mandatory; criteria unspecified | System SHALL search trains by source, destination, and date |
| FR-6.3 | Payment should be done quickly | Non-Verifiable | 'Quickly' has no measurable definition | If payment not completed within 15 minutes, booking shall expire |
| FR-4.1 | Show available seats | Ambiguity | Does not specify class or date context | Display available seats per class for selected train and date |
| FR-8.4 | Cancelled booking cannot be confirmed later | Inconsistency | FR-10.3 allows admin override — contradiction | Cancelled booking cannot be re-confirmed except by admin with audit log |
| NFR-3.1 | The system shall be fast | Non-Verifiable | No numeric target specified | Search results returned within 2 seconds for 1000 concurrent users |
| FR-9.3 | Give seat to waiting passenger | Ambiguity | Which passenger? By what rule? | Released seat offered to earliest Waiting List passenger by timestamp |
