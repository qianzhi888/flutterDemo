import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/ui/loading_widget.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('loadingPage'),
        ),
        body: Stack(
          children: <Widget>[
             Positioned(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  color: Colors.yellow,
                  child: ListTile(
                    title: Text("标题"),
                    subtitle: Text("小标题"),
                    leading: Icon(Icons.access_alarms_outlined),
                  ),
                )),

            Positioned(child: LoadingWidget()),
          ],
        ));
  }
}
