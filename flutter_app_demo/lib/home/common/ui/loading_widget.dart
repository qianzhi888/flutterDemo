import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0x80000000),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "加载中...",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 16,),
            CircularProgressIndicator(
              strokeWidth: 4.0,
            )
          ],
        ),
      ),
    );
  }
}
