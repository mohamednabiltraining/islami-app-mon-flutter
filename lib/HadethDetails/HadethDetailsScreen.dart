import 'package:flutter/material.dart';
import 'package:islami_app_mon/home/HadethFragment.dart';

import '../main.dart';

class HadethDetailsScreen extends StatelessWidget {
  static final String ROUTE_NAME ='hadeth_details';
  @override
  Widget build(BuildContext context) {
    var hadethArg = ModalRoute.of(context).settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png')
          )
      ),
      child: Scaffold(
          appBar: AppBar(title: Text(hadethArg.title,
            style: TextStyle(color: MyThemeData.colorAccent),),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
                color: Theme.of(context).accentColor
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children:[ Container(
              margin: EdgeInsets.only(top: 50,left: 12,right: 12,bottom: 8),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 254, 254, .7),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
              Container(
                margin: EdgeInsets.only(top: 50,left: 12,right: 12,bottom: 8),
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(hadethArg.content,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 24,
                    ),),
                ),
              )
            ],
          )
      ),
    );
  }
}
