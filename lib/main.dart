import 'package:flutter/material.dart';
import 'package:storeapp/pages/home_page.dart';
import 'package:storeapp/pages/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
      routes: {
        MyHomePage.id: (context) => const MyHomePage(),
        UpdateProductPage.id: (context) =>  UpdateProductPage(),
      },
      initialRoute: MyHomePage.id,
    );
  }
}
