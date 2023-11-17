import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/navbar/client_nav_bar/client_nav_bar_widget.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ClientNavBar component.
  late ClientNavBarModel clientNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    clientNavBarModel = createModel(context, () => ClientNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    clientNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
