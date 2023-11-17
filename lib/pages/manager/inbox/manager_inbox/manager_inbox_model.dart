import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/navbar/manager_nav_bar/manager_nav_bar_widget.dart';
import 'manager_inbox_widget.dart' show ManagerInboxWidget;
import 'package:flutter/material.dart';

class ManagerInboxModel extends FlutterFlowModel<ManagerInboxWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;
  // Model for ManagerNavBar component.
  late ManagerNavBarModel managerNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
    managerNavBarModel = createModel(context, () => ManagerNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    giveFeedbackButtonModel.dispose();
    managerNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
