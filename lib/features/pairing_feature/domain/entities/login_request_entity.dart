class LoginRequestEntity {
  final String userName;
  final String password;
  final String type;


  LoginRequestEntity(
      {required this.userName, required this.password, required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = userName;
    data['password'] = password;
    data['type'] = type;
    return data;
  }
}
