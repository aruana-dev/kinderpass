import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'error_page_model.dart';
export 'error_page_model.dart';

class ErrorPageWidget extends StatefulWidget {
  const ErrorPageWidget({
    super.key,
    this.log,
  });

  final String? log;

  @override
  _ErrorPageWidgetState createState() => _ErrorPageWidgetState();
}

class _ErrorPageWidgetState extends State<ErrorPageWidget> {
  late ErrorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await SystemLogsRecord.collection.doc().set(createSystemLogsRecordData(
            createdAt: getCurrentTimestamp,
            user: currentUserReference,
            log: widget.log,
          ));
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fehler',
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                    Text(
                      'Es ist ein Fehler aufgetreten, der nicht sofort behoben werden kann - das tut uns Leid!',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.goNamedAuth(
                      'Splash',
                      context.mounted,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );

                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();
                  },
                  text: 'Abmelden',
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.contactSupportButtonModel,
                      updateCallback: () => setState(() {}),
                      child: const ContactSupportButtonWidget(),
                    ),
                    wrapWithModel(
                      model: _model.giveFeedbackButtonModel,
                      updateCallback: () => setState(() {}),
                      child: const GiveFeedbackButtonWidget(
                        page: 'errorPage',
                      ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
