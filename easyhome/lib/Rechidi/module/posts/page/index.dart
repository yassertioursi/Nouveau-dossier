import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/core/extension/snackbar.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:easyhome/Rechidi/core/theme/colors.dart';
import 'package:easyhome/Rechidi/models/portfoliopost.dart';
import 'package:easyhome/Rechidi/module/posts/logic/portfolio_post_crud_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

part 'scaffold.dart';
part 'form.dart';
part 'images.dart';
part 'submitbutton.dart';

class CreateEditPost extends StatelessWidget {
  const CreateEditPost(this._post, {super.key}) : _isNew = _post == null;

  final PortfolioPostEntity? _post;
  final bool _isNew;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioPostCrudCubit(locator(), post: _post),
      child: BlocListener<PortfolioPostCrudCubit, PortfolioPostCrudState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => context.showSnackBarError(message),
            saved: (newPost) => context.back(newPost),
          );
        },
        child: _Scaffold(
          title: _isNew ? 'Add Post' : 'Edit Post',
          form: const _Form(),
          images: const _Images(),
          submitButton: const _SubmitButton(),
        ),
      ),
    );
  }
}
