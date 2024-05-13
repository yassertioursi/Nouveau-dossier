import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/portfolio/portfolio_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/portfolioPost.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPortfolio extends StatefulWidget {
  const BuildPortfolio({super.key});

  @override
  State<BuildPortfolio> createState() => _BuildPortfolioState();
}

class _BuildPortfolioState extends State<BuildPortfolio> {
  Widget _buildBloc() {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      builder: (context, state) {
        final cubit = context.read<PortfolioCubit>();
        if (!(state is Loading && cubit.portfolioPosts.isEmpty)) {
          return _listV(cubit.portfolioPosts);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PortfolioCubit>(context)
        .emitGetPortfolioPosts("66380575b0a95c051bb5e786");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBloc(),
      floatingActionButton: Icon(
        Icons.add_circle_outlined,
        size: 50,
      ),
    );
  }

  Widget _listV(List<PortfolioData> posts) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          posts.length;
          return portPostUI(context, posts[index]);
        },
      ),
    );
  }
}
