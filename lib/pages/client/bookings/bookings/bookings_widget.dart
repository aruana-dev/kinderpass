import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/navbar/client_nav_bar/client_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'bookings_model.dart';
export 'bookings_model.dart';

class BookingsWidget extends StatefulWidget {
  const BookingsWidget({super.key});

  @override
  _BookingsWidgetState createState() => _BookingsWidgetState();
}

class _BookingsWidgetState extends State<BookingsWidget> {
  late BookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().currentPage = 'bookings';
      });
      if (!currentUserDocument!.profile.hasPassedPersonalProfileSteps) {
        setState(() {
          FFAppState().needsAttention = true;
        });
      } else if (!currentUserDocument!.profile.hasPassedFamilyProfileSteps) {
        setState(() {
          FFAppState().needsAttention = true;
        });
      } else {
        setState(() {
          FFAppState().needsAttention = false;
          FFAppState().isReady = true;
        });
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
          actions: const [],
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
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 75.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Buchungen',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: const [],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.giveFeedbackButtonModel,
                        updateCallback: () => setState(() {}),
                        child: const GiveFeedbackButtonWidget(
                          page: 'bookings',
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
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
