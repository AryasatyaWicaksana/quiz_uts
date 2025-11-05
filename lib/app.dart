import 'package:flutter/material.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz UTS PM6',
      debugShowCheckedModeBanner: false,

      // Tema global
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),

      // Routing
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
