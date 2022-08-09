part of 'crud_company_bloc.dart';

@immutable
abstract class CrudCompanyEvent extends BlocEvent {}

class UpdateCompany extends CrudCompanyEvent {
  final BuildContext context;
  final Company? company;

  UpdateCompany(this.context, this.company);
}

class Logout extends CrudCompanyEvent {}
