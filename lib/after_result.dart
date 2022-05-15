// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/result.dart';
import 'result.dart';

class AfterResult extends StatefulWidget {
  @override
  State<AfterResult> createState() => _AfterResultState();
}

class _AfterResultState extends State<AfterResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          LocaleKeys.medical_test.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.blue[300],
        child: ListView.separated(
          itemBuilder: (context, index) => buildResulItem(),
          separatorBuilder: (context, index) => Container(
            height: 8.0,
          ),
          itemCount: 10,
        ),
      ),
      bottomSheet: Container(
        color: Colors.blue[800],
        height: 50.0,
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => AfterResult()),
            // );
          },
          child: Text(
            LocaleKeys.next_button.tr(),
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
