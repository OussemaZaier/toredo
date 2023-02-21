class CustomerModel {
  String email;
  String password;
  String username;
  CustomerModel({
    required this.email,
    required this.password,
    required this.username,
  });
  Map<String, dynamic> toJSON() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'password': password,
      'username': username,
    });
    return map;
  }
}
