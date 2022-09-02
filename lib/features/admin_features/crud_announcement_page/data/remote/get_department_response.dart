
class GetDepartmentResponse {
  bool? status;
  int? code;
  String? message;
  List<DepartmentData>? data;

  GetDepartmentResponse({this.status, this.code, this.message, this.data});

  GetDepartmentResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool)
      this.status = json["status"];
    if(json["code"] is int)
      this.code = json["code"];
    if(json["message"] is String)
      this.message = json["message"];
    if(json["data"] is List)
      this.data = json["data"]==null ? null : (json["data"] as List).map((e)=>DepartmentData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["code"] = this.code;
    data["message"] = this.message;
    if(this.data != null)
      data["data"] = this.data?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class DepartmentData {
  int? id;
  int? companyId;
  String? name;

  DepartmentData({this.id, this.companyId, this.name});

  DepartmentData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["company_id"] is int)
      this.companyId = json["company_id"];
    if(json["name"] is String)
      this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["company_id"] = this.companyId;
    data["name"] = this.name;
    return data;
  }
}