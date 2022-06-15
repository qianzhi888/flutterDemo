// import 'package:flutter/material.dart';
// import 'package:flutter_app_demo/home/common/state_management_less_demo.dart';
// import 'package:scoped_model/scoped_model.dart';
// ///通过ScopedModel来更新状态 TODO 使用编译器提示不支持null安全
//
// class StateManageDemo2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModel(
//       model: CounterModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("状态管理"),
//           elevation: 0,
//         ),
//         body: CounterWrapper(),
//         floatingActionButton: ScopedModelDescendant<CounterModel>(
//           rebuildOnChange: false,
//           builder: (context, _, model) =>
//               FloatingActionButton(
//                 child: Icon(Icons.add),
//                 onPressed: model.increateCount,
//               ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class CounterWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Counter(),
//     );
//   }
// }
//
// class Counter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModelDescendant<CounterModel>(builder: (context,_,model)=>ActionChip(
//       onPressed: model.increateCount,
//       label: Text("${model.count}"),
//     ));
//   }
// }
//
// class CounterModel extends Model {
//   int _count = 0;
//
//   int get count => _count;
//
//   void increateCount() {
//     _count += 1;
//     notifyListeners();
//   }
// }