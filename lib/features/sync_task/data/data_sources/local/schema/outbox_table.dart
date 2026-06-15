import 'package:drift/drift.dart';

class OutboxTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get url => text()();
  TextColumn get method => text()();
  TextColumn get actionType => text()();
  TextColumn get payload => text()();
  
  // 💡 ဒီ Column နာမည် Drift ထဲမှာ တိတိကျကျ ရှိနေဖို့ လိုပါတယ်
  TextColumn get clientReferenceId => text().nullable()(); 
  
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}