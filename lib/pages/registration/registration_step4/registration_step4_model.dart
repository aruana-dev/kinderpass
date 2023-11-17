import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'registration_step4_widget.dart' show RegistrationStep4Widget;
import 'package:flutter/material.dart';

class RegistrationStep4Model extends FlutterFlowModel<RegistrationStep4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-Mail-Adresse ungültig';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (validateEmail)] action in Button widget.
  ApiCallResponse? isValid;
  // Stores action output result for [Cloud Function - doesUserExistCLIENT] action in Button widget.
  DoesUserExistCLIENTCloudFunctionCallResponse? doesUserExistRES;
  // Stores action output result for [Cloud Function - addEmailCLIENT] action in Button widget.
  AddEmailCLIENTCloudFunctionCallResponse? addEmailRES;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;
  // Model for contactSupportButton component.
  late ContactSupportButtonModel contactSupportButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
    contactSupportButtonModel =
        createModel(context, () => ContactSupportButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    giveFeedbackButtonModel.dispose();
    contactSupportButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
