import 'package:flutter/material.dart';
import 'package:islami_app_mon/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami_app_mon/home/HadethFragment.dart';
import 'package:islami_app_mon/suraDetails/SuraDetailsScreen.dart';

class HadethTitleWidget extends StatelessWidget{
  Hadeth hadeth;
  HadethTitleWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.ROUTE_NAME,
        arguments: hadeth);
      },
      child: Center(
        child: Text(hadeth.title,style: TextStyle(fontSize: 24),),
      ),
    );
  }

}