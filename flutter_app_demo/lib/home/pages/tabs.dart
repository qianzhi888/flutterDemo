import 'package:flutter/material.dart';
import 'package:flutter_app_demo/home/common/common_constant.dart';
import 'package:flutter_app_demo/home/common/router_path.dart';
import 'package:flutter_app_demo/home/pages/home_page.dart';
import 'package:flutter_app_demo/home/pages/category_page.dart';
import 'package:flutter_app_demo/home/pages/settings_page.dart';

///tab切换功能

class TabsPage extends StatefulWidget {
  final pageIndex;

  TabsPage({this.pageIndex = CommonConstant.homePageIndex}) {
    print(pageIndex);
  }

  @override
  HomeTabs createState() => HomeTabs(this.pageIndex);
}

class HomeTabs extends State<TabsPage> {
  ///当前页面 默认是首页0
  int pageIndex;

  HomeTabs(this.pageIndex);

  ///首页tab页面
  List mPageList = [HomePage(), CategoryPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutterDemo"),
      ),
      body: mPageList[pageIndex],
      floatingActionButton: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),

        ///浮动按钮
        child: FloatingActionButton(
          elevation: 0,
          child: Icon(Icons.add),
          ///利用三目运算设置颜色
          backgroundColor: pageIndex == CommonConstant.categoryPageIndex
              ? Colors.red
              : Colors.green,
          onPressed: () {
            print("FloatingActionButton");
            this.setState(() {
              pageIndex = CommonConstant.categoryPageIndex;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: pageIndex,
        onTap: (index) {
          this.setState(() {
            pageIndex = index;
          });
        },
        iconSize: 25,

        ///配置底部可以有多个按钮
        ///type: BottomNavigationBarType.fixed,
        ///选中颜色
        selectedItemColor: Colors.blue,

        ///未选中颜色
        //unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // Row(
            //   children: <Widget>[
            //     Expanded(
            //         child: DrawerHeader(
            //       child: Text("你好Flutter"),
            //       ///装饰组件
            //       decoration: BoxDecoration(
            //           color: Colors.yellow,
            //           image: DecorationImage(
            //               image: NetworkImage(
            //                   "https://www.itying.com/images/flutter/2.png"),
            //               fit: BoxFit.cover)),
            //     ))
            //   ],
            // ),

            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text("靳前志"),
                  accountEmail: Text("jinqianzhivvvip@126.com"),

                  ///CircleAvatar 圆形头像组件
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                  ),

                  ///右边内容
                  otherAccountsPictures: <Widget>[
                    Image.network(
                      "https://www.itying.com/images/flutter/4.png",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://www.itying.com/images/flutter/5.png",
                      fit: BoxFit.cover,
                    )
                  ],

                  otherAccountsPicturesSize: Size(50, 50),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("我的空间"),
            ),

            ///分隔线组件
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("设置中心"),
            ),

            ///分隔线组件
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.verified_user),
              ),
              title: Text("用户中心"),

              ///ListTile点击事件
              onTap: () {
                ///隐藏侧边栏
                Navigator.of(context).pop();
                Navigator.pushNamed(context, RouterPath.userPage);
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text("右侧侧边栏"),
      ),
    );
  }
}
