import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Certificate/certificate_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/certificate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCertificate extends StatefulWidget {
  const BuildCertificate({super.key});

  @override
  State<BuildCertificate> createState() => _BuildCertificateState();
}

class _BuildCertificateState extends State<BuildCertificate> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CertificateCubit>(context)
        .emitGetCertificate("66380575b0a95c051bb5e786");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBloc(),
    );
  }

  Widget _buildBloc() {
    return BlocBuilder<CertificateCubit, CertificateState>(
      builder: (context, state) {
        final cubit = context.read<CertificateCubit>();
        if (!(state is Loading && cubit.posts.isEmpty)) {
          return buildCertificate(cubit.posts);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildCertificate(List<Certificates> posts) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return _item(posts[index]);
          }),
    );
  }

  Widget _item(Certificates post) {
    return Column(
      children: [
        Stack(children: [
          Opacity(
            opacity: post.isValid! ? 1 : 0.55,
            child: Container(
              padding: EdgeInsets.only(right: 15.w, left: 15.w),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                  color: Color.fromARGB(255, 53, 53, 53),
                  blurRadius: 50,
                ),
              ]),
              child: CupertinoContextMenu(
                actions: <Widget>[
                  CupertinoContextMenuAction(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Delete Post",
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop;
                    },
                  )
                ],
                child: SafeArea(
                  child: Image.network(
                    post.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          if (!post.isValid!)
            Positioned(
              left: 20.w,
              top: 5.h,
              child: Row(
                children: [
                  Icon(
                    Icons.report,
                    color: Colors.red,
                    size: 25.sp,
                  ),
                  Text(
                    "Not Valid Yet",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
        ]),
        SizedBox(
          height: 23.h,
        )
      ],
    );
  }

  Widget _popupmenu(Certificates post) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<CertificateCubit>(context)
                          .emitDeleteCertificate(post);
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Delete Post",
                          ),
                        ),
                      ],
                    ),
                  )),
            ]);
  }
}

Widget valid(bool isValid) {
  if (isValid) {
    return SizedBox(
      height: 23.h,
    );
  } else {
    return SizedBox(
      height: 23.h,
      child: Text(
        "Not Valid Yet",
        style: TextStyle(
            color: Colors.red, fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
