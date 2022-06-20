
import 'package:flutter_screenutil/flutter_screenutil.dart';
///对三方库进一步封装 原因：为了防止三方库更新后调用方法更改，导致原来的调用方式无法使用
///这样就会导致所有涉及到的地方都要更改，但做了一层封装后仅仅更改这里边就可以了
class ScreenAdapter{
  static init(context){
    ScreenUtil.init(context);
  }

  static height(){
  }
}


///这样可以自定义扩展 (on 类型)  的方法
extension ScreenSize on num{
  double get myW => ScreenUtil().setWidth(this);
  double get myH => ScreenUtil().setHeight(this);
  double get mySp => ScreenUtil().setSp(this);
}

extension StringUtil on String{
  String get trim => this.trim();
}