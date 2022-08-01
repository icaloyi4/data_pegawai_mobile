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
