part of 'source.dart';

class LocationResponse extends Equatable {
  final List<WorkerCard>? workers;

  const LocationResponse({required this.workers});

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class WorkerCard extends Equatable {
  final String? id;
  final LocationEntity? location;
  final String? name;
  final String? job;

  final String? image;

  const WorkerCard(
      {required this.location,
      required this.id,
      required this.name,
      required this.job,
      required this.image});

  factory WorkerCard.fromJson(Map<String, dynamic> json) =>
      _$WorkerCardFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerCardToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
