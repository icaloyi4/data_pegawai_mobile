
class GetAttendanceResponse {
  bool? status;
  int? code;
  String? message;
  late List<AttendanceData> data;

  GetAttendanceResponse({this.status, this.code, this.message, required this.data});

  GetAttendanceResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool)
      this.status = json["status"];
    if(json["code"] is int)
      this.code = json["code"];
    if(json["message"] is String)
      this.message = json["message"];
    if(json["data"] is List)
      this.data = json["data"]==null ? [] : (json["data"] as List).map((e)=>AttendanceData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["code"] = this.code;
    data["message"] = this.message;
    if(this.data != null)
      data["data"] = this.data.map((e)=>e.toJson()).toList();
    return data;
  }
}

class AttendanceData {
  int? id;
  int? userId;
  String? checkIn;
  String? checkOut;
  String? locationCheckIn;
  String? notes;
  String? imagePathCheckIn;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  String? photoNamesCheckIn;
  String? photoNamesCheckOut;
  String? imagePathCheckOut;
  String? locationCheckOut;
  String? userName;
  String? departmenName;

  AttendanceData({this.id, this.userId, this.checkIn, this.checkOut, this.locationCheckIn, this.notes, this.imagePathCheckIn, this.createdAt, this.updatedAt, this.createdBy, this.updatedBy, this.photoNamesCheckIn, this.photoNamesCheckOut, this.imagePathCheckOut, this.locationCheckOut, this.userName, this.departmenName});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["user_id"] is int)
      this.userId = json["user_id"];
    if(json["check_in"] is String)
      this.checkIn = json["check_in"];
    if(json["check_out"] is String)
      this.checkOut = json["check_out"];
    if(json["location_check_in"] is String)
      this.locationCheckIn = json["location_check_in"];
    if(json["notes"] is String)
      this.notes = json["notes"];
    if(json["image_path_check_in"] is String)
      this.imagePathCheckIn = json["image_path_check_in"];
    if(json["created_at"] is String)
      this.createdAt = json["created_at"];
    if(json["updated_at"] is String)
      this.updatedAt = json["updated_at"];
    if(json["created_by"] is String)
      this.createdBy = json["created_by"];
    if(json["updated_by"] is String)
      this.updatedBy = json["updated_by"];
    if(json["photo_names_check_in"] is String)
      this.photoNamesCheckIn = json["photo_names_check_in"];
    if(json["photo_names_check_out"] is String)
      this.photoNamesCheckOut = json["photo_names_check_out"];
    if(json["image_path_check_out"] is String)
      this.imagePathCheckOut = json["image_path_check_out"];
    if(json["location_check_out"] is String)
      this.locationCheckOut = json["location_check_out"];
    if(json["user_name"] is String)
      this.userName = json["user_name"];
    if(json["departmen_name"] is String)
      this.departmenName = json["departmen_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["check_in"] = this.checkIn;
    data["check_out"] = this.checkOut;
    data["location_check_in"] = this.locationCheckIn;
    data["notes"] = this.notes;
    data["image_path_check_in"] = this.imagePathCheckIn;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    data["created_by"] = this.createdBy;
    data["updated_by"] = this.updatedBy;
    data["photo_names_check_in"] = this.photoNamesCheckIn;
    data["photo_names_check_out"] = this.photoNamesCheckOut;
    data["image_path_check_out"] = this.imagePathCheckOut;
    data["location_check_out"] = this.locationCheckOut;
    data["user_name"] = this.userName;
    data["departmen_name"] = this.departmenName;
    return data;
  }
}