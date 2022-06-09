import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home_content9.dart';

///flutter中常见的按钮
class ButtonDemoPage extends StatefulWidget {
  @override
  _ButtonDemoPageState createState() => _ButtonDemoPageState();
}

class _ButtonDemoPageState extends State<ButtonDemoPage> {
  var text = "自定义按钮";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮演示页面"),
      ),
      ///浮动按钮
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,

        child: Icon(Icons.add,color: Colors.black,size: 44,),
        onPressed: (){
          print("FloatingActionButton");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text("普通按钮组件"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),

                  ///设置阴影
                  elevation: MaterialStateProperty.all(20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///给按钮固定宽高
              Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("设置宽高的按钮"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  // width: double.infinity,
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("自适应按钮"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(

                  ///onPressed置为null表示按钮不可点击
                  ///onPressed: null,
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  label: Text("图标按钮")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text("圆角按钮"),

                ///通过shape设置
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("圆形按钮"),

                  ///通过shape设置
                  style: ButtonStyle(

                      ///设置为无水泼纹
                      // splashFactory: NoSplash.splashFactory,
                      ///水泼纹
                      //splashFactory: InkSplash.splashFactory,
                      shape: MaterialStateProperty.all(
                          CircleBorder(side: BorderSide(color: Colors.blue)))),
                ),
              ),
              SizedBox(
                width: 20,
              ),

              ///FlatButton过时了，用TextButton
              TextButton(
                onPressed: () {},
                child: Text(
                  "TextButton",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),

              SizedBox(
                width: 20,
              ),

              OutlinedButton(
                  onPressed: () {},

                  ///通过side设置边框颜色
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.blue))),
                  child: Text("OutlinedButton")),
              SizedBox(
                width: 20,
              ),

              ///图片按钮
              IconButton(onPressed: () {}, icon: Icon(Icons.add))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      height: 50,
                      margin: EdgeInsets.all(16),
                      child:
                          OutlinedButton(onPressed: () {}, child: Text("注册"))))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///ButtonBar按钮组
              ButtonBar(
                children: <Widget>[
                  ElevatedButton(onPressed: () {}, child: Text("登录")),
                  ElevatedButton(onPressed: () {}, child: Text("注册")),
                  CustomizeButton(
                    width: 120.0,
                    height: 40.0,
                    pressed: () {
                      setState(() {
                        print("点击了自定义按钮");
                        text = "点击了自定义按钮";
                      });
                    },
                    text: text,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomizeButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;

  CustomizeButton(
      {this.width = 80.0,
      this.height = 30.0,
      this.text = "按钮",
      this.pressed = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          ///接口会调
          this.pressed();
        },
        child: Text(text),
      ),
    );
  }
}
