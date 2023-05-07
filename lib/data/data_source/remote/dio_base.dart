import 'package:dio/dio.dart';
import 'package:mocs/utils/constants/endPoint.dart';

class DioBase {
  static Dio? dio;
  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
        ));
    dio?..options.connectTimeout = 1 * 8000
       ..options.receiveTimeout = 10 * 10000;
    dio?.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      responseBody: true,
    ));
    return dio;
  }



   Future<Response?> getData({
    required String url,
    Map<String, dynamic> ? query,
    String ? token,
  }) async {
    dio?.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await dio?.get(url, queryParameters: query );
  }


   Future<Response?> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
     String  ? token,
  }) async {
    dio?.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
    };
    return dio?.post(url , data: data,queryParameters: query);
  }

  Future<Response?> postFavouriteAdnCart({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String  ? token,
  }) async {
    dio?.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio?.post(url , data: data,queryParameters: query);
  }

   Future<Response?> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    dio?.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio?.put(url, data: data,queryParameters: query);
  }
}
