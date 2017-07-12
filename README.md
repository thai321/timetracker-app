# TimeTracker app

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- Post -> dta:data rationale:text
- User -> Devise
- AdminUser -> STI
- AuditLog

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input -> intrgrate with Heroku scheduler
- Administrate admin dashboard
- Block non admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime
- Need to update end_date when confirmed
- Need to update audit log status when an overtime rejected
- Update buttons on employee homepage so they show on mobile
- Update buttons to include time span
- Update button sort order on employee homepage
- Update unnecessary nav bar buttons on homepage
- Implement Honeybadger error reporting
- Implement new relic for keeping site alive


## UI:
- Bootstrap -> formatting

## TODOS:
- Add Full name for user
- Refactor user association integration test in post_spec
- Refactor posts/_ form for admin user with status
- Integrate validation for phone attr in User:
  - No spaces or dashes
  - exactly 10 characters
  - all characters have to be a number


ALL DONE
