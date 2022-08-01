part of 'company_bloc.dart';

@immutable
abstract class CompanyState extends BlocState {}

class LoadingState extends CompanyState {}

// class SuccessGetDataUser extends UserState {
//   final usr.UserData user;
//   final List<OvertimeData> overtime;

//   SuccessGetDataUser(this.user, this.overtime);
// }
