import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:shoplover_rider/app/core/connection_manager/connection_manager_controller.dart';
import 'package:shoplover_rider/app/core/utils/helper/app_helper.dart';
import 'package:shoplover_rider/app/service/api_end_point.dart';

import '../core/common/widgets/app_widgets.dart';
import '../core/constants/app_constants.dart';
import '../core/style/app_colors.dart';

class ApiClient {
  Dio? dio;

  final _connectionController =
      getX.Get.find<ConnectionManagerController>().obs;

  final String _accessToken = '';

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
        AppHelper().showLoader();
      }

      try {
        if (isHeaderRequired) {
          //dio?.options.headers["Authorization"] = _accessToken;
          dio?.options.headers["language"] = "en";
        }

        var response = await dio?.get(url, queryParameters: queryParameters);
        logger.w(
            'URL:  $url\nQueryParameters: $queryParameters\nResponse: $response');

        if (isLoaderRequired) {
          await Future.delayed(const Duration(seconds: 1));
          AppHelper().hideLoader();
        }
        return response;
      } on DioException catch (e) {
        // handelException(e);
        AppHelper().hideLoader();
        if (!isHeaderRequired &&
            !e.response.toString().contains("<!DOCTYPE html>")) {
          return e.response;
        } else {
          printCatch(e, retry);
          return null;
        }
      }
    }
  }

  Future<Response?> post(
    // context,
    String url,
    data,
    retry, {
    Map<String, dynamic>? headers,
    bool isHeaderRequired = false,
    bool isLoaderRequired = false,
    bool isFormData = false,
    bool isJsonEncodeRequired = true,
    bool isFileUpload = false,
    bool isMultipart = false,
    Map<String, dynamic>? mQueryParameters,
  }) async {
    //todo make compatible with GetX

    if (_connectionController.value.isInternetConnected.isTrue) {
      if (isLoaderRequired) {
        AppHelper().showLoader();
      }
      /* AppHelper().showLoader();
    AppHelper().hideKeyboard();*/
      dio?.options.headers["isApp"] = true;

      try {
        if (isHeaderRequired) {
          // token = accessToken.$;
          if (isFileUpload) {
            dio?.options.baseUrl = ApiEndPoints.IMAGE_UPLOAD_URL;
          }
          dio?.options.headers["Authorization"] = _accessToken;
          dio?.options.headers["Content-Type"] =
              !isMultipart ? "application/json" : "multipart/form-data";
        }
        if (kDebugMode) {
          logger.i(
              'before formData URL: ${dio?.options.baseUrl}$url Data:$data token: $_accessToken');
        }

        FormData formData = FormData.fromMap(isFormData ? data : {});

        if (kDebugMode) {
          logger.i(
              'URL:${dio?.options.baseUrl}$url Data:$data token: $_accessToken');
        }

        var response = await dio?.post(url,
            data: isFormData
                ? formData
                : data == null
                    ? null
                    : isJsonEncodeRequired
                        ? jsonEncode(data)
                        : data,
            queryParameters: mQueryParameters);

        if (kDebugMode) {
          logger.i('URL:  $url\nData: $data\nResponse: $response');
        }

        AppHelper().hideLoader();
        return response;
      } on DioException catch (e) {
        logger.e(e.response);
        //handelException(e);
        AppHelper().hideLoader();
        if (!isHeaderRequired &&
            !e.response.toString().contains("<!DOCTYPE html>")) {
          return e.response;
        } else if (e.response?.statusCode == 403 ||
            e.response?.statusCode == 400) {
          return e.response;
        } else {
          printCatch(e, retry);
          return null;
        }
      }
    } else {
      AppWidgets().getSnackBar(
          title: "Info",
          message: "No internet! Please connect your internet connection.",
          backgroundColor: AppColors.white,
          colorText: AppColors.textColor);
    }
    return null;
  }

  Future<Object?> put(
    // BuildContext context,
    String url,
    data,
    retry, {
    Map<String, dynamic>? headers,
    bool isHeaderRequired = true,
    bool isLoaderRequired = false,
    Map<String, dynamic>? mQueryParameters,
  }) async {
    if (_connectionController.value.isInternetConnected.isTrue) {
      dio?.options.headers["isApp"] = true;

      if (isLoaderRequired) {
        AppHelper().showLoader();
      }
      //todo make compatible with GetX
      /* AppHelper().showLoader();
    AppHelper().hideKeyboard();*/
      try {
        if (isHeaderRequired) {
          // token = accessToken.$;
          dio?.options.headers["Authorization"] = _accessToken;
          dio?.options.headers["Content-Type"] = "application/json";
        }
        if (kDebugMode) {
          debugPrint('URL:  $data');
        }
        var response = await dio?.put(
          url,
          data: data,
          // options: Options(contentType: Headers.formUrlEncodedContentType),
          queryParameters: mQueryParameters,
        );
        if (kDebugMode) {
          logger.i('URL:  $url\nData: $data\nResponse: $response');
        }
        AppHelper().hideLoader();
        return response;
      } on DioException catch (e) {
        AppHelper().hideLoader();
        if (!isHeaderRequired &&
            !e.response.toString().contains("<!DOCTYPE html>")) {
          return e.response;
        } else {
          printCatch(e, retry);
          return null;
        }
      }
    } else {
      AppWidgets().getSnackBar(
          title: "Info",
          message: "No internet! Please connect your internet connection.",
          backgroundColor: AppColors.white,
          colorText: AppColors.textColor);
    }
    return null;
  }

  Future<Response?> delete(
    // BuildContext context,
    String url,
    retry, {
    Map<String, dynamic>? mQueryParameters,
    Map<String, dynamic>? headers,
    bool isHeaderRequired = false,
    bool isLoaderRequired = false,
  }) async {
    if (_connectionController.value.isInternetConnected.isTrue) {
      dio?.options.headers["isApp"] = true;

      if (isLoaderRequired) {
        AppHelper().showLoader();
      }

      if (kDebugMode) {
        logger.i(
            'URL:  ${ApiEndPoints.BASE_URL}$url\nQueryParameters: $mQueryParameters');
      }
      //todo make compatible with GetX
      /* AppHelper().showLoader();
    AppHelper().hideKeyboard();*/
      try {
        if (isHeaderRequired) {
          dio?.options.headers["Authorization"] = _accessToken;
          dio?.options.headers["Content-Type"] = "application/json";

          /*  dio?.options.headers["Authorization"] = token;
        dio?.options.headers["language_code"] =
            "en"; // todo need to fix get lang code dynamically later*/
        }

        Response? response = await dio?.delete(
          url,
          queryParameters: mQueryParameters,
        );
        logger.w(
            'URL:  $url\nQueryParameters: $mQueryParameters\nResponse: $response');
        // await Future.delayed(const Duration(seconds: 3));
        AppHelper().hideLoader();
        return response;
      } on DioException catch (e) {
        AppHelper().hideLoader();
        if (!isHeaderRequired &&
            !e.response.toString().contains("<!DOCTYPE html>")) {
          return e.response;
        } else {
          printCatch(e, retry);
          return null;
        }
      }
    } else {
      AppWidgets().getSnackBar(
          title: "Info",
          message: "No internet! Please connect your internet connection.",
          backgroundColor: AppColors.white,
          colorText: AppColors.textColor);
    }
    return null;
  }

  Future<void> printCatch(DioException e, retry) async {
    if (kDebugMode) {
      logger.w('printCatch:  ${e.response?.statusCode}');
    }

    if (e.response?.statusCode == HttpStatus.internalServerError) {
      if (kDebugMode) {
        logger
            .w('printCatch: Internal Server Error: ${e.response?.statusCode} ');
      }
    }

    if (e.response?.statusCode == 400) {
      AppHelper().logout();
    } else if (e.response?.statusCode == 401) {
      /*MyWidgets().showSimpleDialog(
          context, "Unauthenticated", "Please login again", retry);*/

      // if(kDebugMode){
      //   AppWidgets().getSnackBar(
      //       title: "Info",
      //       message: "Login session expired. You have to login again.");
      // }

      // await Future.delayed(const Duration(seconds: 2));
      // AppHelper().logout();

      await AppHelper().refreshLogin();
      // await retry;
    } else if (e.response?.statusCode == 503) {
      AppWidgets().getSnackBar(
          title: "Info",
          message: "Unable Connect with server. Please try again later.");
    } else {
      //TODO clear
      /* AppWidgets().showSimpleDialog(context, "Failed",
          "Something went wrong. Please try again later.", retry);*/
      /*  message:
      "Something went wrong. Please try again later.\nStatus Code: ${e.response != null ? e.response?.statusCode : ""}",
*/
      // FlightUpdateErrorModel error =
      //     flightUpdateErrorModelFromJson(e.response?.data);

      // AppWidgets().getSnackBar(
      //     title: "Failed",
      //     // message: "Something went wrong. Please try again later.",
      //     message: e.response!.data != null ? jsonDecode(e.response!.data)["message"].toString() : "error.message",
      //     waitingTime: 5,
      //     backgroundColor: AppColors.red);
    }
    if (e.response != null) {
      if (kDebugMode) {
        logger.w('Error Response data:  ${e.response?.data}');
        logger.w('Error Response headers:  ${e.response?.headers}');
        logger.w('Error Response statusCode:  ${e.response?.statusCode}');
      }
    } else {
      if (kDebugMode) {
        logger.w('Error Response message:  ${e.message}');
      }
    }
  }

  handelException(DioException e) {
    /*    try {
      List<ErrorResponse> errorResponse =
          errorResponseFromJson(e.response.toString());
      for (var element in errorResponse) {
        AppWidgets().getSnackBar(
            waitingTime: 4,
            title: element.status,
            message: element.message,
            backgroundColor: AppColors.red);
      }
    } catch (e) {
      printLog("catch e: $e", level: "e");
    }*/
  }
}
