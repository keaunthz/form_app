import 'package:flutter/material.dart';
import 'package:register_form/theme/app_theme.dart';
import 'package:register_form/views/form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.mainTheme,
      home: const FormPage(title: 'Form Page'),
    );
  }
}
