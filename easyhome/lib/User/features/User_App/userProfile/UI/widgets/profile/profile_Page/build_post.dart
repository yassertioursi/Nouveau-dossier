import 'package:easyhome/Rechidi/core/shared/noitemwidget.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/postUI.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/post.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildPost extends StatefulWidget {
  const BuildPost({super.key});

  @override
  State<BuildPost> createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  Widget _buildBloc() {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        final cubit = context.read<PostCubit>();
        if (!(state is Loading && cubit.posts.isEmpty)) {
          return _listV(cubit.posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: MyColors.mainblue,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }

  Widget _listV(List<PData> posts) {
    return NoItemsWidget(
      condition: posts.isNotEmpty,
      message: "No posts found",
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          posts.length;
          return postUI(context, posts[index]);
        },
      ),
    );
  }
}
