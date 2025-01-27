import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({
    super.key,
    required this.numberOfQuestions,
    required this.quizType,
    this.categoryName,
  });

  final String? numberOfQuestions;
  final int? quizType;
  final String? categoryName;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with TickerProviderStateMixin {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().questionSessionList = [];
      FFAppState().apiCallFlag = false;
      FFAppState().currentQuestionIndex = 0;
      FFAppState().currentScore = 0;
      FFAppState().currentAnsweredNumber = 0;
      FFAppState().correctFlg = false;
      FFAppState().incorrectFlg = false;
      safeSetState(() {});
      _model.quizSessionInfo =
          await QuizSessionGroup.postQuizSessionAPICall.call(
        userId: currentUserUid,
        mode: FFAppState().mode,
        categoryId: FFAppState().selectedCategoryId,
        quizType: widget.quizType,
      );

      if ((_model.quizSessionInfo?.succeeded ?? true)) {
        _model.questionsInfo = await QuestionGroup.getQuestionAPICall.call(
          limit: widget.numberOfQuestions,
          testType: widget.quizType?.toString(),
          categoryId: FFAppState().selectedCategoryId.toString(),
          offset: valueOrDefault<int>(
            null,
            0,
          ),
        );

        if ((_model.questionsInfo?.succeeded ?? true)) {
          FFAppState().questionSessionList = getJsonField(
            (_model.questionsInfo?.jsonBody ?? ''),
            r'''$['questions']''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          FFAppState().currentQuestionNumber =
              FFAppState().currentQuestionNumber + 1;
          safeSetState(() {});
          FFAppState().apiCallFlag = !(FFAppState().apiCallFlag ?? true);
          safeSetState(() {});
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('エラー'),
                content: const Text('再度やり直してください'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('エラー'),
              content: const Text('再度やり直してください'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      )
          ? PreferredSize(
              preferredSize: const Size.fromHeight(64.0),
              child: AppBar(
                backgroundColor: const Color(0xFF85C1DC),
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        FFAppState().mode == 0 ? 'Test' : 'Training',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.quizType == 0 ? 'ランダム出題' : '順番出題',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          TextSpan(
                            text: '　',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: widget.categoryName!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              ),
            )
          : null,
      body: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 470.0,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF85C1DC),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 381.0,
                                height: 315.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        2.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x9AFFFFFF),
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '問題',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              const Color(0xFF57636C),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            FFAppState()
                                                                .questionSessionList
                                                                .elementAtOrNull(
                                                                    FFAppState()
                                                                        .currentQuestionIndex),
                                                            r'''$['title']''',
                                                          )?.toString(),
                                                          '問題取得中',
                                                        ),
                                                        maxLines: 100,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displayMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: const Color(
                                                                  0xFF57636C),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (getJsonField(
                                                        FFAppState()
                                                            .questionSessionList
                                                            .elementAtOrNull(
                                                                FFAppState()
                                                                    .currentQuestionIndex),
                                                        r'''$['img_path']''',
                                                      ) !=
                                                      null)
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        getJsonField(
                                                          FFAppState()
                                                              .questionSessionList
                                                              .elementAtOrNull(
                                                                  FFAppState()
                                                                      .currentQuestionIndex),
                                                          r'''$['img_path']''',
                                                        ).toString(),
                                                        width: 335.0,
                                                        height: 172.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        (FFAppState().currentQuestionIndex + 1).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF57636C),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF57636C),
                                                          letterSpacing: 0.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: '/',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF57636C),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  const TextSpan(
                                                    text: '',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      widget.numberOfQuestions,
                                                      'X',
                                                    ),
                                                    style: const TextStyle(
                                                      color: Color(0xFF57636C),
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 398.0,
                  height: 411.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF85C1DC),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().apiCallFlag)
                        Builder(
                          builder: (context) {
                            final choiceList = getJsonField(
                              FFAppState().questionSessionList.elementAtOrNull(
                                  FFAppState().currentQuestionIndex),
                              r'''$['choice']''',
                            ).toList().take(4).toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: choiceList.length,
                              itemBuilder: (context, choiceListIndex) {
                                final choiceListItem =
                                    choiceList[choiceListIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 12.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var shouldSetState = false;
                                      // 回答を更新
                                      FFAppState().currentAnswer = getJsonField(
                                        choiceListItem,
                                        r'''$['is_answer']''',
                                      ).toString();
                                      FFAppState().currentQuestionNumber =
                                          FFAppState().currentQuestionNumber +
                                              1;
                                      safeSetState(() {});
                                      if ((String currentAnswer) {
                                        return currentAnswer == "true";
                                      }(FFAppState().currentAnswer)) {
                                        // スコア加算
                                        FFAppState().currentScore =
                                            FFAppState().currentScore + 1;
                                        FFAppState().correctFlg = true;
                                      } else {
                                        FFAppState().incorrectFlg = true;
                                        safeSetState(() {});
                                        // ユーザ不正解更新
                                        _model.postUserMistakeInfo =
                                            await UserMistakeGroup
                                                .postUserMistakeAPICall
                                                .call(
                                          userId: currentUserUid,
                                          questionId: getJsonField(
                                            FFAppState()
                                                .questionSessionList
                                                .elementAtOrNull(FFAppState()
                                                    .currentQuestionIndex),
                                            r'''$['id']''',
                                          ),
                                        );

                                        shouldSetState = true;
                                        if (!(_model.postUserMistakeInfo
                                                ?.succeeded ??
                                            true)) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('エラー'),
                                                content: const Text('再度やり直してください'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }
                                      }

                                      _model.quizSessionDetailInfo =
                                          await QuizSessionDetailGroup
                                              .postQuizSessionDetailAPICall
                                              .call(
                                        quizSessionId: getJsonField(
                                          (_model.quizSessionInfo?.jsonBody ??
                                              ''),
                                          r'''$['id']''',
                                        ),
                                        questionId: getJsonField(
                                          FFAppState()
                                              .questionSessionList
                                              .elementAtOrNull(FFAppState()
                                                  .currentQuestionIndex),
                                          r'''$['id']''',
                                        ),
                                        answer: getJsonField(
                                          choiceListItem,
                                          r'''$['content']''',
                                        ).toString(),
                                        isCorrect: getJsonField(
                                          choiceListItem,
                                          r'''$['is_answer']''',
                                        ).toString(),
                                      );

                                      shouldSetState = true;
                                      if ((_model.quizSessionDetailInfo
                                              ?.succeeded ??
                                          true)) {
                                        // 回答数を更新
                                        FFAppState().currentAnsweredNumber =
                                            FFAppState().currentAnsweredNumber +
                                                1;
                                        FFAppState().incorrectFlg = false;
                                        FFAppState().correctFlg = false;
                                        safeSetState(() {});
                                        if (FFAppState()
                                                .currentAnsweredNumber ==
                                            getJsonField(
                                              (_model.questionsInfo?.jsonBody ??
                                                  ''),
                                              r'''$['question_count']''',
                                            )) {
                                          // クイズ履歴更新
                                          _model.putQuizSessionInfo =
                                              await QuizSessionGroup
                                                  .putQuizSessionAPICall
                                                  .call(
                                            score: FFAppState().currentScore,
                                            totalQuestions: FFAppState()
                                                    .currentQuestionIndex +
                                                1,
                                            quizSessionId: getJsonField(
                                              (_model.quizSessionInfo
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$['id']''',
                                            ),
                                          );

                                          shouldSetState = true;
                                          if ((_model.putQuizSessionInfo
                                                  ?.succeeded ??
                                              true)) {
                                            // Result画面へ遷移

                                            context.pushNamed(
                                              'Result',
                                              queryParameters: {
                                                'quizSessionId': serializeParam(
                                                  getJsonField(
                                                    (_model.quizSessionInfo
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$['id']''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          } else {
                                            // エラーダイアログ
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('エラー'),
                                                  content: const Text('再度やり直してください'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }
                                        } else {
                                          // 問題インデックス更新
                                          FFAppState().currentQuestionIndex =
                                              FFAppState()
                                                      .currentQuestionIndex +
                                                  1;
                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('エラー'),
                                              content: const Text('再度やり直してください'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }

                                      if (shouldSetState) safeSetState(() {});
                                    },
                                    child: Container(
                                      key: ValueKey(getJsonField(
                                        choiceListItem,
                                        r'''$['is_answer']''',
                                      ).toString()),
                                      width: double.infinity,
                                      height: 64.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  choiceListItem,
                                                  r'''$['content']''',
                                                ).toString(),
                                                maxLines: 4,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF57636C),
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).animateOnPageLoad(
                                animationsMap['listViewOnPageLoadAnimation']!);
                          },
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.81),
                        child: Container(
                          width: 392.4,
                          height: 65.8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF85C1DC),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (FFAppState().correctFlg)
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Lottie.asset(
                'assets/jsons/Main_Scene_(3).json',
                width: 375.3,
                height: 323.6,
                fit: BoxFit.contain,
                reverse: true,
                animate: true,
              ),
            ),
          if (valueOrDefault<bool>(
            FFAppState().incorrectFlg,
            false,
          ))
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Lottie.asset(
                'assets/jsons/Main_Scene_(1).json',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
                reverse: true,
                animate: true,
              ),
            ),
        ],
      ),
    );
  }
}
