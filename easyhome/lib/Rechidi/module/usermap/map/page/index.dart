import 'package:easyhome/Rechidi/core/extension/bottomsheet.dart';
import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/module/workerprofile/page/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/location.helper.dart';
import '../../../../core/injection/index.dart';
import '../../../../core/shared/map.dart';
import '../../../../core/shared/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../data/repo/repo.dart';
import '../data/src/source.dart';
import '../logic/map_cubit.dart';

part 'scaffold.dart';
part 'map.dart';
part 'slider.dart';
part 'joblist.dart';
part 'bottomsheet.dart';
part 'floatingbutton.dart';

class UserMap extends StatelessWidget {
  const UserMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowMapCubit>(
      create: (context) => ShowMapCubit(locator<LocationRepository>()),
      child: Builder(builder: (context) {
        context.read<ShowMapCubit>().setMyLocation();
        context.read<ShowMapCubit>().fetchWorkerList();

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
