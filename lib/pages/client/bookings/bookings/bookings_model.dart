import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/navbar/client_nav_bar/client_nav_bar_widget.dart';
import 'bookings_widget.dart' show BookingsWidget;
import 'package:flutter/material.dart';

class BookingsModel extends FlutterFlowModel<BookingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for giveFeedbackButton component.
  late GiveFeedbackButtonModel giveFeedbackButtonModel;
  // Model for ClientNavBar component.
  late ClientNavBarModel clientNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    giveFeedbackButtonModel =
        createModel(context, () => GiveFeedbackButtonModel());
    clientNavBarModel = createModel(context, () => ClientNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    giveFeedbackButtonModel.dispose();
    clientNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
