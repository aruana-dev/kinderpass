import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCallgetFilteredEvents';

/// Start buildship Group Code

class BuildshipGroup {
  static String baseUrl = 'https://oov5wo.buildship.run';
  static Map<String, String> headers = {};
  static ValidateMobileCall validateMobileCall = ValidateMobileCall();
  static ValidateEmailCall validateEmailCall = ValidateEmailCall();
  static SendWelcomeEmailCall sendWelcomeEmailCall = SendWelcomeEmailCall();
  static UpdateEventPreviewCall updateEventPreviewCall =
      UpdateEventPreviewCall();
  static UploadAudioCall uploadAudioCall = UploadAudioCall();
}

class ValidateMobileCall {
  Future<ApiCallResponse> call({
    String? mobile = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'validateMobile',
      apiUrl: '${BuildshipGroup.baseUrl}/validateMobile',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'mobile': mobile,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ValidateEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'validateEmail',
      apiUrl: '${BuildshipGroup.baseUrl}/validateEmail',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SendWelcomeEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'sendWelcomeEmail',
      apiUrl: '${BuildshipGroup.baseUrl}/sendWelcomeEmail',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateEventPreviewCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? mediaURL = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateEventPreview',
      apiUrl: '${BuildshipGroup.baseUrl}/updateEventPreview',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'mediaURL': mediaURL,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UploadAudioCall {
  Future<ApiCallResponse> call({
    String? base64String = '',
  }) async {
    final ffApiRequestBody = '''
{
  "audio": "$base64String"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadAudio',
      apiUrl: '${BuildshipGroup.baseUrl}/uploadAudio',
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

/// End buildship Group Code

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
