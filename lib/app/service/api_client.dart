import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shoplover_rider/app/core/connection_manager/connection_manager_controller.dart';
import 'package:shoplover_rider/app/service/api_end_point.dart';

import '../core/constants/app_constants.dart';

class ApiClient {
  Dio? dio;

  final _connectionController = Get.find<ConnectionManagerController>().obs;

  //final String _accessToken = '';

  ApiClient({String customBaseUrl = ''}) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: customBaseUrl.isNotEmpty ? customBaseUrl : ApiEndPoints.BASE_URL,
      connectTimeout: const Duration(seconds: 90),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.plain,
    );
    dio = Dio(baseOptions);
  }

  Future<Object?> get(
    String url,
    retry, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isLoaderRequired = false,
    bool isHeaderRequired = false,
  }) async {
    if (_connectionController.value.isInternetConnected.isTrue) {
      dio?.options.headers["isApp"] = true;
      if (kDebugMode) {
        logger.w(
            'URL:${ApiEndPoints.BASE_URL}$url\nQueryParameters: $queryParameters');
      }

      if (isLoaderRequired) {
        //Get.dialog(LoaderWidget(), barrierDismissible: false);
      }

    }
  }
}
