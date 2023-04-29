class LoginModel {
  int? _status;
  bool? _success;
  String? _message;
  String? _token;
  Data? _data;

  LoginModel(
      {int? status,
      bool? success,
      String? message,
      String? token,
      Data? data}) {
    if (status != null) {
      this._status = status;
    }
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (token != null) {
      this._token = token;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  String? get token => _token;
  set token(String? token) => _token = token;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
    _token = json['token'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['success'] = this._success;
    data['message'] = this._message;
    data['token'] = this._token;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? _role;
  String? _name;
  String? _code;
  String? _doj;
  String? _phone;
  String? _department;
  String? _division;
  String? _location;

  Data(
      {List<String>? role,
      String? name,
      String? code,
      String? doj,
      String? phone,
      String? department,
      String? division,
      String? location}) {
    if (role != null) {
      this._role = role;
    }
    if (name != null) {
      this._name = name;
    }
    if (code != null) {
      this._code = code;
    }
    if (doj != null) {
      this._doj = doj;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (department != null) {
      this._department = department;
    }
    if (division != null) {
      this._division = division;
    }
    if (location != null) {
      this._location = location;
    }
  }

  List<String>? get role => _role;
  set role(List<String>? role) => _role = role;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get code => _code;
  set code(String? code) => _code = code;
  String? get doj => _doj;
  set doj(String? doj) => _doj = doj;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get department => _department;
  set department(String? department) => _department = department;
  String? get division => _division;
  set division(String? division) => _division = division;
  String? get location => _location;
  set location(String? location) => _location = location;

  Data.fromJson(Map<String, dynamic> json) {
    _role = json['role'].cast<String>();
    _name = json['name'];
    _code = json['code'];
    _doj = json['doj'];
    _phone = json['phone'];
    _department = json['department'];
    _division = json['division'];
    _location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this._role;
    data['name'] = this._name;
    data['code'] = this._code;
    data['doj'] = this._doj;
    data['phone'] = this._phone;
    data['department'] = this._department;
    data['division'] = this._division;
    data['location'] = this._location;
    return data;
  }
}
