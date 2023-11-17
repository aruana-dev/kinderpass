import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'confirm_account_deletion_widget.dart' show ConfirmAccountDeletionWidget;
import 'package:flutter/material.dart';

class ConfirmAccountDeletionModel
    extends FlutterFlowModel<ConfirmAccountDeletionWidget> {
  ///  State fields for stateful widgets in this component.

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
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
