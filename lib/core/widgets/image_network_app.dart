import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_test/core/constants/constants.dart';

import '../themes/app_colors.dart';

class ImageNetworkApp extends StatelessWidget {
  final String? url;
  final double? ratio;
  final BoxFit? fit;
  final File? imgFile;

  const ImageNetworkApp({
    super.key,
    this.imgFile,
    this.url,
    this.ratio,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ratio != null
        ? AspectRatio(
            aspectRatio: ratio!,
            child: _image(),
          )
        : _image();
  }

  Widget _image() {
    if (imgFile != null) {
      return Image.file(
        imgFile!,
        fit: fit,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url ?? '',
        fit: fit,
        placeholder: (context, url) => _holderImageWidget(),
        errorWidget: (context, url, error) => _holderImageWidget(),
      );
    }
  }

  Widget _holderImageWidget() => Container(
        color: AppColors.whiteColor,
        child: Image.asset(
          IconConstants.iconMovie,
          fit: fit,
        ),
      );
}
