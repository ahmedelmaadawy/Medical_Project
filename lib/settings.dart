// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical_project/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String currentLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          LocaleKeys.settings.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // color: Colors.blue[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                LocaleKeys.general.tr(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(LocaleKeys.select_language.tr()),
                    // content: const Text('You Have To Choose A Photo First'),
                    actions: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () async {
                                await context.setLocale(Locale('en'));
                                setState(() {
                                  currentLanguage = 'English';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('English'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await context.setLocale(Locale('ar'));
                                setState(() {
                                  currentLanguage = '??????????????';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('??????????????'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.language_outlined,
                        size: 30.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.language.tr(),
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black87),
                          ),
                          Text(
                            currentLanguage,
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        currentLanguage == 'English'
                            ? Icons.keyboard_arrow_right
                            : Icons.keyboard_arrow_left,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
