// ignore_for_file: avoid_types_as_parameter_titles

class UserYasser {
  late String name;
  late String email;
  late String password;
  late String phoneNumber;
  late String wilaya;
  late String id;
  late String profilePicture;

  void fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;

    email = json['email'] as String;
    password = json['password'] ?? "" as String;
    json['password'] == null ? password = "n" : password = json["password"];
    phoneNumber = json['phoneNumber'] as String;
    wilaya = json['wilaya'] as String;
    id = json['_id'] as String;
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
      '_id': id,
      'profilePicture': profilePicture,
    };
  }
}
