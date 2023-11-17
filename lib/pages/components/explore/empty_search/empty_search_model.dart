import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'empty_search_widget.dart' show EmptySearchWidget;
import 'package:flutter/material.dart';

class EmptySearchModel extends FlutterFlowModel<EmptySearchWidget> {
  ///  State fields for stateful widgets in this component.

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
