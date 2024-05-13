part of 'portfolio_cubit.dart';

sealed class PortfolioState {}

final class PorfolioInitial extends PortfolioState {}

class GetPortfolio extends PortfolioState {}

class Loading extends PortfolioState {}

class DeletePortfolioPost extends PortfolioState {}
