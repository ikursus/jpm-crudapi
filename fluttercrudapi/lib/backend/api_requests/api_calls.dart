import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UsersListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Users List',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserStoreCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? phone = '',
    String? password = '',
  }) {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "phone": "${phone}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Store',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserUpdateCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? phone = '',
    String? password = '',
    int? id,
    String? role = '',
  }) {
    final ffApiRequestBody = '''
{
  "id": "${id}",
  "name": "${name}",
  "email": "${email}",
  "phone": "${phone}",
  "password": "${password}",
  "role": "${role}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Update',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users/${id}',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserDeleteCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Delete',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users/${id}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserShowCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Show',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users/${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserUploadCall {
  static Future<ApiCallResponse> call({
    int? id,
    FFUploadedFile? photo,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User Upload',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users/${id}/photo',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'photo': photo,
        'id': id,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserLoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Login',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserSignatureCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? signature = '',
  }) {
    final ffApiRequestBody = '''
{
  "id": "${id}",
  "signature": "${signature}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User Signature',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/signature/${id}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserSearchCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'User Search',
      apiUrl: 'https://laravelflutterapi.ikursus.com/api/users/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
