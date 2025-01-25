import 'package:flutter/material.dart';
import '../models/photo_item.dart';

class PhotoDetailPage extends StatefulWidget {
  static const routeName = '/photo-detail';

  final PhotoItem photoItem;

  const PhotoDetailPage({super.key, required this.photoItem});

  @override
  State<PhotoDetailPage> createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> extraImages = [
    'https://picsum.photos/600/400?7',
    'https://picsum.photos/600/400?8',
    'https://picsum.photos/600/400?9',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % extraImages.length;
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final photo = widget.photoItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'photo_${photo.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  photo.url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final opacity = _animation.value;
                    final scale = 0.8 + (0.2 * _animation.value);

                    return Transform.scale(
                      scale: scale,
                      child: Opacity(
                        opacity: opacity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            extraImages[_currentIndex],
                            fit: BoxFit.cover,
                            width: 300,
                            height: 200,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _nextImage,
              child: const Text('Prossima immagine'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
