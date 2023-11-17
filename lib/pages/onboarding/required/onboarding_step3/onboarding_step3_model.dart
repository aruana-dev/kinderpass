import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import 'onboarding_step3_widget.dart' show OnboardingStep3Widget;
import 'package:flutter/material.dart';

class OnboardingStep3Model extends FlutterFlowModel<OnboardingStep3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for cancelOnboardingButton component.
  late CancelOnboardingButtonModel cancelOnboardingButtonModel;
  // State field(s) for streetName widget.
  FocusNode? streetNameFocusNode;
  TextEditingController? streetNameController;
  String? Function(BuildContext, String?)? streetNameControllerValidator;
  String? _streetNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    return null;
  }

  // State field(s) for streetNumber widget.
  FocusNode? streetNumberFocusNode;
  TextEditingController? streetNumberController;
  String? Function(BuildContext, String?)? streetNumberControllerValidator;
  String? _streetNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    return null;
  }

  // State field(s) for postalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeController;
  String? Function(BuildContext, String?)? postalCodeControllerValidator;
  String? _postalCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    return null;
  }

  // State field(s) for locality widget.
  FocusNode? localityFocusNode;
  TextEditingController? localityController;
  String? Function(BuildContext, String?)? localityControllerValidator;
  String? _localityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    return null;
  }

  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cancelOnboardingButtonModel =
        createModel(context, () => CancelOnboardingButtonModel());
    streetNameControllerValidator = _streetNameControllerValidator;
    streetNumberControllerValidator = _streetNumberControllerValidator;
    postalCodeControllerValidator = _postalCodeControllerValidator;
    localityControllerValidator = _localityControllerValidator;
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cancelOnboardingButtonModel.dispose();
    streetNameFocusNode?.dispose();
    streetNameController?.dispose();

    streetNumberFocusNode?.dispose();
    streetNumberController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeController?.dispose();

    localityFocusNode?.dispose();
    localityController?.dispose();

    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
