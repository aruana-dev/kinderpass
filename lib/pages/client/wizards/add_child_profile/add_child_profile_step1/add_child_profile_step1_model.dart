import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'add_child_profile_step1_widget.dart' show AddChildProfileStep1Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddChildProfileStep1Model
    extends FlutterFlowModel<AddChildProfileStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChildProfilesRecord? newlyCreatedChildProfile;
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    givenNameControllerValidator = _givenNameControllerValidator;
    familiyNameControllerValidator = _familiyNameControllerValidator;
    birthdateControllerValidator = _birthdateControllerValidator;
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
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
