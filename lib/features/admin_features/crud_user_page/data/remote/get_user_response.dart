class GetUserResponse {
  GetUserResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final int code;
  late final String message;
  late final List<DataUserRegister> data;

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = List.from(json['data'])
        .map((e) => DataUserRegister.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataUserRegister {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? birthday;
  String? joinAt;
  int? companyId;
  int? departmentId;
  int? positionId;
  int? roleId;
  String? emailVerifiedAt;
  String? nIK;
  String? department;
  String? position;
  int? level;

  String? password;

  DataUserRegister(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.birthday,
      this.joinAt,
      this.companyId,
      this.departmentId,
      this.positionId,
      this.roleId,
      this.emailVerifiedAt,
      this.nIK,
      this.department,
      this.position,
      this.level,
      this.password});

  DataUserRegister.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    birthday = json['birthday'];
    joinAt = json['join_at'];
    companyId = json['company_id'];
    departmentId = json['department_id'];
    positionId = json['position_id'];
    roleId = json['role_id'];
    emailVerifiedAt = json['email_verified_at'];
    nIK = json['NIK'];
    department = json['department'];
    position = json['position'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['join_at'] = this.joinAt;
    data['company_id'] = this.companyId;
    data['department_id'] = this.departmentId;
    data['position_id'] = this.positionId;
    data['role_id'] = this.roleId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['NIK'] = this.nIK;
    data['department'] = this.department;
    data['position'] = this.position;
    if(this.password!=null)data['level'] = this.level;
    if(this.password!=null)data['password'] = this.password;
    return data;
  }
}
