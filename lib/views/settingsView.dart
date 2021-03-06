import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kepler/cupertinopageroute.dart';
import 'package:kepler/controllers/settingsController.dart';
import 'package:kepler/locale/translations.dart';
import 'package:kepler/views/homeView.dart';
import 'package:kepler/widgets/cards/menuCard.dart';
import 'package:kepler/widgets/dialogs/languageDialog.dart';
import 'package:kepler/widgets/header/header.dart';
import 'package:kepler/widgets/snackbars/snackbars.dart';
import '../cupertinopageroute.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed("/home");
        return false;
      },
      child: GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (conf) => Scaffold(
          body: SingleChildScrollView(
              child: Stack(
            children: [
              Header(string.text("settings"), () {
                Navigator.of(context).push(route(HomeView()));
              }),
              Container(
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              width: Get.width / 2.8,
                              child: MenuCard(
                                text: string.text("current_language"),
                                onTap: () async {
                                  return Get.dialog(LanguageDialog());
                                },
                                icon: Icons.language,
                              )),
                          Container(
                            width: Get.width / 2.8,
                            child: MenuCard(
                              text: string.text("dark_mode"),
                              onTap: () {
                                Snackbars.development();
                              },
                              icon: Icons.brightness_5,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              width: Get.width / 2.8,
                              child: MenuCard(
                                text: string.text("credits"),
                                onTap: () async {
                                  Snackbars.development();
                                },
                                icon: Icons.assignment_ind,
                              )),
                          Container(
                            width: Get.width / 2.8,
                            child: MenuCard(
                              text: string.text("reset_favorites"),
                              onTap: () {
                                Snackbars.development();
                              },
                              icon: Icons.delete,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
