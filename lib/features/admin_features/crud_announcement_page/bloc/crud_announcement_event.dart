part of 'crud_announcement_bloc.dart';

@immutable
abstract class CrudAnnouncementEvent extends BlocEvent {}

class GetDataCrudAnnouncement extends CrudAnnouncementEvent {
  final String startDate;
  final String endDate;

  GetDataCrudAnnouncement(this.startDate, this.endDate);
}

class Logout extends CrudAnnouncementEvent {}
