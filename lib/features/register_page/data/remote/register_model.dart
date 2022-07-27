class RegisterModel {
  RegisterModel({
    required this.userName,
    required this.userEmail,
    required this.password,
    required this.passwordConfirmation,
    required this.userPhone,
    this.userBirthday,
    this.userJoinAt,
    this.companyName,
    this.companyEmail,
    this.companyPhone,
    this.companyAddress,
    this.companyLocation,
    this.companyCity,
    this.companyCountry,
  });
  late String userName;
  late String userEmail;
  late String password;
  late String passwordConfirmation;
  late String userPhone;
  late String? userBirthday;
  late String? userJoinAt;
  late String? companyName;
  late String? companyEmail;
  late String? companyPhone;
  late String? companyAddress;
  late String? companyLocation;
  late String? companyCity;
  late String? companyCountry;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userEmail = json['user_email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    userPhone = json['user_phone'];
    userBirthday = json['user_birthday'];
    userJoinAt = json['user_join_at'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    companyAddress = null;
    companyLocation = null;
    companyCity = null;
    companyCountry = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_name'] = userName;
    _data['user_email'] = userEmail;
    _data['password'] = password;
    _data['password_confirmation'] = passwordConfirmation;
    _data['user_phone'] = userPhone;
    _data['user_birthday'] = userBirthday;
    _data['user_join_at'] = userJoinAt;
    _data['company_name'] = companyName;
    _data['company_email'] = companyEmail;
    _data['company_phone'] = companyPhone;
    _data['company_address'] = companyAddress;
    _data['company_location'] = companyLocation;
    _data['company_city'] = companyCity;
    _data['company_country'] = companyCountry;
    return _data;
  }
}
