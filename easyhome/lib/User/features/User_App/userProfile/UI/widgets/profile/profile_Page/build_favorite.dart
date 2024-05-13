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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                size: 30.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      favworker[index].name ?? '',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (favworker[index].isCertified ?? false)
                                      Icon(
                                        Icons.verified,
                                        size: 25.sp,
                                        color: Colors.blue,
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          favworker[index].job ?? '',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.deepOrangeAccent),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Score: ${favworker[index].experience} ',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.local_fire_department_rounded)
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<FavoriteCubit>(context)
                            .removeFav(favworker[index]);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 40.sp,
                      ),
                    ),
                  ],
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
