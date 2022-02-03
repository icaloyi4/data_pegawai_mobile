import 'package:moor_flutter/moor_flutter.dart';

class NotifEntities extends Table {
  TextColumn get id => text()();
  TextColumn get id_content => text()();
  TextColumn get id_user => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get route => text()();
  DateTimeColumn get created_at =>
      dateTime().withDefault(Constant(DateTime.now()))();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
}
