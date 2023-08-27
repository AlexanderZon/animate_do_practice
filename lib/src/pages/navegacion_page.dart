import 'package:animate_do/animate_do.dart';
import 'package:animate_do_practice/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animate_do'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pink,
        onPressed: () {
          final notiModel =
              Provider.of<_NotificationModel>(context, listen: false);
          int numero = notiModel.numero;
          numero++;
          if (numero >= 2) {
            final controller = notiModel.bounceController;
            controller.forward(from: 0.0);
          }
          notiModel.numero = numero;
        });
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
              label: 'Notifications',
              icon: Stack(
                children: [
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0,
                    right: 0,
                    // child: Icon(
                    //   Icons.brightness_1,
                    //   size: 8,
                    //   color: Colors.redAccent,
                    // ),
                    child: BounceInDown(
                      from: 10,
                      animate: numero > 0,
                      child: Bounce(
                        from: 10,
                        controller: (controller) =>
                            Provider.of<_NotificationModel>(context)
                                .bounceController = controller,
                        child: Container(
                          child: Text('$numero',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold)),
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          BottomNavigationBarItem(
              label: 'My dog', icon: FaIcon(FontAwesomeIcons.dog))
        ]);
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => this._numero;

  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
