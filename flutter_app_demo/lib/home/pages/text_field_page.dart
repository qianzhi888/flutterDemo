import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  bool flag = true;
  int groupValue = 0;
  var sex;

  bool switchFlag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("常用表单页"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              TextField(
                ///是否隐藏内容
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    ///这个属性的文字可以向上浮动
                    labelText: "密码框"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "多行文本框"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  //labelText: "请输入用户名"
                  hintText: "请输入用户名",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Checkbox(value: flag, onChanged: (b) {}),
              CheckboxListTile(
                value: flag,
                onChanged: (b) {
                  this.setState(() {
                    this.flag = b!;
                  });
                },
                title: Text("CheckboxListTile"),
                subtitle: Text("多选框"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text("男："),
                  Radio(
                      value: 1,
                      groupValue: this.sex,
                      onChanged: (v) {
                        this.setState(() {
                          this.sex = v;
                        });
                      }),
                  SizedBox(
                    width: 20,
                  ),
                  Text("女："),
                  Radio(
                      value: 2,
                      groupValue: this.sex,
                      onChanged: (v) {
                        this.setState(() {
                          this.sex = v;
                        });
                      }),
                  Text("当前选中的是：${sex == 1 ? "男" : "女"}"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RadioListTile(
                value: 1,
                groupValue: this.sex,
                onChanged: (v) {
                  this.setState(() {
                    sex = v;
                  });
                },
                title: Text("标题1"),
                subtitle: Text("小标题1"),
                secondary: Icon(Icons.add),
              ),
              RadioListTile(
                value: 2,
                groupValue: this.sex,
                onChanged: (v) {
                  this.setState(() {
                    sex = v;
                  });
                },
                title: Text("标题2"),
                subtitle: Text("小标题2"),
                secondary: Icon(Icons.add),
              ),

              SizedBox(height: 40,),
              Switch(value: switchFlag, onChanged: (v){
                this.setState(() {
                  this.switchFlag = v;
                });
              })
            ],
          ),
        ),
      ),
    );
  }

  Radio buildRadioUseWidget() {
    return Radio(value: 0, groupValue: groupValue, onChanged: (b) {});
  }
}
