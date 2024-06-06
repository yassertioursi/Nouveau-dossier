part of 'portfolio_post_crud_cubit.dart';

@freezed
class PortfolioPostCrudState with _$PortfolioPostCrudState {
  const factory PortfolioPostCrudState.initial() = _Initial;

  const factory PortfolioPostCrudState.saving() = _Saving;
  const factory PortfolioPostCrudState.saved(PortfolioPostEntity post) = _Saved;

  const factory PortfolioPostCrudState.imageChanging() = _ImageChanging;
  const factory PortfolioPostCrudState.imageChanged() = _ImageChanged;

  const factory PortfolioPostCrudState.error(String message) = _Error;
}
