import 'dart:convert';
import 'dart:io';
import 'package:core_http/index.dart';
import 'package:core_http/net/interceptor.dart';
import 'package:core_tools/log_utils.dart';
import 'package:dio/dio.dart';
import '../common/http_common_constant.dart';
import '../protocol/base_resp.dart';

/// 请求方法.
class Method {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    required this.status,
    required this.message,
    required this.data,
    required this.version,
    required this.options,
  });

  /// BaseResp [String status]字段 key, 默认：status.
  String status;

  /// BaseResp [String version]字段 key, 默认：version.
  String version;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// BaseResp [String message]字段 key, 默认：message.
  String message;

  /// Options.
  Options options;
}

/// 单例 DioUtil.
/// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
class DioUtil {
  static final DioUtil _singleton = DioUtil._init();
  static Dio? _dio;

  /// BaseResp [String status]字段 key, 默认：status.
  String _statusKey = "status";

  /// BaseResp [String version]字段 key, 默认：version.
  String _versionKey = "version";

  /// BaseResp [String msg]字段 key, 默认：message.
  String _msgKey = "message";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  /// 是否是debug模式.
  static bool _isDebug = false;

  DioUtil._init() {
    _dio = Dio();
  }

  /// get dio.
  Dio getDio() => _dio ?? Dio();

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  static DioUtil getInstance() => _singleton;

  factory DioUtil() => _singleton;

  /// set Config.
  void setConfig(HttpConfig config) {
    _statusKey = config.status;
    _versionKey = config.version;
    _msgKey = config.message;
    _dataKey = config.data;

    _setDefOptions();
  }

  /// 使用选项发出 http 请求。
  /// [method] 请求方法。 默认POST请求
  /// [path] 网址路径。
  /// [reqData] 请求数据
  /// [options] 请求选项。
  /// <BaseResp<T> 返回 状态码消息数据。
  Future<BaseResp<T>> request<T>(String path,
      {String method = Method.post,
      reqData,
      Options? options,
      CancelToken? cancelToken}) async {
    Response? response = await _dio?.request(path,
        data: reqData,
        options: _checkOptions(method, getDefOptions()),
        cancelToken: cancelToken);
    int? status;
    String? version;
    String? msg;
    T? data;
    if (response != null) {
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        try {
          if (response.data is Map) {
            status = (response.data[_statusKey] is int)
                ? response.data[_statusKey]
                : HttpCommonConstant.statusSuccess;

            version = (response.data[_versionKey] is String)
                ? response.data[_versionKey]
                : response.data[_versionKey].toString();

            msg = response.data[_msgKey];

            data = response.data[_dataKey];
          } else {
            Map<String, dynamic> dataMap = _decodeData(response);
            status = (dataMap[_statusKey] is int) ? dataMap[_statusKey] : 1;
            version = (dataMap[_versionKey] is String)
                ? int.tryParse(dataMap[_versionKey])
                : dataMap[_versionKey];
            msg = dataMap[_msgKey];
            data = dataMap[_dataKey];
          }
          return BaseResp(
              status: status, version: version, message: msg, data: data);
        } catch (e) {
          LogUtils.e(e, tag: "响应异常 ==> ");
          return Future.error(DioError(
            response: response,
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
          ));
        }
      }
    }

    return Future.error(DioError(
      response: response,
      type: DioErrorType.response,
      requestOptions: response!.requestOptions,
    ));
  }

  /// 使用选项发出 http 请求。
  /// [method] 请求方法。
  /// [path] 网址路径。
  /// [reqData] 请求数据
  /// [options] 请求选项。
  /// <BaseRespR<T> 返回 状态码消息数据响应。
  Future<BaseRespR<T>> requestR<T>(String path,
      {String method = Method.post,
      reqData,
      Options? options,
      CancelToken? cancelToken}) async {
    Response? response = await _dio?.request(path,
        data: reqData,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    int? status;
    String? version;
    String? msg;
    T? data;
    if (response != null) {
      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        try {
          if (response.data is Map) {
            status = (response.data[_statusKey] is int)
                ? response.data[_statusKey]
                : HttpCommonConstant.statusSuccess;

            version = (response.data[_versionKey] is String)
                ? int.tryParse(response.data[_versionKey])
                : response.data[_versionKey];

            msg = response.data[_msgKey];

            data = response.data[_dataKey];
          } else {
            Map<String, dynamic> dataMap = _decodeData(response);
            status = (dataMap[_statusKey] is int)
                ? dataMap[_statusKey].toString()
                : dataMap[_statusKey];
            version = (dataMap[_versionKey] is String)
                ? int.tryParse(dataMap[_versionKey])
                : dataMap[_versionKey];
            msg = dataMap[_msgKey];
            data = dataMap[_dataKey];
          }
          return BaseRespR(response,
              status: status, data: data, version: version, message: msg);
        } catch (e) {
          return Future.error(DioError(
            response: response,
            type: DioErrorType.response,
            requestOptions: response.requestOptions,
          ));
        }
      }
    }
    return Future.error(DioError(
      response: response,
      type: DioErrorType.response,
      requestOptions: response!.requestOptions,
    ));
  }

  /// 下载文件并将其保存在本地。默认的http方法是“GET”，可以自定义 [Options.method].
  /// [urlPath]: 文件网址。
  /// [savePath]: 以后保存下载文件的路径。
  /// [onProgress]: 监听下载进度的回调，参考 [OnDownloadProgress].
  // Future<Response> download(
  //     String urlPath,
  //     savePath, {
  //       OnDownloadProgress onProgress,
  //       CancelToken cancelToken,
  //       data,
  //       Options options,
  //     }) {
  //   return _dio.download(urlPath, savePath,
  //       onProgress: onProgress,
  //       cancelToken: cancelToken,
  //       data: data,
  //       options: options);
  // }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response.data == null || response.data.toString().isEmpty) {
      return {};
    }
    return json.decode(response.data.toString());
  }

  /// check Options.
  Options _checkOptions(method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  /// create new dio.
  DioUtil createNewDio() => DioUtil();

  /// get Def Options.
  static Options getDefOptions() {
    Options options = Options();
    options.contentType = ContentType.parse("application/json").toString();
    options.receiveTimeout = 1000 * 30;
    return options;
  }

  /// 设置默认选项
  void _setDefOptions() {
    if (_dio != null) {
      _dio?.options = BaseOptions(
          baseUrl: _isDebug
              ? HttpCommonConstant.baseDebugUrl
              : HttpCommonConstant.baseReleaseUrl,
          contentType: ContentType.parse("application/json").toString(),
          receiveTimeout: 1000 * 30);

      // 添加拦截器
      _dio?.interceptors.add(ZMNEncryptionInterceptor());
      if (_isDebug) {
        _dio?.interceptors.add(ZMNLogInterceptor());
      }
    }
  }
}
