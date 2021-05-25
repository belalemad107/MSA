import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OutPut extends StatefulWidget {
  @override
  _OutPutState createState() => _OutPutState();
  final List<dynamic> Output;
  OutPut({Key key, @required this.Output}) : super(key: key);
}

class _OutPutState extends State<OutPut> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "The Output :",
                  style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(" "),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
              child: Container(
                  height: 150,
                  padding:
                      EdgeInsets.only(right: 5, left: 5, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            widget.Output[0],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 5,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.007,
                          ),
                          Text(
                            widget.Output[1],
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 5),
                          ),
                          SizedBox(
                            height: height * 0.007,
                          ),
                          Text(widget.Output[2],
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 5)),
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 160),
              child: Text(
                "Msa_Score   :  " + widget.Output[3].toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
