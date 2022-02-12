import 'package:flutter/material.dart';
import '/screen/home_page.dart';
import '/utils/styles.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widasie Mariam',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[00],
        appBarTheme: const AppBarTheme(titleTextStyle: kAppBarTextStyle)
      ),
      home: const HomePage(),
    );
  }
}
