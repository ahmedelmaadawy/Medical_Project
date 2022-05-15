// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical_project/drawer.dart';

class FeverQuestions extends StatefulWidget {
  @override
  State<FeverQuestions> createState() => _FeverQuestionsState();
}

class _FeverQuestionsState extends State<FeverQuestions> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Fever'),
        
      ),
      body: Column(
      ),
    );
  }
}
