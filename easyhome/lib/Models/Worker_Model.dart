class WorkerYasser {
  late String name;
  late String email;
  late String wilaya;
  late String phoneNumber;
  late String id;
  late String rating;
  late String ratingsNumber;
  late String experience;
  late String profilePicture;
  late String job;
  late bool isCertified;

  WorkerYasser.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;

    email = json['email'] as String;
    phoneNumber = json['phoneNumber'] as String;
    wilaya = json['wilaya'] as String;
    id = json['_id'] as String;
    rating = json['rating'].toString();

    ratingsNumber = json['ratingsNumber'].toString();
    experience = json['experience'].toString();
    job = json['job'];
    isCertified = json['isCertified'];
    profilePicture = json['profilePicture'];

    Map<String, dynamic> toJson() {
      return {
        'name': name,
        'email': email,
        'wilaya': wilaya,
        'phoneNumber': phoneNumber,
        '_id': id,
        'rating': rating,
        'ratingsNumber': ratingsNumber,
        'experience': experience,
        'job': job,
        'isCertified': isCertified,
        'profilePicture': profilePicture,
      };
    }
  }
}
