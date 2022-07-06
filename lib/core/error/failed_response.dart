class FailedResponse {
  int? _code;
  String? _message;
  Null _data;

  FailedResponse({int? code, String? message, Null data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  String? get message => _message;
  set message(String? message) => _message = message;
  Null get data => _data;
  set data(Null data) => _data = data;

  FailedResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    data['data'] = this._data;
    return data;
  }
}
