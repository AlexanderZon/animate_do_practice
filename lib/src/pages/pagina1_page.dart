import 'package:animate_do/animate_do.dart';
import 'package:animate_do_practice/src/pages/navegacion_page.dart';
import 'package:animate_do_practice/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
            delay: Duration(milliseconds: 200), child: Text('Animate_do')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TwitterPage()));
              },
              icon: FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            from: 50,
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => Pagina1Page()));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => NavegacionPage()));
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
                delay: Duration(milliseconds: 1100),
                child: Icon(Icons.new_releases, color: Colors.blue)),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Titulo',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                'Soy un texto pequeño',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 200,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
