import 'package:flutter/material.dart';

class RoundedImageContainer extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double height;
  final double borderRadius;

  const RoundedImageContainer({
    super.key,
    this.imageUrl,
    this.width,
    required this.height,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: imageUrl == null ? Colors.grey[300] : null,
        image:
            imageUrl != null
                ? DecorationImage(
                  image: _getImageProvider(imageUrl!),
                  fit: BoxFit.fitWidth,
                )
                : null,
      ),
      child:
          imageUrl == null
              ? Center(
                child: Text(
                  'No Image',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              )
              : null,
    );
  }

  ImageProvider _getImageProvider(String url) {
    if (url.startsWith('http') || url.startsWith('https')) {
      return NetworkImage(url);
    } else {
      return AssetImage(url);
    }
  }
}
