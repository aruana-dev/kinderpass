import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/settings/enter_email/enter_email_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'access_model.dart';
export 'access_model.dart';

class AccessWidget extends StatefulWidget {
  const AccessWidget({
    super.key,
    this.comingFrom,
  });

  final String? comingFrom;

  @override
  _AccessWidgetState createState() => _AccessWidgetState();
}

class _AccessWidgetState extends State<AccessWidget> {
  late AccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccessModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.comingFrom == 'changedMobile') {
        await action_blocks.primarySnackBar(
          context,
          message: 'Mobiltelefonnummer erfolgreich aktualisiert',
        );
        setState(() {});
      } else if (widget.comingFrom == 'triedToChangeMobile') {
        await action_blocks.primarySnackBar(
          context,
          message: 'Aktualisieren der Mobiltelefonnummer abgebrochen',
        );
        setState(() {});
      }
    });

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
                        'Zugang',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'RegistrationStep2',
                          queryParameters: {
                            'comingFrom': serializeParam(
                              'access',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'Mobiltelefonnummer ändern',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 10.0, 5.0),
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
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.75,
                                  child: const EnterEmailWidget(),
                                ),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() => _model.email = value));

                        if (_model.email != null && _model.email != '') {
                          _model.isValid =
                              await BuildshipGroup.validateEmailCall.call(
                            email: _model.email,
                          );
                          if ((_model.isValid?.succeeded ?? true)) {
                            try {
                              final result = await FirebaseFunctions.instance
                                  .httpsCallable('addEmailCLIENT')
                                  .call({
                                "mobile": currentPhoneNumber,
                                "email": _model.email!,
                              });
                              _model.addEmailRES =
                                  AddEmailCLIENTCloudFunctionCallResponse(
                                succeeded: true,
                              );
                            } on FirebaseFunctionsException catch (error) {
                              _model.addEmailRES =
                                  AddEmailCLIENTCloudFunctionCallResponse(
                                errorCode: error.code,
                                succeeded: false,
                              );
                            }

                            if (_model.addEmailRES!.succeeded!) {
                              await action_blocks.primarySnackBar(
                                context,
                                message:
                                    'E-Mail-Adresse erfolgreich aktualisiert',
                              );
                              setState(() {});
                            } else {
                              await action_blocks.primarySnackBar(
                                context,
                                message:
                                    'Fehler beim Aktualisieren der E-Mail-Adresse',
                              );
                              setState(() {});
                            }
                          }
                        }

                        setState(() {});
                      },
                      child: ListTile(
                        title: Text(
                          'E-Mail-Adresse ändern',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 10.0, 5.0),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (currentUserEmail.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'E-Mail-Adresse fehlt',
                              ),
                            ),
                          );
                          return;
                        }
                        await authManager.resetPassword(
                          email: currentUserEmail,
                          context: context,
                        );
                      },
                      child: ListTile(
                        title: Text(
                          'Passwort zurücksetzen',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 10.0, 5.0),
                      ),
                    ),
                  ],
                ),
                wrapWithModel(
                  model: _model.giveFeedbackButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const GiveFeedbackButtonWidget(
                    page: 'access',
                  ),
                ),
              ].divide(const SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
