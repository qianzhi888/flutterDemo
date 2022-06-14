package com.jqz.flutter_app_demo

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import org.devio.flutter.splashscreen.SplashScreen

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        //启动屏插件
        //SplashScreen.show(this, true)
        super.onCreate(savedInstanceState)
        //GeneratedPluginRegistrant.registerWith(this)
    }
}
