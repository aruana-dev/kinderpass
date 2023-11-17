import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'registration_step1_widget.dart' show RegistrationStep1Widget;
import 'package:flutter/material.dart';

class RegistrationStep1Model extends FlutterFlowModel<RegistrationStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;
  // Model for contactSupportButton component.
  late ContactSupportButtonModel contactSupportButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
    contactSupportButtonModel =
        createModel(context, () => ContactSupportButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    giveFeedbackButtonModel.dispose();
    contactSupportButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
