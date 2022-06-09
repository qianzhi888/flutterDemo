import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
class DateWidgetPage extends StatefulWidget {
  @override
  _DateWidgetPageState createState() => _DateWidgetPageState();
}

class _DateWidgetPageState extends State<DateWidgetPage> {
  ///获取系统当前日期
  var dateTime = DateTime.now();

  ///获取当前时分
  //var timeOfDuy = TimeOfDay.now();
  var timeOfDuy = TimeOfDay(hour: 12, minute: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期组件"),
      ),
      body: Column(
        children: <Widget>[
          ///转换时间戳
          Text("${dateTime.millisecondsSinceEpoch}"),

          ///时间戳转日期
          Text(
              "系统当前时间：${formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd])}"),

          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("选择时间：$dateTime"),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: () {
              ///打开日期组件
              _showDatePicker2();
            },
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("当前时分：${timeOfDuy.format(context)}"),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            onTap: () {
              ///打开日期组件
              _showTimePicker();
            },
          ),

          SizedBox(
            height: 30,
          ),
          Text("三方日期组件"),

          InkWell(
            child: Text("2022"),
            onTap: (){
              // _showFlutterDatePicker();
            },
          )
        ],
      ),
    );
  }

  _showDatePicker() {
    ///initialDate当前日期  firstDate开始日期   lastDate结束日期
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
      locale: Locale('zh'),
    ).then((value) => {print("showDatePicker: $value")});
  }

  ///异步获取
  _showDatePicker2() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
      locale: Locale('zh'),
    );
    this.setState(() {
      dateTime = result!;
    });
    print("_showDatePicker2: $result");
  }

  ///async 异步  await 等待异步完成
  _showTimePicker() async {
    var result = await showTimePicker(
      context: context,
      initialTime: timeOfDuy,
    );
    this.setState(() {
      timeOfDuy = result!;
    });
  }


  // String _format = 'yyyy-MMMM-dd';
  // var _dateTime;
  // void _showFlutterDatePicker() {
  //   DatePicker.showDatePicker(
  //     context,
  //     onMonthChangeStartWithFirstDate: true,
  //     pickerTheme: DateTimePickerTheme(
  //       showTitle: true,
  //       confirm: Text('确定', style: TextStyle(color: Colors.blue)),
  //       cancel: Text('取消', style: TextStyle(color: Colors.grey)),
  //     ),
  //     minDateTime: DateTime.parse("1980-06-06"),
  //     maxDateTime: DateTime.parse("2100-06-06"),
  //     initialDateTime: DateTime.now(),
  //     dateFormat: _format,
  //     locale: DateTimePickerLocale.zh_cn,
  //     onClose: () => print("----- onClose -----"),
  //     onCancel: () => print('onCancel'),
  //     onChange: (dateTime, List<int> index) {
  //       setState(() {
  //         _dateTime = dateTime;
  //       });
  //     },
  //     onConfirm: (dateTime, List<int> index) {
  //       setState(() {
  //         _dateTime = dateTime;
  //       });
  //     },
  //   );
  // }
}
