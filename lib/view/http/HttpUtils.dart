import 'package:dio/dio.dart';
import 'package:simpleflutter/config/PrefsConfig.dart';
import 'package:simpleflutter/widget/SPUntil.dart';

/*
 * 网络请求封装
 */
class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  Options options;

  static HttpUtil getInstance() {
    print('getInstance');
    if (instance == null) {
      instance = new HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    print('dio赋值');
    // 或者通过传递一个 `options`来创建dio实例
    options = Options(
      // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
//      baseUrl: "https://baidu.com",
      baseUrl: "https://test-hantalk.hanmaker.com/",

      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: {
        "HC-ACCESS-TOKEN":
        "czo2MDoiY2RjNE41NWl3VkF0RjZXaUxOZk5zUDhLelNzeDVjZGpnSUoxMDhOSGNoWTREbkdIelRKMVdNcGc3akZrIjs="
      },
    );
    dio = new Dio(options);
  }
    _getToken() async {
   return await SPUntil.getString(PrefsConfig.Token);
  }

  get(url, Function callback,
      {data, options, cancelToken, Function errorcallback}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.get(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      print('get请求成功!response.data：${response.data}');
      _request(response, callback, errorcallback: errorcallback);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
  }

  post(url, Function callback,
      {data, options, cancelToken, Function errorcallback}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功!response.data：${response.data}');
      _request(response, callback, errorcallback: errorcallback);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
  }

  _request(Response response, Function httpcallback, {Function errorcallback}) {
    int statusCode;
    String errorMsg = "";
    statusCode = response.statusCode;
    if (statusCode < 0) {
      errorMsg = "网络请求错误,状态码:" + statusCode.toString();
      errorcallback(errorMsg);
      return;
    }
    if (httpcallback != null) {
      if (response.data["code"] == 200) {
        httpcallback(response.data["data"]);
      } else {
        errorcallback(response.data["message"]);
      }
    }
  }
}
