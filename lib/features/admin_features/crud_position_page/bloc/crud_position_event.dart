part of 'crud_position_bloc.dart';

@immutable
abstract class CrudPositionEvent extends BlocEvent {}

class GetDataCrudPosition extends CrudPositionEvent {
  final String startDate;
  final String endDate;

  GetDataCrudPosition(this.startDate, this.endDate);
}

class Logout extends CrudPositionEvent {}
