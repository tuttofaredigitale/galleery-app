import 'dart:async';
import '../models/photo_item.dart';

class PhotoService {
  Future<List<PhotoItem>> fetchPhotos() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      PhotoItem(
          id: '1',
          url: 'https://picsum.photos/600/400?1',
          title: 'Paesaggio 1'),
      PhotoItem(
          id: '2',
          url: 'https://picsum.photos/600/400?2',
          title: 'Paesaggio 2'),
      PhotoItem(
          id: '3',
          url: 'https://picsum.photos/600/400?3',
          title: 'Paesaggio 3'),
      PhotoItem(
          id: '4',
          url: 'https://picsum.photos/600/400?4',
          title: 'Paesaggio 4'),
      PhotoItem(
          id: '5',
          url: 'https://picsum.photos/600/400?5',
          title: 'Paesaggio 5'),
      PhotoItem(
          id: '6',
          url: 'https://picsum.photos/600/400?6',
          title: 'Paesaggio 6'),
    ];
  }
}
