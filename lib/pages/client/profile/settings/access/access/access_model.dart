import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'access_widget.dart' show AccessWidget;
import 'package:flutter/material.dart';

class AccessModel extends FlutterFlowModel<AccessWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - enterEmail] action in ListTile widget.
  String? email;
  // Stores action output result for [Backend Call - API (validateEmail)] action in ListTile widget.
  ApiCallResponse? isValid;
  // Stores action output result for [Cloud Function - addEmailCLIENT] action in ListTile widget.
  AddEmailCLIENTCloudFunctionCallResponse? addEmailRES;
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
