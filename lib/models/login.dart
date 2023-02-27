class LoginModel {
  bool success;
  int status;
  String code;
  String message;
  Data data;
  LoginModel({
    required this.success,
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  LoginModel.fromJSON(Map<String, dynamic> json)
      : success = json['success'],
        status = json['status'],
        code = json['code'],
        message = json['message'],
        data = json['data'] != null
            ? Data.fromJSON(json)
            : Data(id: 0, token: '0', email: '0', username: '0');
  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}

class Data {
  int id;
  String token;
  String email;
  String username;
  Data({
    required this.id,
    required this.token,
    required this.email,
    required this.username,
  });
  Data.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        token = json['token'],
        email = json['email'],
        username = json['username'];

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['email'] = this.email;
    data['username'] = this.username;
    return data;
  }
}
