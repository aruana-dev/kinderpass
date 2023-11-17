import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/explore/choose_child_profiles/choose_child_profiles_widget.dart';
import '/pages/components/explore/empty_search/empty_search_widget.dart';
import '/pages/components/explore/event/event_widget.dart';
import '/pages/components/explore/loading/loading_widget.dart';
import '/pages/components/navbar/client_nav_bar/client_nav_bar_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'explore_model.dart';
export 'explore_model.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({super.key});

  @override
  _ExploreWidgetState createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().currentPage = 'explore';
      });
      await action_blocks.setup(context);
      setState(() {});
      if (!currentUserDocument!.profile.hasPassedPersonalProfileSteps) {
        setState(() {
          FFAppState().isReady = false;
          FFAppState().needsAttention = true;
        });
      } else if (!currentUserDocument!.profile.hasPassedFamilyProfileSteps) {
        setState(() {
          FFAppState().isReady = false;
          FFAppState().needsAttention = true;
        });
      } else {
        setState(() {
          FFAppState().isReady = true;
          FFAppState().needsAttention = false;
        });
        await action_blocks.getFilteredEvents(context);
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          actions: [
            Visibility(
              visible: FFAppState().isReady,
              child: AuthUserStreamWidget(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.75,
                              child: const ChooseChildProfilesWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  text: () {
                    if (currentUserDocument
                            ?.profile.selectedChildProfilesRefs.isEmpty) {
                      return 'Für wen suchst du?';
                    } else if (currentUserDocument
                            ?.profile.selectedChildProfilesRefs.length ==
                        1) {
                      return 'Du suchst für ein Kind';
                    } else {
                      return 'Du suchst für mehr als ein Kind';
                    }
                  }(),
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0x00FFFFFF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Open Sans',
                          decoration: TextDecoration.underline,
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (FFAppState().needsAttention)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Lottie.asset(
                        'assets/lottie_animations/crying_astronaut.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        fit: BoxFit.scaleDown,
                        animate: true,
                      ),
                      Text(
                        'Schliesse die Einrichtung deines Profils ab, um diesen Bereich anzuzeigen.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.goNamed(
                              'OnboardingStep5',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: 'Einrichtung abschliessen',
                          options: FFButtonOptions(
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 30.0)),
                  ),
                ),
              if (FFAppState().isReady)
                AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<List<EventsRecord>>(
                    stream: queryEventsRecord(
                      queryBuilder: (eventsRecord) => eventsRecord.whereNotIn(
                          'event.eventRef',
                          currentUserDocument?.profile.rejectedEventsRefs),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: LoadingWidget(),
                          ),
                        );
                      }
                      List<EventsRecord> listViewEventsRecordList =
                          snapshot.data!;
                      if (listViewEventsRecordList.isEmpty) {
                        return Center(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            child: const EmptySearchWidget(),
                          ),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          await action_blocks.getFilteredEvents(context);
                          setState(() {});
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewEventsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewEventsRecord =
                                listViewEventsRecordList[listViewIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'SingleEvent',
                                            queryParameters: {
                                              'event': serializeParam(
                                                listViewEventsRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'event': listViewEventsRecord,
                                            },
                                          );
                                        },
                                        child: EventWidget(
                                          key: Key(
                                              'Keyymm_${listViewIndex}_of_${listViewEventsRecordList.length}'),
                                          event: listViewEventsRecord,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.clientNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: const ClientNavBarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
