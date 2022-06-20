import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

///轮播图
class SwiperWidget extends StatefulWidget {
  @override
  _SwiperWidgetState createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 2.0 / 1.0,
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "http://static.runoob.com/images/demo/demo2.jpg",
              fit: BoxFit.fill,
            );
          },
          itemCount: 3,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      ),
    );
  }
}
