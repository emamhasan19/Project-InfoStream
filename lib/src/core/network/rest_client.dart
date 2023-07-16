// ignore_for_file: constant_identifier_names, equal_keys_in_map

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:info_stream/src/core/exceptions/error_model.dart';
import 'package:info_stream/src/core/exceptions/network_exception.dart';
import 'package:info_stream/src/core/logger.dart';
import 'package:info_stream/src/core/services/local_storage/cache_service.dart';
import 'package:info_stream/src/core/text_constants.dart';
import 'package:info_stream/src/core/values.dart';

import 'api_end_points.dart';
import 'pretty_dio_logger.dart';

class RestClient {
  late Dio _dio;
  final connectionTimeout = 30000;
  final receiveTimeout = 30000;

  RestClient() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiEndPoints.base,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
    );
    _dio = Dio(options);
  }

  Future<Response<dynamic>> get(
    APIType apiType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers, // Add authToken parameter
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);

    return _dio
        .get(path, queryParameters: data, options: standardHeaders)
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> post(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .post(
          path,
          data: data,
          options: standardHeaders,
          queryParameters: queryParams,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  /// Supports media upload
  Future<Response<dynamic>> postFormData(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    standardHeaders.headers?.addAll({
      'Content-Type': 'multipart/form-data',
    });

    return _dio
        .post(
          path,
          data: FormData.fromMap(data),
          options: standardHeaders,
          queryParameters: queryParams,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> patch(
    APIType api,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(api);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .patch(
          path,
          data: data,
          options: standardHeaders,
          queryParameters: queryParams,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> put(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .put(
          path,
          data: data,
          options: standardHeaders,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> delete(
    APIType apiType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .delete(
          path,
          data: data,
          queryParameters: queryParams,
          options: standardHeaders,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  /// Supports media upload
  Future<Response<dynamic>> putFormData(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll({
        'Content-Type': 'multipart/form-data',
      });
    }
    data.addAll({
      '_method': 'PUT',
    });

    return _dio
        .post(
          path,
          data: FormData.fromMap(data),
          options: standardHeaders,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  /// Upload file in s3bucket
  Future<Response> fileUploadInS3Bucket({
    required String preAssignedUrl,
    required File file,
  }) async {
    return _dio.put(
      preAssignedUrl,
      data: file.openRead(),
      options: Options(
        headers: {
          Headers.contentLengthHeader: await file.length(),
        },
      ),
    );
  }

  dynamic _getDioException(error) {
    if (error is DioError) {
      _dioError(error);
    } else {
      throw UnexpectedException(000, 'Something went wrong. Please try again.');
    }
  }

  //ignore: long-method
  void _dioError(DioError error) {
    Log.error(
      'DIO ERROR: ${error.type} ENDPOINT: ${error.requestOptions.baseUrl}${error.requestOptions.path}',
    );
    String endPoint = error.requestOptions.path;

    switch (error.type) {
      case DioErrorType.cancel:
        throw RequestCancelledException(
          001,
          TextConstants.defaultErrorMessage,
        );
      case DioErrorType.connectTimeout:
        ErrorResponseModel errorModel = ErrorResponseModel(
          error: ErrorModel(
            code: ExceptionConstant.exc408.toString(),
            message: TextConstants.couldNotConnectToServer,
          ),
        );

        throw RequestTimeoutException(errorModel);
      case DioErrorType.other:
        throw DefaultException(
          ErrorResponseModel(
            error: ErrorModel(
              code: '500',
              message: TextConstants.defaultErrorMessage,
            ),
          ),
        );
      case DioErrorType.receiveTimeout:
        throw ReceiveTimeoutException(
          004,
          TextConstants.couldNotConnectToServer,
        );
      case DioErrorType.sendTimeout:
        ErrorResponseModel errorModel = ErrorResponseModel(
          error: ErrorModel(
            code: ExceptionConstant.exc408.toString(),
            message: TextConstants.couldNotConnectToServer,
          ),
        );

        throw RequestTimeoutException(errorModel);
      case DioErrorType.response:
        ErrorResponseModel errorModel = ErrorResponseModel.fromJson(
          error.response!.data,
        );

        String message = errorModel.error!.message!;
        _networkException(errorModel, error.response?.statusCode, message,
            endPoint: endPoint);
    }
  }

  void _networkException(
    ErrorResponseModel errorModel,
    int? statusCode,
    String message, {
    required String endPoint,
  }) {
    switch (statusCode) {
      case 400:
        throw NetworkException(
            ExceptionConstant.exc400, errorModel.error?.message, "");

      case 403:
        throw UnauthorisedException(403, message);
      case 401:
        throw UnauthorisedException(401, message);
      case 404:
        throw NotFoundException(errorModel);
      case 409:
        throw ConflictException(409, message);
      case 500:
        throw InternalServerException(500, message);
      case 502:
        throw BadGatewayException(errorModel);
      default:
        throw DefaultException(
          ErrorResponseModel(
            error: ErrorModel(
              code: '500',
              message: TextConstants.defaultErrorMessage,
            ),
          ),
        );
    }
  }

  void _setDioInterceptorList() {
    List<Interceptor> interceptorList = [];
    _dio.interceptors.clear();

    if (kDebugMode) {
      interceptorList.add(PrettyDioLogger());
    }
    _dio.interceptors.addAll(interceptorList);
  }

  Future<Options> _getOptions(APIType api) async {
    String? token = await CacheService.instance.retrieveBearerToken();
    switch (api) {
      case APIType.PUBLIC:
        return PublicApiOptions().options;

      case APIType.PROTECTED:
        return ProtectedApiOptions(token!).options;

      default:
        return PublicApiOptions().options;
    }
  }
}

abstract class ApiOptions {
  Options options = Options();
}

//PUBLIC => Generic API url without access token
//PROTECTED => Generic API url with access token
enum APIType { PUBLIC, PROTECTED }

class PublicApiOptions extends ApiOptions {
  PublicApiOptions() {
    super.options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
  }
}

class ProtectedApiOptions extends ApiOptions {
  ProtectedApiOptions(String apiToken) {
    super.options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': apiToken,
    };
  }
}
