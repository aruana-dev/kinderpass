import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'phone_authentication_widget.dart' show PhoneAuthenticationWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneAuthenticationModel
    extends FlutterFlowModel<PhoneAuthenticationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileController;
  final mobileMask = MaskTextInputFormatter(mask: '+41 ## ### ## ##');
  String? Function(BuildContext, String?)? mobileControllerValidator;
  // Stores action output result for [Cloud Function - doesUserExistCLIENT] action in Button widget.
  DoesUserExistCLIENTCloudFunctionCallResponse? doesUserExistRES;
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
    mobileFocusNode?.dispose();
    mobileController?.dispose();

    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
