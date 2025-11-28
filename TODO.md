# core tech to be used

- [ ] Use Riverpod for state management
- [ ] Use Freezed for data classes and unions
- [x] Use GoRouter for routing
- [ ] use Hive for local storage
- [ ] Use Flutter Intl for internationalization (i18n?)
- [ ] Use Firebase for backend services (authentication, database, etc.)
- [ ] Sync with Firebase Firestore

## Suggested project structure

- [ ] Add dish feature
- - [ ] Add
- - [ ] Edit
- - [ ] Delete
- - [ ] View details
- - [ ] List all dishes
- - [ ] Add to Hive
- - [ ] Sync with Firebase Firestore
- - [ ] search sync tools when multiple editions, concurrency?

## Suggested project structure

```
lib/
├── main.dart
├── router.dart
├── models/          # Data models
├── providers/      # Riverpod providers
├──repositories/  # Hive
├── pages/          # Different screens/pages
├── widgets/       # Reusable widgets

```
