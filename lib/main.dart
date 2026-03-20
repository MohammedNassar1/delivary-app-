import 'package:delivary_app/app_color.dart';
import 'package:delivary_app/main_screen.dart';
import 'package:delivary_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DelivaryApp());
}

class DelivaryApp extends StatelessWidget {
  const DelivaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: AppColors.primarySwatch,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
        ),
      ),
      home: MainScreen(),
      routes: {'/product': (context) => ProductDetailsPage()},
    );
  }
}
