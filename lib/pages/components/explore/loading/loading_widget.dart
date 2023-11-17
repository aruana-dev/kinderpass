import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_model.dart';
export 'loading_model.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late LoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/lottie_animations/waiting.json',
          width: 300.0,
          height: 300.0,
          fit: BoxFit.cover,
          animate: true,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Text(
            'Einen Moment.\nWir greifen kurz nach den Sternen.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyLarge,
          ),
        ),
        wrapWithModel(
          model: _model.giveFeedbackButtonModel,
          updateCallback: () => setState(() {}),
          child: const GiveFeedbackButtonWidget(
            page: 'loading',
          ),
        ),
      ].divide(const SizedBox(height: 30.0)),
    );
  }
}
