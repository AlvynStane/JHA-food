import 'package:flutter/material.dart';
import 'package:testing/pages/login/login.dart';
import 'package:testing/providers/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NewsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'JHA FOOD',
            theme: ThemeData(primarySwatch: Colors.purple),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const Login(
              title: 'Login',
            ),
          );
        });
  }
}
