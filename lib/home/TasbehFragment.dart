import 'package:flutter/material.dart';
import 'package:islami_app_mon/main.dart';
import 'dart:math' as Math;

class TasbehFragment extends StatefulWidget {
  @override
  _TasbehFragmentState createState() => _TasbehFragmentState();
}

class _TasbehFragmentState extends State<TasbehFragment> {
  int counter = 0;

  int currentTasbeh = 0;
  int angle = 0;
  List<String> tasbehList = ['الحمدلله', 'الله اكبر', 'سبحان الله'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                child: InkWell(
                    onTap: OnSebhaPressed,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                        ),
                        Transform.rotate(
                          angle: Math.pi / 180 * angle,
                          child: Container(
                          
                            child: Image.asset(
                              'assets/images/body_of_sebha.png',
                              height: 180,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                child: Image.asset('assets/images/head_of_sebha.png'),
                margin: EdgeInsets.only(left: 50),
              )
            ],
          ),
        ),
        Container(
            child: Text('عدد التسبيحات',
                style: TextStyle(fontSize: 25, color: MyThemeData.colorAccent)),
            margin: EdgeInsets.only(top: 20, bottom: 20)),
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Color.fromRGBO(200, 179, 150, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Text(
            '$counter',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.only(top: 8, bottom: 8, right: 14, left: 14),
          decoration: BoxDecoration(
              color: MyThemeData.colorPrimary,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Text(
            tasbehList[currentTasbeh],
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }

  OnSebhaPressed() {
    this.setState(() {
      counter++;
      angle += 20;
      if (counter % 33 == 0) {
        if (currentTasbeh == 2) {
          currentTasbeh = 0;
        } else
          currentTasbeh += 1;
      }
    });
  }
}
