part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends BlocEvent {}

class SignUp extends RegisterEvent {
  final RegisterModel registerModel;
  final BuildContext context;

  SignUp(this.registerModel, this.context);
}


