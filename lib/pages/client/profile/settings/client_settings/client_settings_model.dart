import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/settings/confirm_log_out_button/confirm_log_out_button_widget.dart';
import 'client_settings_widget.dart' show ClientSettingsWidget;
import 'package:flutter/material.dart';

class ClientSettingsModel extends FlutterFlowModel<ClientSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for confirmLogOutButton component.
  late ConfirmLogOutButtonModel confirmLogOutButtonModel;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    confirmLogOutButtonModel =
        createModel(context, () => ConfirmLogOutButtonModel());
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    confirmLogOutButtonModel.dispose();
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
