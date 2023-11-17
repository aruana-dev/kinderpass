import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/support/choose_support_channel/choose_support_channel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact_support_button_model.dart';
export 'contact_support_button_model.dart';

class ContactSupportButtonWidget extends StatefulWidget {
  const ContactSupportButtonWidget({super.key});

  @override
  _ContactSupportButtonWidgetState createState() =>
      _ContactSupportButtonWidgetState();
}

class _ContactSupportButtonWidgetState
    extends State<ContactSupportButtonWidget> {
  late ContactSupportButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactSupportButtonModel());

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

    return FFButtonWidget(
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color(0x00FFFFFF),
          barrierColor: FlutterFlowTheme.of(context).secondaryBackground,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.75,
                child: const ChooseSupportChannelWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      text: 'Support kontaktieren',
      options: FFButtonOptions(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: const Color(0x00FFFFFF),
        textStyle: FlutterFlowTheme.of(context).titleSmall,
        elevation: 0.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.0,
        ),
      ),
    );
  }
}
