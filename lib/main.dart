import 'package:flutter/material.dart';
import 'package:food_shop/pages/dashboard.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Foody',
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
