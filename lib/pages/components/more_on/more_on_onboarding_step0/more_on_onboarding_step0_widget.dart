import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'more_on_onboarding_step0_model.dart';
export 'more_on_onboarding_step0_model.dart';

class MoreOnOnboardingStep0Widget extends StatefulWidget {
  const MoreOnOnboardingStep0Widget({super.key});

  @override
  _MoreOnOnboardingStep0WidgetState createState() =>
      _MoreOnOnboardingStep0WidgetState();
}

class _MoreOnOnboardingStep0WidgetState
    extends State<MoreOnOnboardingStep0Widget> {
  late MoreOnOnboardingStep0Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreOnOnboardingStep0Model());

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
                  'Ein:e Erziehungsberechtige:r eröffnet ein eigenes Konto. Unabhängig davon, ob  bereits für dieselben Kinder verantwortliche Personen registriert sind.',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
                Text(
                  'Ein:e Veranstalter:in eröffnet ein Hauptkonto. In einem zweiten Schritt können Unter-Konten für Mitarbeiter:innen erstellt werden.',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ].divide(const SizedBox(height: 30.0)),
            ),
            wrapWithModel(
              model: _model.giveFeedbackButtonModel,
              updateCallback: () => setState(() {}),
              child: const GiveFeedbackButtonWidget(
                page: 'moreOnOnboardingStep0',
              ),
            ),
          ].divide(const SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
