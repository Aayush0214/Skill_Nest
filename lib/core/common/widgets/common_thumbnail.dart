import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skill_nest/core/constants/constant_images.dart';

Widget commonThumbnailImage({required double clipRadius, required String thumbnailUrl, double? imageHeight}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(clipRadius),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      height: imageHeight,
      width: double.infinity,
      imageUrl: thumbnailUrl,
      placeholder: (context, url) => Center(
        child: CupertinoActivityIndicator(),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: imageHeight,
        width: double.infinity,
        child: Image.asset(
          fit: BoxFit.cover,
          ConstantImages.placeHolder,
        ),
      ),
    ),
  );
}

Widget commonNetworkProfile({required String profileUrl, required double clipRadius }) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(clipRadius),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: profileUrl,
      placeholder: (context, url) => Center(
        child: CupertinoActivityIndicator(),
      ),
      errorWidget: (context, url, error) => SizedBox(
        child: Image.asset(
          fit: BoxFit.cover,
          ConstantImages.profilePlaceholder,
        ),
      ),
    ),
  );
}