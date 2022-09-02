part of 'crud_announcement_bloc.dart';

@immutable
abstract class CrudAnnouncementEvent extends BlocEvent {}

class GetDataCrudAnnouncement extends CrudAnnouncementEvent {
  final String startDate;
  final String endDate;

  GetDataCrudAnnouncement(this.startDate, this.endDate);
}

class GetAnnouncements extends CrudAnnouncementEvent {
  final BuildContext context;

  GetAnnouncements(this.context);
}

class GetDepartment extends CrudAnnouncementEvent {
  final BuildContext context;

  GetDepartment(this.context);
}

class CRUDAnnouncements extends CrudAnnouncementEvent {
  final BuildContext context;
  final TypeCrud typeCrud;
  final AnnouncementsData announcementData;
  
  CRUDAnnouncements(this.context,
      {required this.typeCrud, required this.announcementData});
}
