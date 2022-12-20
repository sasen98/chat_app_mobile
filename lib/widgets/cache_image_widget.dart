import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageWidget extends StatelessWidget {
  const CacheImageWidget({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.isImageCircle = false,
    this.imageUrl,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final double? radius;
  final double? borderRadius;
  final bool isImageCircle;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    Widget getOutlineOfImage(
        {required bool isImageCircle, required Widget child}) {
      return isImageCircle
          ? CircleAvatar(
              radius: radius,
              child: child,
            )
          : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 0)),
              height: height,
              width: width,
              child: child,
            );
    }

    return getOutlineOfImage(
      isImageCircle: isImageCircle,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        placeholder: (context, string) {
          return const Icon(Icons.face_rounded);
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
