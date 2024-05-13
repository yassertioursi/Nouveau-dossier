import 'package:dio/dio.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/delete_post.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/favorite.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/post.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/remove_favorite.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/certificate.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/portfolio.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/reviews.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/saved_posts.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/switch.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';

import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: "https://easyhome-lcvx.onrender.com/api/v1/")
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  @GET("users/{_id}")
  Future<User> getUserById(@Path("_id") String id);

  @PATCH("users/{_id}")
  Future<User> updateUser(
      @Path("_id") String id, @Body() Map<String, String> newUser);

  @PATCH("auth/updatePassword")
  Future<User> changePassword(@Body() Map<String, String> password);

  @GET("users/me/favoriteWorkers")
  Future<Favorite> getFavoriteWorkers();

  @GET("users/posts/me")
  Future<Post> getPosts();

  @GET("workers/{_id}")
  Future<MyWorker> getWorkerById(@Path("_id") String id);

  @DELETE("users/posts/{_id}")
  Future<Dpost> deletePost(@Path("_id") String id);

  @DELETE("workers/portfolioPosts/{_id}")
  Future<Dpost> deletePortfolioPosts(@Path("_id") String id);

  @PATCH("workers/{_id}/favorite")
  Future<RemFav> removeFav(@Path("_id") String id);

  @GET("workers/{_id}/portfolioPosts")
  Future<Portfolio> getPortfolio(@Path("_id") String id);

  @GET("workers/{_id}/reviews")
  Future<Reviews> getReviewsByWorkerId(@Path("_id") String id);

  @GET("workers/{_id}/savedPosts")
  Future<SavedPost> getSavedPosts(@Path("_id") String id);

  @PATCH("users/posts/{_id}/save")
  Future<RemFav> unsavePost(@Path("_id") String id);

  @GET("workers/{_id}/certificates")
  Future<Certificate> getCertificate(@Path("_id") String id);

  @GET("workers/certificates/{_id}")
  Future<RemFav> deleteCertificate(@Path("_id") String id);

  @PATCH("auth/switch")
  Future<Switch> switche();
}
