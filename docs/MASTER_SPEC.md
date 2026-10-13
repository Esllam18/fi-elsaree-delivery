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

## Architecture baseline
- Clean Architecture + feature-first modules
- Riverpod composition root
- Central GoRouter
- Generated ARB localization, Arabic RTL + English LTR
- Responsive breakpoint layer
- Shared Result/Failure model
- Environment abstraction with compile-time dart-defines
- Supabase isolated at bootstrap/data boundaries; no secrets committed
- Compact semantic design tokens; no random per-screen values

## V1 domains
1. Restaurant / errand delivery
2. Parcel point-to-point
3. Passenger / motorcycle transport
4. School / nursery recurring transport
5. Saved addresses with optional GPS capture
6. Area-based pricing; embedded paid maps deferred
7. Customer mobile app, admin web dashboard, lightweight driver web flow

## Milestones
### M0 — Foundation
- [x] Repository created and connected
- [x] Product/technical identity fixed
- [x] Architecture baseline fixed
- [x] Navy Light/Dark direction fixed
- [ ] M0.1 Flutter native bootstrap (Android/iOS) + dev/prod flavors — blocked until Flutter SDK-generated platform files are created; do not fabricate them
- [x] M0.2 Source architecture foundation — bootstrap boundary, Riverpod, GoRouter, error/result, responsive layer, environment config, localization config
- [~] M0.3 Design system — semantic colors, spacing, radius, duration and Light/Dark ThemeData created; reusable premium controls/states still next
- [~] M0.4 Supabase — safe compile-time configuration boundary created; actual projects/migrations/RLS still pending

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
- Keep files small and single-purpose; split components before files become catch-all modules.
- UI never talks directly to Supabase.
- User-facing strings are localized; no hard-coded production copy in widgets.
- User review workflow target: one-click Update & Run on LDPlayer.
- Every completed task updates this file.

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
- DEC-018: Flutter platform folders must be SDK-generated, never hand-fabricated.
- DEC-019: environment values use dart-defines; secrets stay outside Git.

## Changelog
### 2026-10-13
- Initialized GitHub source of truth.
- Added Flutter dependency manifest and strict analysis rules.
- Added app bootstrap and Riverpod root.
- Added centralized GoRouter foundation.
- Added ARB localization configuration and Arabic/English baseline strings.
- Added responsive breakpoint/helper layer.
- Added Result/Failure foundation.
- Added environment/Supabase initialization boundary.
- Added semantic design tokens and Light/Dark themes.
- Added empty Splash feature shell only; visual Splash implementation intentionally not started yet.

## Next task
**M0.3b — Build reusable premium UI primitives and unified states (buttons, text fields, search, cards, loading/skeleton, empty, error, offline, warning, success, permission), then review the visual system before implementing the Splash UI.**
