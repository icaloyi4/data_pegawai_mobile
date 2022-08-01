part of 'company_bloc.dart';

@immutable
abstract class CompanyEvent extends BlocEvent {}

class GetDataCompany extends CompanyEvent {
  final String startDate;
  final String endDate;

  GetDataCompany(this.startDate, this.endDate);
}

class Logout extends CompanyEvent {}
