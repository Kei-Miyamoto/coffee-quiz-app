import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _trueFlg = prefs.getString('ff_trueFlg') ?? _trueFlg;
    });
    _safeInit(() {
      _categoryList = prefs.getStringList('ff_categoryList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _categoryList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _questionSessionList = [];
  List<dynamic> get questionSessionList => _questionSessionList;
  set questionSessionList(List<dynamic> value) {
    _questionSessionList = value;
  }

  void addToQuestionSessionList(dynamic value) {
    questionSessionList.add(value);
  }

  void removeFromQuestionSessionList(dynamic value) {
    questionSessionList.remove(value);
  }

  void removeAtIndexFromQuestionSessionList(int index) {
    questionSessionList.removeAt(index);
  }

  void updateQuestionSessionListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    questionSessionList[index] = updateFn(_questionSessionList[index]);
  }

  void insertAtIndexInQuestionSessionList(int index, dynamic value) {
    questionSessionList.insert(index, value);
  }

  int _selectedCategoryId = 0;
  int get selectedCategoryId => _selectedCategoryId;
  set selectedCategoryId(int value) {
    _selectedCategoryId = value;
  }

  int _mode = 0;
  int get mode => _mode;
  set mode(int value) {
    _mode = value;
  }

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
  }

  int _currentQuestionNumber = 0;
  int get currentQuestionNumber => _currentQuestionNumber;
  set currentQuestionNumber(int value) {
    _currentQuestionNumber = value;
  }

  int _currentScore = 0;
  int get currentScore => _currentScore;
  set currentScore(int value) {
    _currentScore = value;
  }

  int _currentAnsweredNumber = 0;
  int get currentAnsweredNumber => _currentAnsweredNumber;
  set currentAnsweredNumber(int value) {
    _currentAnsweredNumber = value;
  }

  List<dynamic> _quizSessionDetailList = [];
  List<dynamic> get quizSessionDetailList => _quizSessionDetailList;
  set quizSessionDetailList(List<dynamic> value) {
    _quizSessionDetailList = value;
  }

  void addToQuizSessionDetailList(dynamic value) {
    quizSessionDetailList.add(value);
  }

  void removeFromQuizSessionDetailList(dynamic value) {
    quizSessionDetailList.remove(value);
  }

  void removeAtIndexFromQuizSessionDetailList(int index) {
    quizSessionDetailList.removeAt(index);
  }

  void updateQuizSessionDetailListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    quizSessionDetailList[index] = updateFn(_quizSessionDetailList[index]);
  }

  void insertAtIndexInQuizSessionDetailList(int index, dynamic value) {
    quizSessionDetailList.insert(index, value);
  }

  String _trueFlg = 'true';
  String get trueFlg => _trueFlg;
  set trueFlg(String value) {
    _trueFlg = value;
    prefs.setString('ff_trueFlg', value);
  }

  String _currentAnswer = '';
  String get currentAnswer => _currentAnswer;
  set currentAnswer(String value) {
    _currentAnswer = value;
  }

  List<dynamic> _resultQuizSessionList = [];
  List<dynamic> get resultQuizSessionList => _resultQuizSessionList;
  set resultQuizSessionList(List<dynamic> value) {
    _resultQuizSessionList = value;
  }

  void addToResultQuizSessionList(dynamic value) {
    resultQuizSessionList.add(value);
  }

  void removeFromResultQuizSessionList(dynamic value) {
    resultQuizSessionList.remove(value);
  }

  void removeAtIndexFromResultQuizSessionList(int index) {
    resultQuizSessionList.removeAt(index);
  }

  void updateResultQuizSessionListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    resultQuizSessionList[index] = updateFn(_resultQuizSessionList[index]);
  }

  void insertAtIndexInResultQuizSessionList(int index, dynamic value) {
    resultQuizSessionList.insert(index, value);
  }

  List<String> _resultMessage = [
    '頑張ろう！',
    'あともう一息',
    '継続は力なり。',
    'いい感じ！',
    '目指せ満点'
  ];
  List<String> get resultMessage => _resultMessage;
  set resultMessage(List<String> value) {
    _resultMessage = value;
  }

  void addToResultMessage(String value) {
    resultMessage.add(value);
  }

  void removeFromResultMessage(String value) {
    resultMessage.remove(value);
  }

  void removeAtIndexFromResultMessage(int index) {
    resultMessage.removeAt(index);
  }

  void updateResultMessageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    resultMessage[index] = updateFn(_resultMessage[index]);
  }

  void insertAtIndexInResultMessage(int index, String value) {
    resultMessage.insert(index, value);
  }

  bool _apiCallFlag = false;
  bool get apiCallFlag => _apiCallFlag;
  set apiCallFlag(bool value) {
    _apiCallFlag = value;
  }

  List<dynamic> _userMistakeList = [];
  List<dynamic> get userMistakeList => _userMistakeList;
  set userMistakeList(List<dynamic> value) {
    _userMistakeList = value;
  }

  void addToUserMistakeList(dynamic value) {
    userMistakeList.add(value);
  }

  void removeFromUserMistakeList(dynamic value) {
    userMistakeList.remove(value);
  }

  void removeAtIndexFromUserMistakeList(int index) {
    userMistakeList.removeAt(index);
  }

  void updateUserMistakeListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    userMistakeList[index] = updateFn(_userMistakeList[index]);
  }

  void insertAtIndexInUserMistakeList(int index, dynamic value) {
    userMistakeList.insert(index, value);
  }

  List<dynamic> _quickQuestionsList = [];
  List<dynamic> get quickQuestionsList => _quickQuestionsList;
  set quickQuestionsList(List<dynamic> value) {
    _quickQuestionsList = value;
  }

  void addToQuickQuestionsList(dynamic value) {
    quickQuestionsList.add(value);
  }

  void removeFromQuickQuestionsList(dynamic value) {
    quickQuestionsList.remove(value);
  }

  void removeAtIndexFromQuickQuestionsList(int index) {
    quickQuestionsList.removeAt(index);
  }

  void updateQuickQuestionsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    quickQuestionsList[index] = updateFn(_quickQuestionsList[index]);
  }

  void insertAtIndexInQuickQuestionsList(int index, dynamic value) {
    quickQuestionsList.insert(index, value);
  }

  List<dynamic> _categoryList = [];
  List<dynamic> get categoryList => _categoryList;
  set categoryList(List<dynamic> value) {
    _categoryList = value;
    prefs.setStringList(
        'ff_categoryList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCategoryList(dynamic value) {
    categoryList.add(value);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCategoryList(dynamic value) {
    categoryList.remove(value);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => jsonEncode(x)).toList());
  }

  void updateCategoryListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCategoryList(int index, dynamic value) {
    categoryList.insert(index, value);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => jsonEncode(x)).toList());
  }

  int _mode0 = 0;
  int get mode0 => _mode0;
  set mode0(int value) {
    _mode0 = value;
  }

  bool _correctFlg = false;
  bool get correctFlg => _correctFlg;
  set correctFlg(bool value) {
    _correctFlg = value;
  }

  bool _incorrectFlg = false;
  bool get incorrectFlg => _incorrectFlg;
  set incorrectFlg(bool value) {
    _incorrectFlg = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
