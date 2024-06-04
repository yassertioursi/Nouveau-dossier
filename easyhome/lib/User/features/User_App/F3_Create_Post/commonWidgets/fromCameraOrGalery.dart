// ignore_for_file: file_names, use_build_context_synchronously, prefer_const_constructors

import 'dart:io';

import 'package:easyhome/User/features/User_App/F3_Create_Post/Provider/ProviderImages.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/commonWidgets/UploadImages.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CameraOrGalery extends StatelessWidget {
  final Function(List<File> status) onImagesSelected;
  ProviderImages providerImages;

  CameraOrGalery({
    super.key,
    required this.onImagesSelected,
    required this.providerImages,
  });

  @override
  Widget build(BuildContext context) {
    ImagesUpload images_upload = ImagesUpload();
    return Center(
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width - 40,
        child: AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Upload Images",
                    style: TextStyle(
                      fontSize: 21,
                      color: Color(0xFF3E3E3E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  await images_upload.uploadImageFromCamera(
                      context, providerImages);
                  providerImages.just_notify();
                  Navigator.pop(context);
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: MyColors.mainblue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "From Camera",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await images_upload.uploadImages(context, providerImages);
                  providerImages.just_notify();

                  Navigator.pop(context);
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "From Galery",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
