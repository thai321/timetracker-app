# TimeTracker app

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- Post -> dta:data rationale:text
- User -> Devise
- AdminUser -> STI
- AuditLog

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Block non admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI:
- Bootstrap -> formatting

## TODOS:
- Add Full name for user
- Refactor user association integration test in post_spec
- Refactor posts/_form for admin user with status
- Integrate validation for phone attr in User:
  # No spaces or dashes
  # exactly 10 characters
  # all characters have to be a number
