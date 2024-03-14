import 'package:flutter/material.dart';
import 'package:shop_rent/Modules/HomePage.dart';

void main() {
  runApp(Shop_rent());
}

class Shop_rent extends StatelessWidget {
  const Shop_rent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



