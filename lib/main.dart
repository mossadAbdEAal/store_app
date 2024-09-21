import 'package:flutter/material.dart';
import 'package:store_app/views/home_page.dart';

void main() {
  runApp(const Storeapp());
}

class Storeapp extends StatelessWidget {
  const Storeapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Homepage.id: (context) => const Homepage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Homepage.id,
    );
  }
}
