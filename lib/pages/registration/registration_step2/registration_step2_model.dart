import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'registration_step2_widget.dart' show RegistrationStep2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationStep2Model extends FlutterFlowModel<RegistrationStep2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for contactSupportButton component.
  late ContactSupportButtonModel contactSupportButtonModel;
  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileController;
  final mobileMask = MaskTextInputFormatter(mask: '+41 ## ### ## ##');
  String? Function(BuildContext, String?)? mobileControllerValidator;
  // Stores action output result for [Backend Call - API (validateMobile)] action in Button widget.
  ApiCallResponse? isValid;
  // Stores action output result for [Bottom Sheet - confirmMobile] action in Button widget.
  bool? isCorrect;
  // Stores action output result for [Cloud Function - doesUserExistCLIENT] action in Button widget.
  DoesUserExistCLIENTCloudFunctionCallResponse? doesUserExistRES;
  // Stores action output result for [Cloud Function - sendVerificationTokenCLIENT] action in Button widget.
  SendVerificationTokenCLIENTCloudFunctionCallResponse?
      sendVerificationTokenRES;
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
    mobileFocusNode?.dispose();
    mobileController?.dispose();

    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
