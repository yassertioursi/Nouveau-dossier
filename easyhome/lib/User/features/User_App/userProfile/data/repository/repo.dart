import 'package:easyhome/User/features/User_App/userProfile/data/model/delete_post.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/favorite.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/post.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/remove_favorite.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/services/web_services.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/certificate.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/portfolio.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/reviews.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/saved_posts.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/switch.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';

class Repo {
  final WebServices webServices;

  Repo(this.webServices);

  Future<User> getUserById(String userId) async {
    return await webServices.getUserById(userId);
  }

  Future<User> updateUser(String userID, Map<String, String> newUser) async {
    return await webServices.updateUser(userID, newUser);
  }

  Future<User> changePassword(Map<String, String> password) async {
    return await webServices.changePassword(password);
  }

  Future<Favorite> getFavoriteWorkers() async {
    return await webServices.getFavoriteWorkers();
  }

  Future<Post> getPosts() async {
    return await webServices.getPosts();
  }

  Future<MyWorker> getWorkerById(String userId) async {
    return await webServices.getWorkerById(userId);
  }

  Future<Dpost> deletePost(String postId) async {
    return await webServices.deletePost(postId);
  }

  Future<Dpost> deletePortfolioPosts(String postId) async {
    return await webServices.deletePortfolioPosts(postId);
  }

  Future<RemFav> removeFav(String workerId) async {
    return await webServices.removeFav(workerId);
  }

  Future<Portfolio> getPortfolio(String workerId) async {
    return await webServices.getPortfolio(workerId);
  }

  Future<Reviews> getReviewsByWorkerId(String workerId) async {
    return await webServices.getReviewsByWorkerId(workerId);
  }

  Future<SavedPost> getSavedPosts(String workerId) async {
    return await webServices.getSavedPosts(workerId);
  }

  Future<RemFav> unsavePost(String workerId) async {
    return await webServices.unsavePost(workerId);
  }

  Future<Certificate> getCertificate(String workerId) async {
    return await webServices.getCertificate(workerId);
  }

  Future<RemFav> deleteCertificate(String certificateID) async {
    return await webServices.deleteCertificate(certificateID);
  }

  Future<Switch> switche() async {
    return await webServices.switche();
  }
}
