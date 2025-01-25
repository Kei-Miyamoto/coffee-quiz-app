import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start QuizSession Group Code

class QuizSessionGroup {
  static String getBaseUrl() => 'https://quiz-app-api-o7q8.onrender.com';
  static Map<String, String> headers = {};
  static PostQuizSessionAPICall postQuizSessionAPICall =
      PostQuizSessionAPICall();
  static PutQuizSessionAPICall putQuizSessionAPICall = PutQuizSessionAPICall();
  static GetQuizSessionAPICall getQuizSessionAPICall = GetQuizSessionAPICall();
}

class PostQuizSessionAPICall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? mode,
    int? categoryId,
    int? quizType,
  }) async {
    final baseUrl = QuizSessionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "category_id": $categoryId,
  "mode": $mode,
  "quiz_type": $quizType
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostQuizSessionAPI',
      apiUrl: '$baseUrl/quiz_sessions/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PutQuizSessionAPICall {
  Future<ApiCallResponse> call({
    int? score,
    int? totalQuestions,
    int? quizSessionId,
  }) async {
    final baseUrl = QuizSessionGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "score": $score,
  "total_questions": $totalQuestions,
  "quiz_sesssion_id": $quizSessionId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PutQuizSessionAPI',
      apiUrl: '$baseUrl/quiz_sessions/$quizSessionId',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuizSessionAPICall {
  Future<ApiCallResponse> call({
    int? mode,
    int? categoryId,
    String? userId = '',
    int? limit,
    int? offset,
  }) async {
    final baseUrl = QuizSessionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetQuizSessionAPI',
      apiUrl: '$baseUrl/quiz_sessions/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End QuizSession Group Code

/// Start Category Group Code

class CategoryGroup {
  static String getBaseUrl() => 'https://quiz-app-api-o7q8.onrender.com';
  static Map<String, String> headers = {};
  static GetCategoryAPICall getCategoryAPICall = GetCategoryAPICall();
}

class GetCategoryAPICall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CategoryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetCategoryAPI',
      apiUrl: '$baseUrl/categories/',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Category Group Code

/// Start Question Group Code

class QuestionGroup {
  static String getBaseUrl() => 'https://quiz-app-api-o7q8.onrender.com';
  static Map<String, String> headers = {};
  static GetQuestionAPICall getQuestionAPICall = GetQuestionAPICall();
  static RetrieveQuestionAPICall retrieveQuestionAPICall =
      RetrieveQuestionAPICall();
}

class GetQuestionAPICall {
  Future<ApiCallResponse> call({
    String? limit = '',
    int? offset,
    String? categoryId = '',
    String? testType = '',
  }) async {
    final baseUrl = QuestionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetQuestionAPI',
      apiUrl: '$baseUrl/questions/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': limit,
        'category_id': categoryId,
        'test_type': testType,
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveQuestionAPICall {
  Future<ApiCallResponse> call({
    int? questionId,
  }) async {
    final baseUrl = QuestionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'RetrieveQuestionAPI',
      apiUrl: '$baseUrl/questions/$questionId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Question Group Code

/// Start QuizSessionDetail Group Code

class QuizSessionDetailGroup {
  static String getBaseUrl() => 'https://quiz-app-api-o7q8.onrender.com';
  static Map<String, String> headers = {};
  static PostQuizSessionDetailAPICall postQuizSessionDetailAPICall =
      PostQuizSessionDetailAPICall();
  static GetQuizSessionDetailAPICall getQuizSessionDetailAPICall =
      GetQuizSessionDetailAPICall();
}

class PostQuizSessionDetailAPICall {
  Future<ApiCallResponse> call({
    int? quizSessionId,
    int? questionId,
    String? answer = '',
    String? isCorrect = '',
  }) async {
    final baseUrl = QuizSessionDetailGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "quiz_session_id": $quizSessionId,
  "question_id": $questionId,
  "answer": "${escapeStringForJson(answer)}",
  "is_correct": ${escapeStringForJson(isCorrect)}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostQuizSessionDetailAPI',
      apiUrl: '$baseUrl/quiz_session_details/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuizSessionDetailAPICall {
  Future<ApiCallResponse> call({
    int? quizSessionId,
  }) async {
    final baseUrl = QuizSessionDetailGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetQuizSessionDetailAPI',
      apiUrl: '$baseUrl/quiz_session_details/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'quiz_session_id': quizSessionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End QuizSessionDetail Group Code

/// Start UserMistake Group Code

class UserMistakeGroup {
  static String getBaseUrl() => 'https://quiz-app-api-o7q8.onrender.com';
  static Map<String, String> headers = {};
  static PostUserMistakeAPICall postUserMistakeAPICall =
      PostUserMistakeAPICall();
  static GetUserMistakeAPICall getUserMistakeAPICall = GetUserMistakeAPICall();
}

class PostUserMistakeAPICall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? questionId,
  }) async {
    final baseUrl = UserMistakeGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "question_id": $questionId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostUserMistakeAPI',
      apiUrl: '$baseUrl/user_mistakes/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserMistakeAPICall {
  Future<ApiCallResponse> call({
    int? limit,
    int? offset,
    int? mistakeCount,
    String? lastMistakenAfter = '',
    String? lastMistakenBefore = '',
    String? userId = '',
  }) async {
    final baseUrl = UserMistakeGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetUserMistakeAPI',
      apiUrl: '$baseUrl/user_mistakes/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
        'limit': limit,
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End UserMistake Group Code

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
