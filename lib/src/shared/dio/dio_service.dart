import 'dart:convert';

import 'package:http_cache_objectbox_store/http_cache_objectbox_store.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recetas_aplazo/src/core/env.dart';
import 'package:dio/dio.dart';

class DioService {
  /// Dio instance
  static final Dio _dio = Dio(BaseOptions(baseUrl: Env.apiUrl, responseType: ResponseType.bytes));
  static bool _booted = false;

  Dio get dio => _dio;

  /// Boot default configs for global dio instance,
  static Future<void> boot() async {
    if (_booted) return;
    _booted = true;

    final docsDir = await getApplicationDocumentsDirectory();
    final cacheStore = ObjectBoxCacheStore(storePath: docsDir.path);
    // await cacheStore.clean();
    _dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: cacheStore,
          policy: CachePolicy.forceCache,
          priority: CachePriority.high,
          maxStale: const Duration(minutes: 10),
        ),
      ),
    );
  }

  /// Handle HTTP GET request
  Future<({Response response, dynamic json})> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    final json = utf8.decode(response.data, allowMalformed: true);
    final data = jsonDecode(json);
    return (response: response, json: data);
  }
}
