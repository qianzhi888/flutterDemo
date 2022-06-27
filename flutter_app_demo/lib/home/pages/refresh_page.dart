import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/theme_colors.dart';
import 'package:flutter_app_demo/home/common/util/screen_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RefreshPage extends StatefulWidget {
  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  var cityNames = [
    '北京',
    '上海',
    '郑州',
    '安阳',
    '广州',
    '重庆',
    '滑县',
    '南京',
    '江苏',
    '濮阳',
    '鹤壁',
    '东北',
    '黑龙江',
    '哈尔滨',
    '内蒙古'
  ];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _loadData() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      List<String> list = List.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    ScreenAdapter.init(context);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 45.myH,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "列表页",
            style: TextStyle(color: ThemeColors.color333333, fontSize: 18.sp),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              itemBuilder: _getItem,
              itemCount: cityNames.length,
            ),
          ),
        ));
  }

  Future<Null> _handleRefresh() async {
    debugPrint('refresh');
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  Widget _getItem(context, index) {
    debugPrint("${index}");
    return InkWell(
      onTap: (){
        Fluttertoast.showToast(
            msg: "点击了第${index+1}条数据",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      child: Container(
        height: 80.myH,
        margin: EdgeInsets.only(bottom: 5.myH),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.teal),
        child: Text(
          cityNames[index],
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
