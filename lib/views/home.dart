import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kepler/cupertinopageroute.dart';
import 'package:kepler/locale/translations.dart';
import 'package:kepler/views/chartsView.dart';
import 'package:kepler/views/explore/starsView.dart';
import 'package:kepler/views/favoritesView.dart';
import 'package:kepler/views/settingsView.dart';
import 'package:kepler/widgets/backgrounds/homeBackground.dart';
import 'package:kepler/widgets/cards/menuCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation _scaleanimation;
  AnimationController _scalecontroller;

  void initState() {
    _scalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _scaleanimation = Tween<double>(
      begin: 1,
      end: 0.97,
    ).animate(
      _scalecontroller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).push(route(SettingsView()));
                      }),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: Get.height / 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Kepler',
                                style: TextStyle(fontSize: 60),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Discover the universe',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    MenuCard(
                      onTap: () {
                        Navigator.of(context).push(route(StarsView()));
                      },
                      text: '${string.text("explore")}',
                      image: 'assets/images/explorebg.png',
                    ),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    MenuCard(
                      onTap: () {
                        Navigator.of(context).push(route(ChartsView()));
                      },
                      text: '${string.text("charts")}',
                      image: 'assets/images/chartsbg.png',
                    ),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    MenuCard(
                      onTap: () {
                        Navigator.of(context).push(route(FavoritesView()));
                      },
                      text: 'Favourites', //TODO: i18n
                      image: 'assets/images/favouritesbg.jpg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}