import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'onboarding_step4_widget.dart' show OnboardingStep4Widget;
import 'package:flutter/material.dart';

class OnboardingStep4Model extends FlutterFlowModel<OnboardingStep4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
