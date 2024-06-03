import 'package:easyhome/Rechidi/core/extension/bottomsheet.dart';
import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/module/usermap/selectplace/logic/map_selector_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/location.helper.dart';
import '../../../../core/shared/map.dart';
import '../../../../core/shared/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../models/location.dart';

part 'scaffold.dart';
part 'map.dart';
part 'bottomsheet.dart';
part 'floatingbutton.dart';

class MapPlaceSelector extends StatelessWidget {
  const MapPlaceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapSelectorCubit(),
      child: BlocBuilder<MapSelectorCubit, MapSelectorState>(
        builder: (context, state) {
          return _Scaffold(
            search: SizedBox(),
            map: _Map(),
            floatingButton: _FloatingButton(),
          );
        },
      ),
    );
  }
}
