import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/state_management_demo.dart';


class StateManageDemo extends StatefulWidget {
  @override
  _StateManagerDemo createState() => _StateManagerDemo();
}

class _StateManagerDemo extends State<StateManageDemo> {
  int count = 0;

  void _increateCount() {
    this.setState(() {
      count += 1;
    });

    debugPrint("$count");
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: count,
      increateCount: _increateCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text("状态管理"),
          elevation: 0,
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increateCount,
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int count = CounterProvider
        .of(context)
        ?.count ?? 1;
    return ActionChip(
      onPressed: () {},
      label: Text("$count"),
    );
  }
}

///通过InheritedWidget来更新状态
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increateCount;

  CounterProvider(
      {required this.count, required this.increateCount, required super.child});

  ///普通写法
  // static CounterProvider of(BuildContext context){
  //   final CounterProvider? result =
  //   context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  //   assert(result != null, 'No CounterProvider found in context');
  //   return result!;
  // }

  ///表达式写法
  static CounterProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
