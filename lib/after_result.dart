// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/animia_result.dart';
import 'package:medical_project/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/result.dart';
import 'package:medical_project/test_values.dart';
import 'Network/local/diohelper.dart';
import 'result.dart';

class AfterResult extends StatefulWidget {
  final List<ResultModel> results;

  const AfterResult({Key? key, required this.results}) : super(key: key);
  @override
  State<AfterResult> createState() => _AfterResultState();
}

class _AfterResultState extends State<AfterResult> {
  static String result = "";
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[300],
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    buildResulItem(widget.results[index]),
                separatorBuilder: (context, index) => Container(
                  height: 8.0,
                ),
                itemCount: widget.results.length,
              ),
            ),
          ),
          Container(
            color: Colors.blue[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    // );
                    setState(() {
                      DioHelper.getData(
                        path: "/mainmodels/anemiaclassify/?",
                        queryPara: {
                          "hemoglobin": widget.results[2].value.toString(),
                          "mch": widget.results[5].value.toString(),
                          "mchc": widget.results[6].value.toString(),
                          "mcv": widget.results[4].value.toString(),
                          "gender": '0'
                        }
                        // "gender": isMale ? '0' : '1'
                        ,
                      ).then((value) {
                        print("\n\nSTATUS::::: ${value.statusCode}\n\n");
                        result =
                            value.data['results']['Animea Test'].toString();
                        print("result:::: $result");
                      }).catchError((error) {
                        print("Errororor" + error.toString());
                      });
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimiaResult(
                                  result: result,
                                )));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  color: Colors.blue[800],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
