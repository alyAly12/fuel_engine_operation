class User {
  String? id;
  String? code;
  String? name;
  String? username;
  String? password;
  String? email;
  String? mobile;
  String? status;
  dynamic statusNote;
  DateTime? lastLogin;
  dynamic loginDeviceInfo;
  String? loginToken;
  String? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  User({
    this.id,
    this.code,
    this.name,
    this.username,
    this.password,
    this.email,
    this.mobile,
    this.status,
    this.statusNote,
    this.lastLogin,
    this.loginDeviceInfo,
    this.loginToken,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String?,
    code: json['code'] as String?,
    name: json['name'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as String?,
    status: json['status'] as String?,
    statusNote: json['status_note'] as dynamic,
    lastLogin: json['last_login'] == null
        ? null
        : DateTime.parse(json['last_login'] as String),
    loginDeviceInfo: json['login_device_info'] as dynamic,
    loginToken: json['login_token'] as String?,
    createdBy: json['created_by'] as String?,
    updatedBy: json['updated_by'] as dynamic,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'name': name,
    'username': username,
    'password': password,
    'email': email,
    'mobile': mobile,
    'status': status,
    'status_note': statusNote,
    'last_login': lastLogin?.toIso8601String(),
    'login_device_info': loginDeviceInfo,
    'login_token': loginToken,
    'created_by': createdBy,
    'updated_by': updatedBy,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_at': deletedAt,
  };
}
