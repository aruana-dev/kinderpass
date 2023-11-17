import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empty_search_model.dart';
export 'empty_search_model.dart';

class EmptySearchWidget extends StatefulWidget {
  const EmptySearchWidget({super.key});

  @override
  _EmptySearchWidgetState createState() => _EmptySearchWidgetState();
}

class _EmptySearchWidgetState extends State<EmptySearchWidget> {
  late EmptySearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySearchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Kein Angebot gefunden',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              Text(
                'Leider gibt es kein Angebot, das für die von dir gewählten Kinderprofile in Frage kommt.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
            ],
          ),
          wrapWithModel(
            model: _model.giveFeedbackButtonModel,
            updateCallback: () => setState(() {}),
            child: const GiveFeedbackButtonWidget(
              page: 'emptySearch',
            ),
          ),
        ].divide(const SizedBox(height: 30.0)),
      ),
    );
  }
}
