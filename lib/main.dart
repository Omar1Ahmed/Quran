import 'package:flutter/material.dart';
import 'package:quran/Core/helper/localDatabase/localDataBase_Service.dart';
import 'package:quran/Features/home/View/home_page_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SQLiteService().init();
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
      theme: ThemeData(),
      home: const HomePageScreen(),
    );
  }
}
