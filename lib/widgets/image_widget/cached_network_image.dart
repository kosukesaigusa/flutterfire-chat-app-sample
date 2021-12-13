import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:flutter/material.dart';

final plcaceHolderColor = grey700;

/// 丸画像のプレースホルダ
class CirclePlaceHolder extends StatelessWidget {
  const CirclePlaceHolder(this.radius);
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: plcaceHolderColor,
        ),
      );
}

/// 丸画像の CachedNetworkImage
class CircleCachedNetworkImage extends StatelessWidget {
  const CircleCachedNetworkImage({
    required this.radius,
    required this.imageURL,
    this.showBorder = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });
  final double radius;
  final String imageURL;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    if (imageURL.isEmpty) {
      return CirclePlaceHolder(radius);
    }
    return CachedNetworkImage(
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) => Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          ),
          border: showBorder
              ? Border.all(
                  color: borderColor,
                  width: borderWidth,
                )
              : null,
        ),
      ),
      placeholder: (context, url) => CirclePlaceHolder(radius),
      errorWidget: (context, url, dynamic error) => CirclePlaceHolder(radius),
    );
  }
}
