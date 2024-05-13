import 'package:json_annotation/json_annotation.dart';

part 'worker.g.dart';

@JsonSerializable()
class MyWorker {
  String? status;
  Worker? worker;

  MyWorker({this.status, this.worker});
  factory MyWorker.fromJson(Map<String, dynamic> json) =>
      _$MyWorkerFromJson(json);

  Map<String, dynamic> toJson() => _$MyWorkerToJson(this);
}

@JsonSerializable()
class Worker {
  Authentication? authentication;
  bool? workerAccountVerified;
  int? rating;
  int? ratingsNumber;
  int? experience;
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? email;
  String? profilePicture;
  String? wilaya;
  String? phoneNumber;
  int? reported;
  String? role;
  String? currentRole;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? idPicture;
  String? job;
  String? bio;
  bool? isCertified;

  Worker({
    this.authentication,
    this.workerAccountVerified,
    this.rating,
    this.ratingsNumber,
    this.experience,
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.wilaya,
    this.phoneNumber,
    this.reported,
    this.role,
    this.currentRole,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.idPicture,
    this.bio,
    this.job,
    this.isCertified,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}

@JsonSerializable()
class Authentication {
  bool? isVerified;

  Authentication({this.isVerified});

  factory Authentication.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);
}
