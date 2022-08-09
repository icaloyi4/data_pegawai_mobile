class RegisterResponse {
  bool? status;
  int? code;
  String? message;
  DataUser? data;

  RegisterResponse({this.status, this.code, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new DataUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class DataUser {
  String? token;
  User? user;
  Company? company;
  Department? department;
  Position? position;

  DataUser(
      {this.token, this.user, this.company, this.department, this.position});

  DataUser.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company?.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department?.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position?.toJson();
    }
    return data;
  }
}

class User {
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
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  String? nIK;

  User(
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
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.nIK});

  User.fromJson(Map<String, dynamic> json) {
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
    isActive = json['isActive'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    nIK = json['NIK'].toString();
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
    data['isActive'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['NIK'] = this.nIK;
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? phone;
  String? address;
  String? location;
  String? city;
  String? country;
  String? email;
  int? isActive;

  Company(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.location,
      this.city,
      this.country,
      this.email,
      this.isActive});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    location = json['location'];
    city = json['city'];
    country = json['country'];
    email = json['email'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['location'] = this.location;
    data['city'] = this.city;
    data['country'] = this.country;
    data['email'] = this.email;
    data['isActive'] = this.isActive;
    return data;
  }
}

class Department {
  int? id;
  int? companyId;
  String? name;

  Department({this.id, this.companyId, this.name});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['name'] = this.name;
    return data;
  }
}

class Position {
  int? id;
  int? departmentId;
  String? name;
  int? level;

  Position({this.id, this.departmentId, this.name, this.level});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['department_id'] = this.departmentId;
    data['name'] = this.name;
    data['level'] = this.level;
    return data;
  }
}
