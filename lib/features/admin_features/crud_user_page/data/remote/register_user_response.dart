
class RegisterUserResponse {
  bool? status;
  int? code;
  String? message;
  DataRegisterUser? data;

  RegisterUserResponse({this.status, this.code, this.message, this.data});

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool)
      this.status = json["status"];
    if(json["code"] is int)
      this.code = json["code"];
    if(json["message"] is String)
      this.message = json["message"];
    if(json["data"] is Map)
      this.data = json["data"] == null ? null : DataRegisterUser.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["code"] = this.code;
    data["message"] = this.message;
    if(this.data != null)
      data["data"] = this.data?.toJson();
    return data;
  }
}

class DataRegisterUser {
  String? password;
  DataRegisterUser1? data;

  DataRegisterUser({this.password, this.data});

  DataRegisterUser.fromJson(Map<String, dynamic> json) {
    if(json["password"] is String)
      this.password = json["password"];
    if(json["data"] is Map)
      this.data = json["data"] == null ? null : DataRegisterUser1.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["password"] = this.password;
    if(this.data != null)
      data["data"] = this.data?.toJson();
    return data;
  }
}

class DataRegisterUser1 {
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
  int? nik;

  DataRegisterUser1({this.id, this.name, this.email, this.address, this.phone, this.birthday, this.joinAt, this.companyId, this.departmentId, this.positionId, this.roleId, this.emailVerifiedAt, this.isActive, this.createdAt, this.updatedAt, this.createdBy, this.updatedBy, this.nik});

  DataRegisterUser1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["email"] is String)
      this.email = json["email"];
    this.address = json["address"];
    if(json["phone"] is String)
      this.phone = json["phone"];
    this.birthday = json["birthday"];
    this.joinAt = json["join_at"];
    if(json["company_id"] is int)
      this.companyId = json["company_id"];
    if(json["department_id"] is int)
      this.departmentId = json["department_id"];
    if(json["position_id"] is int)
      this.positionId = json["position_id"];
    if(json["role_id"] is int)
      this.roleId = json["role_id"];
    this.emailVerifiedAt = json["email_verified_at"];
    if(json["isActive"] is int)
      this.isActive = json["isActive"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["created_by"] is String)
      this.createdBy = json["created_by"];
    if(json["updated_by"] is String)
      this.updatedBy = json["updated_by"];
    if(json["NIK"] is int)
      this.nik = json["NIK"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["address"] = this.address;
    data["phone"] = this.phone;
    data["birthday"] = this.birthday;
    data["join_at"] = this.joinAt;
    data["company_id"] = this.companyId;
    data["department_id"] = this.departmentId;
    data["position_id"] = this.positionId;
    data["role_id"] = this.roleId;
    data["email_verified_at"] = this.emailVerifiedAt;
    data["isActive"] = this.isActive;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["created_by"] = this.createdBy;
    data["updated_by"] = this.updatedBy;
    data["NIK"] = this.nik;
    return data;
  }
}