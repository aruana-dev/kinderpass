import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/navbar/manager_nav_bar/manager_nav_bar_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'overview_model.dart';
export 'overview_model.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  _OverviewWidgetState createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  late OverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OverviewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().currentPage = 'overview';
      });
      if (!currentUserDocument!.profile.hasPassedRequiredRegistrationSteps) {
        await SystemLogsRecord.collection.doc().set(createSystemLogsRecordData(
              createdAt: getCurrentTimestamp,
              user: currentUserReference,
              log: 'explore, has not passed required registration steps',
            ));

        context.goNamed(
          'ErrorPage',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else if (!currentUserDocument!
          .profile.hasPassedRequiredOnboardingSteps) {
        context.goNamed('OnboardingStep0');
      } else if (!currentUserDocument!.profile.hasPassedPersonalProfileSteps) {
        setState(() {
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
            FlutterFlowIconButton(
              borderRadius: 30.0,
              borderWidth: 0.0,
              buttonSize: 60.0,
              fillColor: const Color(0x00FFFFFF),
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('AddEvent');
              },
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
              if (!FFAppState().needsAttention)
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Text(
                          'Überblick',
                          style: FlutterFlowTheme.of(context).headlineLarge,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.giveFeedbackButtonModel,
                        updateCallback: () => setState(() {}),
                        child: const GiveFeedbackButtonWidget(
                          page: 'overview',
                        ),
                      ),
                    ].divide(const SizedBox(height: 30.0)),
                  ),
                ),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.managerNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: const ManagerNavBarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
