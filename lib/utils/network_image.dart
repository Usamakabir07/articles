import 'package:articles/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageForArticles extends StatelessWidget {
  const NetworkImageForArticles(
      {Key? key, required this.imageUrl, required this.radius})
      : super(key: key);
  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) =>
          CircleAvatar(radius: radius, backgroundImage: imageProvider),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          progressIndicator,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
