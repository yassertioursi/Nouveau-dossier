import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/portfolio.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final Repo repo;
  PortfolioCubit(this.repo) : super(PorfolioInitial());

  final List<PortfolioData> portfolioPosts = [];

  Future<void> emitGetPortfolioPosts(String id) async {
    emit(Loading());
    await repo.getPortfolio(id).then((portfolio) {
      portfolioPosts.addAll(portfolio.data!);
      emit(GetPortfolio());
    });
  }

  Future<void> emitDeletePortfolioPost(PortfolioData post) async {
    emit(Loading());
    await repo.deletePortfolioPosts(post.id!).then((data) {
      portfolioPosts.removeWhere((element) => element.id == post.id);
      emit(DeletePortfolioPost());
    });
  }
}
