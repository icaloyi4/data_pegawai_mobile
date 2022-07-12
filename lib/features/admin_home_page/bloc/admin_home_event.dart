part of 'admin_home_bloc.dart';

@immutable
abstract class AdminHomeEvent extends BlocEvent {}

class GetDataAdminHome extends AdminHomeEvent {
  final String startDate;
  final String endDate;

  GetDataAdminHome(this.startDate, this.endDate);
}

class Logout extends AdminHomeEvent {}
