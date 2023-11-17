import '/flutter_flow/flutter_flow_util.dart';
import 'give_feedback_widget.dart' show GiveFeedbackWidget;
import 'package:flutter/material.dart';

class GiveFeedbackModel extends FlutterFlowModel<GiveFeedbackWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackController;
  String? Function(BuildContext, String?)? feedbackControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    feedbackFocusNode?.dispose();
    feedbackController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
