import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/certificate.dart';
import 'package:meta/meta.dart';

part 'certificate_state.dart';

class CertificateCubit extends Cubit<CertificateState> {
  final Repo repo;
  CertificateCubit(this.repo) : super(CertificateInitial());

  final List<Certificates> posts = [];

  Future<void> emitGetCertificate(String id) async {
    emit(Loading());
    await repo.getCertificate(id).then((post) {
      posts.addAll(post.certificates!);
      emit(GetCertificate());
    });
  }

  Future<void> emitDeleteCertificate(Certificates post) async {
    emit(Loading());
    await repo.deleteCertificate(post.id!).then((data) {
      posts.removeWhere((element) => element.id == post.id);
      emit(DeleteCertificate());
    });
  }
}
