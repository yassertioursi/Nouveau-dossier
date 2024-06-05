import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/worker_two.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildFavorite extends StatefulWidget {
  const BuildFavorite({super.key});

  @override
  State<BuildFavorite> createState() => _BuildFavoriteState();
}

class _BuildFavoriteState extends State<BuildFavorite> {
  Widget _buildBloc() {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();

        if (!(state is Loading && cubit.workers.isEmpty)) {
          return _favorite(cubit.workers);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _favorite(List<Workers> favworker) {
    return Container(
      color: const Color(0xFFEEEEEE),
      child: ListView.builder(
          itemCount: favworker.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // TODO
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Worker_two(
                  name: favworker[index].name!,
                  wilaya: favworker[index].wilaya!,
                  rating: favworker[index].rating!.toDouble(),
                  experience: favworker[index].experience!.toDouble(),
                  profilePicture: favworker[index].profilePicture!,
                  job: favworker[index].job!,
                  isCertified: favworker[index].isCertified!,
                  id: favworker[index].id!,
                  isFav: true,
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }
}
