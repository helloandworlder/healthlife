import 'package:drift/drift.dart';
import 'goals.dart';

@DataClassName('GoalLog')
@TableIndex(name: 'idx_goal_logs_date', columns: {#date})
@TableIndex(name: 'idx_goal_logs_goal_date', columns: {#goalId, #date})
class GoalLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get goalId => integer().references(Goals, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  IntColumn get progress => integer().withDefault(const Constant(0))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {goalId, date}
      ];
}
