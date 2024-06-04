part of 'source.dart';

class _WorkerResponse {
  _WorkerResponse({
    required this.worker,
  });

  final WorkerEntity? worker;

  factory _WorkerResponse.fromJson(Map<String, dynamic> json) =>
      _WorkerResponse(
        worker: WorkerEntity.fromJson(json['worker']),
      );
}

class _PortfolioPostResponse {
  _PortfolioPostResponse({
    required this.posts,
  });

  final List<PortfolioPostEntity> posts;

  factory _PortfolioPostResponse.fromJson(Map<String, dynamic> json) =>
      _PortfolioPostResponse(
        posts: List<PortfolioPostEntity>.from(
          json['data'].map(
            (x) => PortfolioPostEntity.fromJson(x),
          ),
        )
      );
}

class _ReviewResponse {
  _ReviewResponse({
    required this.reviews,
  });

  final List<ReviewEntity> reviews;

  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _ReviewResponse(
        reviews: List<ReviewEntity>.from(
          json['data'].map(
            (x) => ReviewEntity.fromJson(x),
          ),
        ),
      );
}

class _CertificateResponse {
  _CertificateResponse({
    required this.certificates,
  });

  final List<CertificateEntity> certificates;

  factory _CertificateResponse.fromJson(Map<String, dynamic> json) =>
      _CertificateResponse(
        certificates: List<CertificateEntity>.from(
          json['data'].map(
            (x) => CertificateEntity.fromJson(x),
          ),
        ),
      );
}
