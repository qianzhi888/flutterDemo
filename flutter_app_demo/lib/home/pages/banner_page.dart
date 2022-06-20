import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/theme_colors.dart';
import 'package:flutter_app_demo/home/common/ui/swiper_widget.dart';
import 'package:flutter_app_demo/home/common/util/screen_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  Widget _titleWidget(value) {
    return Container(
      height: 20.myH,
      margin: EdgeInsets.only(left: 15.myW, top: 15.myH),
      decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.red, width: 4.myW))),
      child: Text(
        value,
        style: TextStyle(color: ThemeColors.color333333, fontSize: 18.mySp),
      ),
    );
  }

  Widget _getItem(context,index){
    var color;
     if(index%2==0){
       color = Colors.black;
    }else{
       color = Colors.red;
    }
    return Container(width: 100.myW,height: 30.myH,color: color,);
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenAdapter.init(context);

    ///通过mediaQuery适配全面屏、状态栏的适配
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SwiperWidget(),
              SizedBox(
                height: 10.myH,
              ),
              _titleWidget("猜你喜欢"),
              SizedBox(
                height: 10.myH,
              ),
              _titleWidget("热门推荐"),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15.myH, 0, 0),
                color: Colors.white,
                height: 80.myH,
                width: double.infinity,//自适应
                child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: _getItem,itemCount: 10,),
              )
            ],
          ),
        ),
      ),
    );


    ///SafeArea 安全区，可以实现全面屏、状态栏的适配
    // return SafeArea(
    //   child: Container(
    //     // color: Colors.white,
    //     decoration: BoxDecoration(color: Colors.white),
    //     // padding: EdgeInsets.fromLTRB(0, padding.top, 0, padding.bottom),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Text("顶部",style: TextStyle(fontSize: 20),),
    //         Text("底部"),
    //       ],
    //     ),
    //   ),
    // );
  }
}
