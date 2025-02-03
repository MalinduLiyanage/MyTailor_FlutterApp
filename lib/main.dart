import 'package:flutter/material.dart';
import 'package:mytailor/pages/homePage.dart';
import 'package:provider/provider.dart';
import 'package:mytailor/changenotifiers/user.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDetailsProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
