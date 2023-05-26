import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:change_theme/home.dart';
import 'package:change_theme/theme_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  runApp(MyApp(theme: initTheme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Theme Switch',
          theme: theme,
          home: HomePage(),
        );
      },
    );
  }
}
