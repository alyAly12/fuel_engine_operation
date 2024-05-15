class UserModel {
  String? id;
  dynamic partyId;
  String? name;
  dynamic avatar;
  String? username;
  String? email;
  String? mobile;
  dynamic parentId;
  dynamic emailVerifiedAt;
  dynamic mobilVerifiedAt;
  String? status;
  dynamic statusNote;
  DateTime? lastLogin;
  String? userType;
  String? userEntity;
  String? entityId;
  String? mobileType;
  String? language;
  dynamic setting;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic avatarUrl;

  UserModel({
    this.id,
    this.partyId,
    this.name,
    this.avatar,
    this.username,
    this.email,
    this.mobile,
    this.parentId,
    this.emailVerifiedAt,
    this.mobilVerifiedAt,
    this.status,
    this.statusNote,
    this.lastLogin,
    this.userType,
    this.userEntity,
    this.entityId,
    this.mobileType,
    this.language,
    this.setting,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String?,
    partyId: json['party_id'] as dynamic,
    name: json['name'] as String?,
    avatar: json['avatar'] as dynamic,
    username: json['username'] as String?,
    email: json['email'] as String?,
    mobile: json['mobile'] as String?,
    parentId: json['parent_id'] as dynamic,
    emailVerifiedAt: json['email_verified_at'] as dynamic,
    mobilVerifiedAt: json['mobil_verified_at'] as dynamic,
    status: json['status'] as String?,
    statusNote: json['status_note'] as dynamic,
    lastLogin: json['last_login'] == null
        ? null
        : DateTime.parse(json['last_login'] as String),
    userType: json['user_type'] as String?,
    userEntity: json['user_entity'] as String?,
    entityId: json['entity_id'] as String?,
    mobileType: json['mobile_type'] as String?,
    language: json['language'] as String?,
    setting: json['setting'] as dynamic,
    createdBy: json['created_by'] as String?,
    updatedBy: json['updated_by'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    deletedAt: json['deleted_at'] as dynamic,
    avatarUrl: json['avatar_url'] as dynamic,
  );
}