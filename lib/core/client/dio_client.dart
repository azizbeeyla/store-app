import 'package:dio/dio.dart';
import 'package:store_app/core/client/result.dart';

import '../interceptor.dart';

class ApiClient {
  ApiClient({required this.interceptor}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.11.96:8888/api/v1",
        validateStatus: (status) => true,
      ),
    )..interceptors.add(interceptor);
  }

  final AuthInterceptor interceptor;
  late final Dio _dio;

  Future<Result<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParams,
      }) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data as T);
      }
      return Result.error(Exception(response.data));
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result> post(
      String path, {
        required Map<String, dynamic> data,
      }) async {
    try {
      var response = await _dio.post(
        path,
        data: data,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data);
      } else {
        return Result.error(Exception(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> patch(
      String path, {
        required Map<String, dynamic> data,
      }) async {
    try {
      var response = await _dio.patch(
        path,
        data: data,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data);
      } else {
        return Result.error(Exception(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> put(
      String path, {
        required Map<String, dynamic> data,
      }) async {
    try {
      var response = await _dio.put(
        path,
        data: data,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data);
      } else {
        return Result.error(Exception(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> delete(
      String path, {
        Map<String, dynamic>? data,
      }) async {
    try {
      var response = await _dio.delete(
        path,
        data: data,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Result.ok(response.data);
      } else {
        return Result.error(Exception(response.data));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
