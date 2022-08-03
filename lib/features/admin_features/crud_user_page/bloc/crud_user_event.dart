part of 'crud_user_bloc.dart';

@immutable
abstract class CrudUserEvent extends BlocEvent {}

class GetDataCrudUser extends CrudUserEvent {
  final BuildContext context;

  GetDataCrudUser(this.context);
}

class GetDepartmenPosition extends CrudUserEvent {
  final BuildContext context;

  GetDepartmenPosition(this.context);
}

class InitEvent extends CrudUserEvent {}

class RegisterUser extends CrudUserEvent {
  final BuildContext context;
  final DataUserRegister userInputModel;
  final bool isUpdate;

  RegisterUser(this.context, this.userInputModel, this.isUpdate);
}

class DeleteUser extends CrudUserEvent {
  final BuildContext context;
  final int idUser;

  DeleteUser(this.context, this.idUser);
}

class FilterUser extends CrudUserEvent {
  final String filter;
  final List<usr.DataUserRegister> dataUser;

  FilterUser(this.filter, this.dataUser);
}
