import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: () {
            setState(() {
              activar = true;
            });
          }),
      backgroundColor: Color(0xff1DA1F2),
      body: Center(
          child: ZoomOut(
              animate: activar,
              from: 30,
              duration: Duration(milliseconds: 1000),
              child: FaIcon(FontAwesomeIcons.twitter,
                  color: Colors.white, size: 40))),
    );
  }
}
