import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'registration_step3_widget.dart' show RegistrationStep3Widget;
import 'package:flutter/material.dart';

class RegistrationStep3Model extends FlutterFlowModel<RegistrationStep3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for contactSupportButton component.
  late ContactSupportButtonModel contactSupportButtonModel;
  // State field(s) for token widget.
  TextEditingController? token;
  String? Function(BuildContext, String?)? tokenValidator;
  String? _tokenValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Cloud Function - verifyTokenCLIENT] action in Button widget.
  VerifyTokenCLIENTCloudFunctionCallResponse? verifyTokenRES;
  // Stores action output result for [Cloud Function - updatePhoneNumberCLIENT] action in Button widget.
  UpdatePhoneNumberCLIENTCloudFunctionCallResponse? updatePhoneNumberRES;
  // Stores action output result for [Cloud Function - createUserCLIENT] action in Button widget.
  CreateUserCLIENTCloudFunctionCallResponse? createUserRES;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    contactSupportButtonModel =
        createModel(context, () => ContactSupportButtonModel());
    token = TextEditingController();
    tokenValidator = _tokenValidator;
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    contactSupportButtonModel.dispose();
    token?.dispose();
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
