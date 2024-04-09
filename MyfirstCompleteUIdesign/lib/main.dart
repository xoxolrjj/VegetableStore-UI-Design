import 'package:flutter/material.dart';
import 'package:mysecondapp/models/shop.dart';
import 'package:mysecondapp/pages/cart_page.dart';
import 'package:mysecondapp/pages/intro_page.dart';
import 'package:mysecondapp/pages/menu_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IntroPage(),
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/menupage': (context) => const MenuPage(),
          '/cartpage': (context) => const CartPage(),
        });
  }
}
