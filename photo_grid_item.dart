import 'package:flutter/material.dart';
import '../models/photo_item.dart';
import '../pages/photo_detail_page.dart';

class PhotoGridItem extends StatelessWidget {
  final PhotoItem photo;

  const PhotoGridItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PhotoDetailPage.routeName,
          arguments: photo,
        );
      },
      child: Hero(
        tag: 'photo_${photo.id}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            photo.url,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                child: const Center(
                  child: Icon(Icons.broken_image, size: 40),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
