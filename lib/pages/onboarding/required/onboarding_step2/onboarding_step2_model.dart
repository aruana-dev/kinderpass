import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import 'onboarding_step2_widget.dart' show OnboardingStep2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OnboardingStep2Model extends FlutterFlowModel<OnboardingStep2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for cancelOnboardingButton component.
  late CancelOnboardingButtonModel cancelOnboardingButtonModel;
  // State field(s) for givenName widget.
  FocusNode? givenNameFocusNode;
  TextEditingController? givenNameController;
  String? Function(BuildContext, String?)? givenNameControllerValidator;
  String? _givenNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    return null;
  }

  // State field(s) for familiyName widget.
  FocusNode? familiyNameFocusNode;
  TextEditingController? familiyNameController;
  String? Function(BuildContext, String?)? familiyNameControllerValidator;
  String? _familiyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Dieses Feld ist obligatorisch.';
    }

    return null;
  }

  // State field(s) for birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateController;
  final birthdateMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? birthdateControllerValidator;
  String? _birthdateControllerValidator(BuildContext context, String? val) {
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
    givenNameControllerValidator = _givenNameControllerValidator;
    familiyNameControllerValidator = _familiyNameControllerValidator;
    birthdateControllerValidator = _birthdateControllerValidator;
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cancelOnboardingButtonModel.dispose();
    givenNameFocusNode?.dispose();
    givenNameController?.dispose();

    familiyNameFocusNode?.dispose();
    familiyNameController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateController?.dispose();

    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
