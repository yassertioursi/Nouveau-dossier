import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/models/certificate.dart';
import 'package:easyhome/Rechidi/models/woker.dart';

import '../../../../models/portfoliopost.dart';
import '../../../../models/review.dart';
import '../source/source.dart';

class WorkerProfileRepository {
  final WorkerProfileDataSource _remote;

  WorkerProfileRepository(this._remote);

  Future<WorkerEntity> getWorkerProfile(String id) async {
    final response = await _remote.getProfile(id);
    return response.worker!;
  }

  Future<List<PortfolioPostEntity>> getPortfolioPosts(
      String id, int page) async {
    final response = await _remote.getPortfolioPost(id, page);
    return response.posts;
  }

  Future<void> likePost(String id) async {
    await _remote.like(id);
  }

  Future<void> deletePost(String id) async {
    await _remote.delete(id);
  }

  Future<List<ReviewEntity>> getReviews(String id, int page) async {
    final response = await _remote.getReviews(id, page);
    return response.reviews;
  }

  Future<void> deleteReview(String id) async {
    await _remote.deleteReview(id);
  }

  Future<void> deleteCertificate(String id) async {
    await _remote.deleteCertificate(id);
  }

  Future<List<CertificateEntity>> getCertificates(String id) async {
    final response = await _remote.getCertificates(id);
    return response.certificates;
  }

  Future<void> switchAccount() async {
    final response = await _remote.switchAccount();
    await AuthCache.setToken(response.token!);
    await AuthCache.setIsWorker(response.role != 'user');
  }
}
