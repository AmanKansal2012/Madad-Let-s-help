import 'package:flutter/foundation.dart';
import 'package:madad/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madad/views/receiver.dart';

import '../utils/constants.dart';
import 'donor.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                  width:MediaQuery.of(context).size.width,
                    child: Text(
                      "मदद -Let's help each other",
                      style: kTitle1.copyWith(color: kColorC,),
                    ),
                  ),
                ),
              ),
              backgroundColor: kColorD,
              centerTitle: true,
            )), backgroundColor: kColorB,
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Container(
                        child: Text(
                      "Donate your plasma/blood and be a means to serve people in this pandemic !!",
                      style: kTitle1.copyWith(color:kColorD,),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                                border: Border.all(color: kColorA),
                                borderRadius: BorderRadius.circular(40.0),
                                color: kColorA),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40.0), ),
                              color: kColorA,
                              splashColor: kColorD.withOpacity(0.1),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Donor()),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child:Image.asset("asset/icon/donor.png",
                                    width: 215,
                                    height: 315,)
                              ),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(color: kColorA),
                                color: kColorA),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40.0), ),
                              color: kColorA,
                              splashColor: kColorD.withOpacity(0.1),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Receiver()),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Image.asset("asset/icon/reciver.png",
                                  width: 215,
                                  height: 315,)
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
