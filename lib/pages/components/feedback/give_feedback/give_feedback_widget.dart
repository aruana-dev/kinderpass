import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'give_feedback_model.dart';
export 'give_feedback_model.dart';

class GiveFeedbackWidget extends StatefulWidget {
  const GiveFeedbackWidget({
    super.key,
    required this.page,
  });

  final String? page;

  @override
  _GiveFeedbackWidgetState createState() => _GiveFeedbackWidgetState();
}

class _GiveFeedbackWidgetState extends State<GiveFeedbackWidget> {
  late GiveFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GiveFeedbackModel());

    _model.feedbackController ??= TextEditingController();
    _model.feedbackFocusNode ??= FocusNode();

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dein Feedback',
                    style: FlutterFlowTheme.of(context).headlineLarge,
                  ),
                  Text(
                    'Was können wir in diesem Bereich verbessern?',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                ].divide(const SizedBox(height: 10.0)),
              ),
              TextFormField(
                controller: _model.feedbackController,
                focusNode: _model.feedbackFocusNode,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Aus meiner Sicht wäre es besser, wenn ...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                textAlign: TextAlign.start,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                validator:
                    _model.feedbackControllerValidator.asValidator(context),
              ),
              FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);

                  await FeedbacksRecord.collection
                      .doc()
                      .set(createFeedbacksRecordData(
                        createdAt: getCurrentTimestamp,
                        user: currentUserReference,
                        feedback: _model.feedbackController.text,
                        page: widget.page,
                      ));
                },
                text: 'Feedback senden',
                options: FFButtonOptions(
                  width: double.infinity,
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
            ].divide(const SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}
