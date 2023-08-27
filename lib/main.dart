import 'package:animate_do_practice/src/pages/navegacion_page.dart';
import 'package:animate_do_practice/src/pages/pagina1_page.dart';
import 'package:animate_do_practice/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Pagina1Page(),
    );
  }
}
