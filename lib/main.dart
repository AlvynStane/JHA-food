import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/loading_page/loading.dart';
import 'package:testing/providers/dark_theme.dart';
import 'package:testing/providers/language_provider.dart';
import 'package:testing/providers/saved_account.dart';
import 'package:testing/providers/saved_address.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
    ChangeNotifierProvider(create: (context) => AddressProvider()),
    ChangeNotifierProvider(create: (context) => AccountProvider()),
  ], child: const MyApp()));
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };  
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
            scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
            title: 'JHA FOOD',
            theme: themeProvider.darkTheme == true
                ? themeProvider.dark
                : themeProvider.light,
            home: const SplashScreen(),
          );
        });
  }
}
