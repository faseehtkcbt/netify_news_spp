import 'package:flutter/material.dart';
import 'package:news_app/core/constants/constants.dart';

class NetworkImageUrl extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double radius;
  const NetworkImageUrl(
      {super.key,
      required this.url,
      required this.height,
      required this.width,
      this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          url,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              Constants.demoImage,
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
