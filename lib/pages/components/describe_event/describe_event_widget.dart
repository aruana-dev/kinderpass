import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'describe_event_model.dart';
export 'describe_event_model.dart';

class DescribeEventWidget extends StatefulWidget {
  const DescribeEventWidget({
    super.key,
    required this.eventId,
  });

  final String? eventId;

  @override
  _DescribeEventWidgetState createState() => _DescribeEventWidgetState();
}

class _DescribeEventWidgetState extends State<DescribeEventWidget> {
  late DescribeEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescribeEventModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KI-Assistent (BETA)',
                  style: FlutterFlowTheme.of(context).headlineLarge,
                ),
                Text(
                  'Klicke auf das Mikrofon-Icon und beschreibe dein Angebot in deinen Worten und so gut es geht. Anschliessend klickst du auf das Stop-Icon und auf Absenden.',
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ],
            ),
            Text(
              'Du kannst diesen Vorgang so oft ausführen, wie du möchtest. Klicke auf Abschliessen, um ein vorläufiges Ergebnis zu sehen.',
              style: FlutterFlowTheme.of(context).bodyLarge,
            ),
            SizedBox(
              width: double.infinity,
              height: 150.0,
              child: custom_widgets.RecorderWidget(
                width: double.infinity,
                height: 150.0,
                uid: currentUserReference!.id,
                eventId: widget.eventId!,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.00, -1.00),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Abschliessen',
                options: FFButtonOptions(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
