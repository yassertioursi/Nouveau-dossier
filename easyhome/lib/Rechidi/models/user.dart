class UserEntity {
  final String? id;
  final String? profilePicture;
  final String? name;

  UserEntity({this.id, this.profilePicture, this.name});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['_id'],
      profilePicture: json['profilePicture'],
      name: json['name'],
    );
  }
}
