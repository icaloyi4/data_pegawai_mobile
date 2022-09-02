class GetDepartmentPositionResponse {
  GetDepartmentPositionResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  late final bool? status;
  late final int? code;
  late final String? message;
  late final List<DataDepartment>? data;

  GetDepartmentPositionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data =
        List.from(json['data']).map((e) => DataDepartment.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataDepartment {
  DataDepartment({
    required this.id,
    required this.name,
    required this.position,
  });
  late final int id;
  late final String name;
  late final List<DataPosition> position;

  DataDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = List.from(json['position'])
        .map((e) => DataPosition.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['position'] = position.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataPosition {
  DataPosition({
    required this.id,
    required this.departmentId,
    this.name,
    this.level,
  });
  late int id;
  late int departmentId;
  String? name;
  int? level;

  DataPosition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['department_id'] = departmentId;
    _data['name'] = name;
    _data['level'] = level;
    return _data;
  }
}
