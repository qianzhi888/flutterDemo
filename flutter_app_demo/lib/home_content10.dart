import 'package:flutter/material.dart';
import 'package:flutter_app_demo/res/list_data_bean.dart';

///StatefulWidget 当需要改动页面数据的时候使用  比如点击按钮改变文字等  效果可见：HomePageState1 、 HomePageState2
///StatelessWidget 无状态组件，无法改变组件的状态
// class MyDemoApp10 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return;
//   }
// }

class HomePage extends StatelessWidget {
  int countNum = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: HomeContent2(),
      ),
    );
  }
}

///自定义有状态组件
class HomeContent2 extends StatefulWidget {
  @override
  State createState() => HomePageState2();
}

class HomePageState2 extends State<HomeContent2>{
  List<String> list = [];
  int num = 1;

  Widget getItemView(context,index){
    return Column(
      children: <Widget>[Text("data")],
    );
  }

  @override
  Widget build(BuildContext context) {
    //return ListView.builder(itemCount: listDatas.length,itemBuilder: getItemView);
    return ListView(
      children: <Widget>[
        Column(
          children: list.map((value){
            return ListTile(
              title: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: ElevatedButton(onPressed: (){
            setState(() {
              list.add("新增内容$num");
              num++;
            });
          }, child: Text("按钮"),
            style: ButtonStyle(),
          ),
        )

      ],
    );
  }

}

class HomePageState1 extends State<HomeContent2> {
  int countNum = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100,),
        Chip(label: Text("当前数量：${countNum}")),
        ElevatedButton(
            onPressed: () {
              ///如果需要调用的方法不提示，可以加this来调用
              this.setState(() {
                countNum++;
              });

            },
            child: Text("按钮"))
      ],
    );
  }
}

class HomeContent1 extends StatelessWidget {
  int countNum = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Text("$countNum"),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: () {
        }, child: Text("按钮"))
      ],
    );
  }
}
