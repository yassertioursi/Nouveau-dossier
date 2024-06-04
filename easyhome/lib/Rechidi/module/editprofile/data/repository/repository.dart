import 'dart:io';

import '../source/source.dart';

class EditProfileRepository {
  final EditProfileDataSource dataSource;

  EditProfileRepository(this.dataSource);

  Future<void> editProfile({
    required String name,
    required String bio,
    required String phoneNumber,
    required String email,
    required String facebook,
    required String wilaya,
    required String job,
    required File? profilePicture,
  }) async {
    await dataSource.updateWorker(
        name, bio, phoneNumber, email, facebook, wilaya, job, profilePicture);
  }
}
