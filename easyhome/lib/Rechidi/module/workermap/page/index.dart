import 'package:easyhome/Rechidi/core/extension/bottomsheet.dart';
import 'package:easyhome/Rechidi/core/helper/location.helper.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/Rechidi/core/theme/colors.dart';
import 'package:easyhome/Rechidi/module/workermap/data/src/datasource.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared/map.dart';
import '../../../core/shared/spacing.dart';
import '../logic/posts_map_cubit.dart';

part 'scaffold.dart';
part 'map.dart';
part 'slider.dart';
part 'joblist.dart';
part 'floatingbutton.dart';
part 'bottomsheet.dart';

class PostsMap extends StatelessWidget {
  const PostsMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsMapCubit>(
      create: (context) => PostsMapCubit(locator()),
      child: Builder(builder: (context) {
        context.read<PostsMapCubit>().setMyLocation();
        context.read<PostsMapCubit>().fecthPosts();
        return const _Scaffold(
          jobList: _JobList(),
          map: _Map(),
          radiusSlider: _Slider(),
          floatingActionButton: _FloatingButton(),
        );
      }),
    );
  }
}
