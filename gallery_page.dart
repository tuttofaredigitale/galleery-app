import 'package:flutter/material.dart';
import '../services/photo_service.dart';
import '../models/photo_item.dart';
import '../widgets/photo_grid_item.dart';

class GalleryPage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const GalleryPage({super.key, required this.onToggleTheme});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<PhotoItem>> _photoFuture;

  @override
  void initState() {
    super.initState();
    _photoFuture = PhotoService().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galleria Fotografica'),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<PhotoItem>>(
          future: _photoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Si è verificato un errore: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nessuna immagine disponibile'));
            } else {
              final photos = snapshot.data!;
              return LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int crossAxisCount = 2;
                  if (width > 600) {
                    crossAxisCount = 3;
                  }
                  if (width > 900) {
                    crossAxisCount = 4;
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return PhotoGridItem(photo: photo);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
