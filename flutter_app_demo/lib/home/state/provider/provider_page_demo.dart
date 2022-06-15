import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/state/provider/state_privider_test.dart';
import 'package:provider/provider.dart';

class ProviderPageDemo1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProviderDemo>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderPageDemo1",),
      ),
      body: Center(
        child: Text("${counterProvider.count}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: counterProvider.incCount,
      ),
    );
  }
}
