part of 'source.dart';

class _PostResponse {
  final PortfolioPostEntity portfolioPost;

  _PostResponse({required this.portfolioPost});

  factory _PostResponse.fromJson(Map<String, dynamic> json) {
    return _PostResponse(
      portfolioPost: PortfolioPostEntity.fromJson(json['portfolioPost']),
    );
  }
}
