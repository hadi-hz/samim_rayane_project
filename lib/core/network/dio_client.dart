import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({Dio? dio})
      : dio = dio ?? Dio(BaseOptions(
          baseUrl: "https://raw.githubusercontent.com/PouriaMoradi021/countries-api/", 
          connectTimeout: const Duration(seconds: 10), 
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )) {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("🔵 Request: ${options.method} ${options.path}");
        print("🔹 Headers: ${options.headers}");
        print("🔹 Body: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("🟢 Response: ${response.statusCode} ${response.data}");
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        print("🔴 Error: ${error.message}");
        return handler.next(error);
      },
    ));
  }

   Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception("خطای دریافت اطلاعات: ${e.message}");
    }
  }
}