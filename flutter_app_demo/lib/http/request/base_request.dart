import 'package:flutter/material.dart';

enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() {
    return "www.wanandroid.com";
  }

  HttpMethod httpMethod();

  String path();

  String requestUrl() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, pathParams);
    }else{
      uri = Uri.http(authority(), pathStr, pathParams)
    }
    uri.toString();
    debugPrint("url = ${uri.toString()}");
    return uri.toString();
  }

  bool needLogin();
  Map<String,String> params = {};
  ///添加参数
  BaseRequest add(String k,String v){
    params[k] = v.toString();
    return this;
  }

  Map<String,dynamic> header = {};
  ///添加header
  BaseRequest addHeader(String k,String v){
    header[k] = v.toString();
    return this;
  }
}
