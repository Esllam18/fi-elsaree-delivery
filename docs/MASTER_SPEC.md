# في السريع Delivery — Master Specification

This document is the project source of truth. Decisions, milestone status, architecture changes, and the next task are maintained here.

## Product identity
- Display name: في السريع
- Technical name: `fi_elsaree`
- Application ID: `com.felsaree.delivery`
- Platforms: Android + iOS, single Flutter codebase
- Languages: Arabic RTL and English LTR
- Theme: Navy Blue, Light + Dark
- Typography: Cairo (Arabic), Inter (Latin)

## Architecture
- Clean Architecture
- Feature-first modules
- Riverpod
- GoRouter
- Supabase MVP backend behind repositories
- Server authority for pricing, sensitive order transitions, and authorization
- RLS baseline, migrations, dev/prod separation
- Responsive compact UI; no oversized typography

## V1 domains
1. Restaurant / errand delivery
2. Parcel point-to-point
3. Passenger / motorcycle transport
4. School / nursery recurring transport
5. Saved addresses with optional GPS capture
6. Area-based pricing; embedded paid maps deferred
7. Customer mobile app, admin web dashboard, lightweight driver web flow

## School transport domain
Recurring booking with child, guardian, school/nursery, schedule, route, safety data, and audit history.

## Milestones
### M0 — Foundation
- [x] Repository created and connected
- [x] Product/technical identity fixed
- [x] Architecture baseline fixed
- [x] Navy Light/Dark direction fixed
- [ ] M0.1 Flutter native bootstrap (Android/iOS) + dev/prod flavors
- [ ] M0.2 Architecture skeleton: core, feature template, Riverpod, GoRouter, error model
- [ ] M0.3 Design system: tokens, typography, shared controls/states, RTL/LTR
- [ ] M0.4 Supabase environments: dev config, production strategy, migrations, RLS baseline

M0 Definition of Done: dev flavor launches, navigation works, localization toggles, shared UI states render, CI passes, and no secrets are committed.

### M1 — Identity + Address
Splash/session, Google auth, profile completion, first saved address, address CRUD, RLS tests.

### M2 — First Real Order
One selected service end-to-end: area pricing, review, create order, status history, success/active order.

### M3 — Admin Minimum
Admin authentication/roles, order queue/detail, driver assignment.

### M4 — Driver Minimum
Driver authentication, assigned jobs, valid status transitions, completion.

### M5 — E2E Gate
Customer → Admin → Driver → Delivered, including happy path, edge cases, logs, and audit.

### M6 — Remaining Services
Restaurant/errand, parcel, passenger/motorcycle completion.

### M7 — Schools/Nurseries
Recurring school transport workflows and safety/audit requirements.

### M8 — Production Readiness
Hardening, release configuration, monitoring, QA, store readiness.

## Engineering workflow
- `main` = stable review/run branch.
- Development is performed in controlled increments and only stable reviewable work lands on `main`.
- User review workflow target: one-click Update & Run on LDPlayer.
- Every completed task updates this file: checklist, decisions, changelog, and next task.

## Security rules
- Never commit service-role keys, signing secrets, passwords, or private credentials.
- Client receives only appropriate public configuration.
- Sensitive pricing/status/authorization logic is enforced server-side.
- RLS is required for exposed Supabase data.

## Decision log
- DEC-014: technical identity `fi_elsaree`, application ID `com.felsaree.delivery`.
- DEC-015: Navy Light/Dark visual direction selected.
- DEC-016: GitHub repository is the shared source of truth; `main` is stable review/run branch.
- DEC-017: Local user workflow will be one-click Git pull/update + Flutter run on LDPlayer.

## Changelog
### 2026-10-13
- Initialized GitHub source of truth.
- Recorded architecture, localization, responsiveness, security, domains, milestones, and review workflow.

## Next task
**M0.1 — Create/commit a valid Flutter SDK-generated native bootstrap for Android/iOS, then configure dev/prod flavors without fabricating generated native files.**
