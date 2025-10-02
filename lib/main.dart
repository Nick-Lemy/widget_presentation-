import 'package:flutter/material.dart';
import 'package:widget_presentation/screens/product_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Presentation',
      debugShowCheckedModeBanner: false,
      home: ProductDetails(),
    );
  }
}
