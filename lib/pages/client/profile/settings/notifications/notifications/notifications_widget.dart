import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

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
          actions: const [],
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
                        'Benachrichtigungen',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ],
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => SwitchListTile.adaptive(
                    value: _model.switchListTileValue1 ??=
                        currentUserDocument!.settings.pushNotificationsEnabled,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue1 = newValue);
                      if (newValue) {
                        await requestPermission(notificationsPermission);

                        await currentUserReference!
                            .update(createUsersRecordData(
                          settings: createSettingsStruct(
                            pushNotificationsEnabled: true,
                            clearUnsetFields: false,
                          ),
                        ));
                      } else {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          settings: createSettingsStruct(
                            pushNotificationsEnabled: false,
                            clearUnsetFields: false,
                          ),
                        ));
                      }
                    },
                    title: Text(
                      'Push-Mitteilungen',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                if (currentUserDocument?.settings.pushNotificationsEnabled ??
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue1 ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue1 = newValue!);
                        },
                        title: Text(
                          'Passendes Angebot gefunden',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        subtitle: Text(
                          'Wenn ein neues Angebot deinem Suchprofil bzw. einem deiner Kinderprofile entspricht.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkColor: FlutterFlowTheme.of(context).primaryText,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                if (currentUserDocument?.settings.pushNotificationsEnabled ??
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue2 ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue2 = newValue!);
                        },
                        title: Text(
                          'Neue Nachricht',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        subtitle: Text(
                          'Wenn jemand versucht, dich zu erreichen.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkColor: FlutterFlowTheme.of(context).primaryText,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                if (currentUserDocument?.settings.pushNotificationsEnabled ??
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue3 ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue3 = newValue!);
                        },
                        title: Text(
                          'Erinnerung an Durchführung',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        subtitle: Text(
                          'Wenn eine von dir gebuchte oder favorisierte Durchführung kurz bevorsteht.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkColor: FlutterFlowTheme.of(context).primaryText,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                AuthUserStreamWidget(
                  builder: (context) => SwitchListTile.adaptive(
                    value: _model.switchListTileValue2 ??=
                        currentUserDocument!.settings.emailNotificationsEnabled,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue2 = newValue);
                      if (newValue) {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          settings: createSettingsStruct(
                            emailNotificationsEnabled: true,
                            clearUnsetFields: false,
                          ),
                        ));
                      } else {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          settings: createSettingsStruct(
                            emailNotificationsEnabled: false,
                            clearUnsetFields: false,
                          ),
                        ));
                      }
                    },
                    title: Text(
                      'E-Mail',
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                if (currentUserDocument?.settings.emailNotificationsEnabled ??
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue4 ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue4 = newValue!);
                        },
                        title: Text(
                          'Passendes Angebot gefunden',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        subtitle: Text(
                          'Wenn ein neues Angebot deinem Suchprofil bzw. einem deiner Kinderprofile entspricht.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkColor: FlutterFlowTheme.of(context).primaryText,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                if (currentUserDocument?.settings.emailNotificationsEnabled ??
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue5 ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue5 = newValue!);
                        },
                        title: Text(
                          'Neue Nachricht',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        subtitle: Text(
                          'Wenn jemand versucht, dich zu erreichen.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkColor: FlutterFlowTheme.of(context).primaryText,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                if (currentUserDocument?.settings.emailNotificationsEnabled ??
                    true)
                  AuthUserStreamWidget(
                    builder: (context) => Theme(
                      data: ThemeData(
                        checkboxTheme: const CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue6 ??= true,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue6 = newValue!);
                        },
                        title: Text(
                          'Erinnerung an Durchführung',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        subtitle: Text(
                          'Wenn eine von dir gebuchte oder favorisierte Durchführung kurz bevorsteht.',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        checkColor: FlutterFlowTheme.of(context).primaryText,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                wrapWithModel(
                  model: _model.giveFeedbackButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const GiveFeedbackButtonWidget(
                    page: 'notifications',
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
