import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/front_page/login/login.dart';
import 'package:testing/pages/main_page/main_menu_page.dart';
import 'package:testing/providers/dark_theme.dart';
import 'package:testing/providers/language_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            color: const Color(0xFF7A9BEE),
            debugShowCheckedModeBanner: false,
            title: 'JHA FOOD',
            theme: themeProvider.darkTheme == true
                ? themeProvider.dark
                : themeProvider.light,
            home: const Login(),
          );
        });
  }
}
