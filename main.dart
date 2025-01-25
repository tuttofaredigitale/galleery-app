import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'pages/gallery_page.dart';
import 'pages/photo_detail_page.dart';
import 'models/photo_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galleria Fotografica',
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: GalleryPage(
        onToggleTheme: _toggleTheme,
      ),
      onGenerateRoute: (setting) {
        if (setting.name == PhotoDetailPage.routeName) {
          final photoItem = setting.arguments as PhotoItem;
          return MaterialPageRoute(
            builder: (context) => PhotoDetailPage(photoItem: photoItem),
          );
        }
        return null;
      },
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }
}
