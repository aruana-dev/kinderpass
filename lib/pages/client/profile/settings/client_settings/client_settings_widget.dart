import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/settings/confirm_log_out_button/confirm_log_out_button_widget.dart';
import '/pages/components/settings/set_color_mode/set_color_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'client_settings_model.dart';
export 'client_settings_model.dart';

class ClientSettingsWidget extends StatefulWidget {
  const ClientSettingsWidget({super.key});

  @override
  _ClientSettingsWidgetState createState() => _ClientSettingsWidgetState();
}

class _ClientSettingsWidgetState extends State<ClientSettingsWidget> {
  late ClientSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          actions: [
            wrapWithModel(
              model: _model.confirmLogOutButtonModel,
              updateCallback: () => setState(() {}),
              child: const ConfirmLogOutButtonWidget(),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Einstellungen',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Notifications');
                  },
                  child: ListTile(
                    title: Text(
                      'Benachrichtigungen',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: true,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 10.0, 5.0),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.75,
                              child: const SetColorModeWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: ListTile(
                    title: Text(
                      'Farbschema',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: true,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 10.0, 5.0),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Language');
                  },
                  child: ListTile(
                    title: Text(
                      'Sprache',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: true,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 10.0, 5.0),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Access');
                  },
                  child: ListTile(
                    title: Text(
                      'Zugang',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    tileColor: FlutterFlowTheme.of(context).primaryBackground,
                    dense: true,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 10.0, 5.0),
                  ),
                ),
                wrapWithModel(
                  model: _model.giveFeedbackButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const GiveFeedbackButtonWidget(
                    page: 'settings',
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
