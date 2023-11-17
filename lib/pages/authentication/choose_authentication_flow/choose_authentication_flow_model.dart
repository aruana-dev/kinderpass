import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'choose_authentication_flow_widget.dart'
    show ChooseAuthenticationFlowWidget;
import 'package:flutter/material.dart';

class ChooseAuthenticationFlowModel
    extends FlutterFlowModel<ChooseAuthenticationFlowWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for contactSupportButton component.
  late ContactSupportButtonModel contactSupportButtonModel;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    contactSupportButtonModel =
        createModel(context, () => ContactSupportButtonModel());
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    contactSupportButtonModel.dispose();
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
