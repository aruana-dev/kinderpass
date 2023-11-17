import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import 'onboarding_step0_widget.dart' show OnboardingStep0Widget;
import 'package:flutter/material.dart';

class OnboardingStep0Model extends FlutterFlowModel<OnboardingStep0Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;
  // Model for cancelOnboardingButton component.
  late CancelOnboardingButtonModel cancelOnboardingButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
    cancelOnboardingButtonModel =
        createModel(context, () => CancelOnboardingButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    giveFeedbackButtonModel.dispose();
    cancelOnboardingButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
