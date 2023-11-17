import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import 'client_onboarding_step12_widget.dart' show ClientOnboardingStep12Widget;
import 'package:flutter/material.dart';

class ClientOnboardingStep12Model
    extends FlutterFlowModel<ClientOnboardingStep12Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cancelOnboardingButton component.
  late CancelOnboardingButtonModel cancelOnboardingButtonModel;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cancelOnboardingButtonModel =
        createModel(context, () => CancelOnboardingButtonModel());
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cancelOnboardingButtonModel.dispose();
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
