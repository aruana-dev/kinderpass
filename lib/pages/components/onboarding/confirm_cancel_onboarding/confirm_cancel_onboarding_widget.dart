import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'confirm_cancel_onboarding_model.dart';
export 'confirm_cancel_onboarding_model.dart';

class ConfirmCancelOnboardingWidget extends StatefulWidget {
  const ConfirmCancelOnboardingWidget({super.key});

  @override
  _ConfirmCancelOnboardingWidgetState createState() =>
      _ConfirmCancelOnboardingWidgetState();
}

class _ConfirmCancelOnboardingWidgetState
    extends State<ConfirmCancelOnboardingWidget> {
  late ConfirmCancelOnboardingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmCancelOnboardingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abbrechen?',
                  style: FlutterFlowTheme.of(context).headlineLarge,
                ),
                Text(
                  'Du kannst den Onboarding-Prozess bei deiner nächsten Anmeldung abschliessen.',
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    context.goNamedAuth('Splash', context.mounted);
                  },
                  text: 'Abbrechen & Abmelden',
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
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Zurück',
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
              ].divide(const SizedBox(height: 10.0)),
            ),
            wrapWithModel(
              model: _model.giveFeedbackButtonModel,
              updateCallback: () => setState(() {}),
              child: const GiveFeedbackButtonWidget(
                page: 'confirmCancelOnboarding',
              ),
            ),
          ].divide(const SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
