import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/onboarding/confirm_cancel_onboarding/confirm_cancel_onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cancel_onboarding_button_model.dart';
export 'cancel_onboarding_button_model.dart';

class CancelOnboardingButtonWidget extends StatefulWidget {
  const CancelOnboardingButtonWidget({super.key});

  @override
  _CancelOnboardingButtonWidgetState createState() =>
      _CancelOnboardingButtonWidgetState();
}

class _CancelOnboardingButtonWidgetState
    extends State<CancelOnboardingButtonWidget> {
  late CancelOnboardingButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelOnboardingButtonModel());

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

    return FFButtonWidget(
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color(0x00FFFFFF),
          barrierColor: FlutterFlowTheme.of(context).secondaryBackground,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: const ConfirmCancelOnboardingWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      text: 'Abbrechen',
      options: FFButtonOptions(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
    );
  }
}
