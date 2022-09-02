class AnnouncementResponse {
  bool? status;
  int? code;
  String? message;
  List<AnnouncementsData>? data;

  AnnouncementResponse({this.status, this.code, this.message, this.data});

  AnnouncementResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is bool) this.status = json["status"];
    if (json["code"] is int) this.code = json["code"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => AnnouncementsData.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["code"] = this.code;
    data["message"] = this.message;
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    return data;
  }
}

class AnnouncementsData {
  int? id;
  int? companyId;
  int? departmentId;
  String? title;
  String? subtitle;
  String? url;
  String? imgUrl;
  String? expiredAt;

  AnnouncementsData(
      {this.id,
      this.companyId,
      this.departmentId,
      this.title,
      this.subtitle,
      this.url,
      this.imgUrl,
      this.expiredAt});

  AnnouncementsData.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["company_id"] is int) this.companyId = json["company_id"];
    this.departmentId = json["department_id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["subtitle"] is String) this.subtitle = json["subtitle"];
    this.url = json["url"];
    this.imgUrl = json["img_url"];
    if (json["expired_at"] is String) this.expiredAt = json["expired_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["company_id"] = this.companyId;
    data["department_id"] = this.departmentId;
    data["title"] = this.title;
    data["subtitle"] = this.subtitle;
    data["url"] = this.url;
    data["img_url"] = this.imgUrl;
    data["expired_at"] = this.expiredAt;
    return data;
  }
}
