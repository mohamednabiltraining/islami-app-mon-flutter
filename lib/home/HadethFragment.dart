import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_mon/home/widgets/HadethTitleWidget.dart';

class HadethFragment extends StatefulWidget {
  @override
  _HadethFragmentState createState() => _HadethFragmentState();
}

class _HadethFragmentState extends State<HadethFragment> {
  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }
  @override
  Widget build(BuildContext context) {
    //loadHadethFile();
    return Column(
      children: [
        Expanded(flex:1,child: Image.asset('assets/images/hadeth_logo.png')),
        Expanded(flex:4,
        child: hadethList.length==0?
          Center(child: CircularProgressIndicator()):
          ListView.separated(
            itemBuilder: (context,index){
              return HadethTitleWidget(hadethList[index]);
            },
            itemCount: hadethList.length,
            separatorBuilder: (context,index){
              return Container(height: 1,color: Theme.of(context).primaryColor,
                margin: EdgeInsets.symmetric(horizontal: 12),
              );
            },
          )
          ,
        )
      ],
    );
  }

  List<Hadeth> hadethList = [];

  void loadHadethFile()async{
    List<Hadeth> list= [];
    String fileContent = await rootBundle.loadString('assets/content/ahadeth.txt');
    // line splitter -- \n -- \r\n
    List<String> allHadethConent = fileContent.split('#\r\n');
    print(allHadethConent.length);
    for(int i=0;i<allHadethConent.length;i++){
      String hadethContent = allHadethConent[i];
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0];// title
      String content = '';
      for(int j =1;j<hadethLines.length;j++){
        content = content+ ' '+hadethLines[j];
      }
      Hadeth hadeth = Hadeth(title: title,content: content);
      list.add(hadeth);
    }

    setState(() {
      hadethList=list;
    });
  }
}

class Hadeth{
  String title;
  String content;
  Hadeth({this.title,this.content});

}