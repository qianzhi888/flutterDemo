import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/theme_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog"),
      ),
      body: Column(children: <Widget>[
        ElevatedButton(
            onPressed: () {
              _showSimpleDialog();
            },
            child: Text("showSimpleDialog")),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              _showAlertDialog();
            },
            child: Text("showAlertDialog")),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              _showModalBottomSheet();

              Fluttertoast.showToast(
                  msg: "提示信息",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: Text("showModalBottomSheet")),
        SizedBox(
          height: 30,
        ),
      ]),
    );
  }

  _showSimpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("弹窗标题"),
            children: <Widget>[
              ListTile(
                title: Text("用户"),
                subtitle: Text("熊大"),
                leading: Icon(Icons.home),
              ),
              SimpleDialogOption(
                child: Text("OptionA"),
                onPressed: () {
                  print("OptionA");
                  Navigator.pop(context, "A");
                },
              ),
              Divider(
                height: 1.0,
                color: ThemeColors.color999999,
              ),
              SimpleDialogOption(
                child: Text("OptionB"),
                onPressed: () {
                  print("OptionB");
                  Navigator.pop(context, "B");
                },
              ),
              Divider(
                height: 1.0,
                color: ThemeColors.color999999,
              ),
              SimpleDialogOption(
                child: Text("OptionC"),
                onPressed: () {

                  print("OptionC");
                  Navigator.pop(context, "C");
                },
              ),
            ],
          );
        });

    print("执行完成结果为：$result");
  }

  _showDialog() async {
    var dialog = await showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            color: Colors.blue,
          );
        });
  }

  _showAlertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息！"),
            content: Text("你确定要删除吗？"),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, "取消");
                  },
                  child: Text("取消")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, "确定");
                  },
                  child: Text("确定")),
            ],
          );
        });

    print("_showAlertDialog: $result");
  }

  _showModalBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: [
                ListTile(
                  title: Text("分享"),
                  onTap: () {
                    Navigator.pop(context, "分享");
                    Fluttertoast.showToast(
                        msg: "分享",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
                Divider(
                  height: 1,
                  color: ThemeColors.color999999,
                ),
                ListTile(
                    title: Text("下载"),
                    onTap: () {
                      Navigator.pop(context, "下载");
                      Fluttertoast.showToast(
                          msg: "下载",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
                Divider(
                  height: 1,
                  color: ThemeColors.color999999,
                ),
                ListTile(
                    title: Text("保存"),
                    onTap: () {
                      Navigator.pop(context, "保存");
                      Fluttertoast.showToast(
                          msg: "保存",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
                Divider(
                  height: 1,
                  color: ThemeColors.color999999,
                ),
                ListTile(
                    title: Text("关闭"),
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "关闭",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ],
            ),
          );
        });

    print("$result");
  }
}
