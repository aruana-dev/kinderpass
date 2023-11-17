import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/settings/confirm_log_out/confirm_log_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'confirm_log_out_button_model.dart';
export 'confirm_log_out_button_model.dart';

class ConfirmLogOutButtonWidget extends StatefulWidget {
  const ConfirmLogOutButtonWidget({super.key});

  @override
  _ConfirmLogOutButtonWidgetState createState() =>
      _ConfirmLogOutButtonWidgetState();
}

class _ConfirmLogOutButtonWidgetState extends State<ConfirmLogOutButtonWidget> {
  late ConfirmLogOutButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmLogOutButtonModel());

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

    return FlutterFlowIconButton(
      borderRadius: 30.0,
      borderWidth: 0.0,
      buttonSize: 60.0,
      fillColor: const Color(0x00FFFFFF),
      icon: Icon(
        Icons.logout_rounded,
        color: FlutterFlowTheme.of(context).error,
        size: 24.0,
      ),
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: FlutterFlowTheme.of(context).secondaryBackground,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: const ConfirmLogOutWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
    );
  }
}
