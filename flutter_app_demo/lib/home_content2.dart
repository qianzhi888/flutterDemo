import 'package:flutter/material.dart';

class MyDemoApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutterDemo"),
        ),
        body: HomeContent2(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //child: ImageContainer()1,
      child: ImageContainer2(),
    );
  }
}

class ImageContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      ///通过clipOval实现圆角
      child: ClipOval(
        child: Image.asset(
          'images/ic_test_image.jpeg',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ImageContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      ///图片组件
      width: 300,
      height: 300,

      ///利用Decoration给图片设置圆角
      decoration: const BoxDecoration(
          color: Colors.red,

          ///设置圆形 但内容会超出去
          borderRadius: BorderRadius.all(Radius.circular(150)),

          ///在DecorationImage中需要使用NetworkImage来加载图片
          image: DecorationImage(
              image: NetworkImage(
                  "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg"),
              fit: BoxFit.cover)),

      ///图片组件
      // child: Image.network(
      //     "https://lmg.jj20.com/up/allimg/1114/113020142315/201130142315-1-1200.jpg",
      //   alignment: Alignment.bottomRight,
      //   //color: Colors.blue,
      //   //colorBlendMode: BlendMode.screen,
      //
      //   ///设置图片铺满 不变形，可能会剪裁
      //   // fit: BoxFit.cover,
      //   // fit: BoxFit.fitHeight,
      //
      //   ///设置图片平铺
      //   // repeat: ImageRepeat.repeatY,
      // ),
    );
  }
}
