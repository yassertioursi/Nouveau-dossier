import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/savePosts/save_posts_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/drawer/saved_posts/posts_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({super.key});

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SavePostsCubit>(context)
        .emitGetSavedPosts("66380575b0a95c051bb5e786");
  }

  Widget _buildBloc() {
    return BlocBuilder<SavePostsCubit, SavePostsState>(
      builder: (context, state) {
        final cubit = context.read<SavePostsCubit>();
        if (!(state is Loading && cubit.posts.isEmpty)) {
          return HomeWorker(
            posts: cubit.posts,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }
}
