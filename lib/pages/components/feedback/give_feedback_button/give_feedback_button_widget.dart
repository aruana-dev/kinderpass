import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback/give_feedback_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'give_feedback_button_model.dart';
export 'give_feedback_button_model.dart';

class GiveFeedbackButtonWidget extends StatefulWidget {
  const GiveFeedbackButtonWidget({
    super.key,
    required this.page,
  });

  final String? page;

  @override
  _GiveFeedbackButtonWidgetState createState() =>
      _GiveFeedbackButtonWidgetState();
}

class _GiveFeedbackButtonWidgetState extends State<GiveFeedbackButtonWidget> {
  late GiveFeedbackButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiveFeedbackButtonModel());

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
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: GiveFeedbackWidget(
                  page: widget.page!,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      text: 'Feedback geben',
      options: FFButtonOptions(
        width: double.infinity,
        height: 40.0,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: const Color(0x00FFFFFF),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Open Sans',
              color: FlutterFlowTheme.of(context).error,
            ),
        elevation: 0.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
