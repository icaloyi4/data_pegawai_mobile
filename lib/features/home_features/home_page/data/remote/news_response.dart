class NewsResponse {
  bool? status;
  int? code;
  String? message;
  List<NewsData>? data;

  NewsResponse({this.status, this.code, this.message, this.data});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is bool) this.status = json["status"];
    if (json["code"] is int) this.code = json["code"];
    if (json["message"] is String) this.message = json["message"];
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => NewsData.fromJson(e)).toList();
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

class NewsData {
  int? id;
  int? companyId;
  String? title;
  String? subtitle;
  String? url;
  String? imgUrl;
  String? updateAt;
  String? updateBy;

  NewsData(
      {this.id,
      this.companyId,
      this.title,
      this.subtitle,
      this.url,
      this.imgUrl,this.updateAt,this.updateBy});

  NewsData.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["company_id"] is int) this.companyId = json["company_id"];
    if (json["title"] is String) this.title = json["title"];
    if (json["subtitle"] is String) this.subtitle = json["subtitle"];
    if (json["url"] is String) this.url = json["url"];
    if (json["img_url"] is String) this.imgUrl = json["img_url"];
    if (json["updated_at"] is String) this.updateAt = json["updated_at"];
    if (json["updated_by"] is String) this.updateBy = json["updated_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["company_id"] = this.companyId;
    data["title"] = this.title;
    data["subtitle"] = this.subtitle;
    data["url"] = this.url;
    data["img_url"] = this.imgUrl;
    data["updated_at"] = this.updateAt;
    data["updated_by"] = this.updateBy;
    return data;
  }
}
