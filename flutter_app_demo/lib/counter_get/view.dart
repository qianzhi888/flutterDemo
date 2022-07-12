import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterGetPage extends StatelessWidget {
  final logic = Get.put(CounterGetLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器-简单式"),
      ),
      body: Center(
        /// 分析下：GetBuilder这个方法
        /// init：虽然上述代码没用到，但是，这个参数是存在在GetBuilder中的，因为在加载变量的时候就使用Get.put()生成了CounterEasyGetLogic对象，
        /// GetBuilder会自动查找该对象，所以，就可以不使用init参数
        /// builder：方法参数，拥有一个入参，类型便是GetBuilder所传入泛型的类型
        /// initState，dispose等：GetBuilder拥有StatefulWidget所有周期回调，可以在相应回调内做一些操作
        child: GetBuilder<CounterGetLogic>(
          builder: (logic) {
            return Text(
              "点击了${logic.count}次",
              style: TextStyle(fontSize: 20),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          logic.increase();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
