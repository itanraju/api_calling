import 'dart:io';

import 'package:dio/dio.dart';

class DioClient {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  DioClient(this._dio) {
    // if (kDebugMode) {
    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: true));
    // }
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    required Options options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on SocketException catch (e) {
      //print(e.toString());
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      //Logger().e("Error::${e.toString()}");
    } catch (e) {
      //print("ERROR:::::");
      //print(e);
      throw e;
    }
  }
  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (e) {
      //print("Error::${e.toString()}");
      throw FormatException();
    } catch (e) {
      throw e;
    }
  }

  // PUT:----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    required Map<String, dynamic> queryParameters,
    required Options options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (e) {
      //Logger().e("Error::${e.toString()}");
      throw FormatException();
    } catch (e) {
      throw e;
    }
  }

  // DELETE:----------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    required Map<String, dynamic> queryParameters,
    required Options options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on FormatException catch (e) {
      //Logger().e("Error::${e.toString()}");
      throw FormatException();
    } catch (e) {
      throw e;
    }
  }
}
