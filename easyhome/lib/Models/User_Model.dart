// ignore_for_file: avoid_types_as_parameter_titles

class UserYasser {
  late String name;
  late String email;
  late String phoneNumber;
  late String wilaya;
  late String id;
  late String profilePicture;
  late String currentRole;

  void fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;

    email = json['email'] as String;
    currentRole = json['currentRole'] as String;
    
    
    phoneNumber = json['phoneNumber'] as String;
    wilaya = json['wilaya'] as String;
    id = json['_id'] as String;
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'currentRole': currentRole,
      
      'phoneNumber': phoneNumber,
      'wilaya': wilaya,
      '_id': id,
      'profilePicture': profilePicture,
    };
  }
}
