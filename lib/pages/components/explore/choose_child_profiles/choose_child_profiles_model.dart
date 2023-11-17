import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'choose_child_profiles_widget.dart' show ChooseChildProfilesWidget;
import 'package:flutter/material.dart';

class ChooseChildProfilesModel
    extends FlutterFlowModel<ChooseChildProfilesWidget> {
  ///  Local state fields for this component.

  int counter = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.

  Map<ChildProfilesRecord, bool> checkboxListTileValueMap = {};
  List<ChildProfilesRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

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
    giveFeedbackButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
