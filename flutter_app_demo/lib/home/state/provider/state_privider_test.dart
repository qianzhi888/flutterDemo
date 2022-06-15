import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:provider/provider.dart';

class StateProviderDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProviderDemo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderDemo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("${counterProvider._count}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, RouterPath.providerPageDemo1);
            }, child: Text("跳转"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: counterProvider.incCount,
      ),
    );
  }
}


class CounterProviderDemo with ChangeNotifier{
  int _count = 0;//状态
  //获取状态
  int get count => _count;

  incCount(){
    _count++;
    //更新状态
    notifyListeners();
  }
}