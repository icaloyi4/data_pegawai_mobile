part of 'crud_position_bloc.dart';

@immutable
abstract class CrudPositionState extends BlocState {}

class LoadingState extends CrudPositionState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
