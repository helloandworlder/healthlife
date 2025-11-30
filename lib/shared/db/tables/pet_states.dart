import 'package:drift/drift.dart';

@DataClassName('PetState')
class PetStates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant('TATA'))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get exp => integer().withDefault(const Constant(0))();
  IntColumn get companionDays => integer().withDefault(const Constant(0))();
  TextColumn get currentSkin => text().withDefault(const Constant('default'))();
  DateTimeColumn get lastActiveDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
