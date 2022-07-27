part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends BlocEvent {}

class Logout extends UserEvent {
  final BuildContext context;

  Logout(this.context);
}
