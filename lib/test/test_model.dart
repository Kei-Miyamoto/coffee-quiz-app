import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (PostQuizSessionAPI)] action in Test widget.
  ApiCallResponse? quizSessionInfo;
  // Stores action output result for [Backend Call - API (GetQuestionAPI)] action in Test widget.
  ApiCallResponse? questionsInfo;
  // Stores action output result for [Backend Call - API (PostUserMistakeAPI)] action in Container widget.
  ApiCallResponse? postUserMistakeInfo;
  // Stores action output result for [Backend Call - API (PostQuizSessionDetailAPI)] action in Container widget.
  ApiCallResponse? quizSessionDetailInfo;
  // Stores action output result for [Backend Call - API (PutQuizSessionAPI)] action in Container widget.
  ApiCallResponse? putQuizSessionInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
