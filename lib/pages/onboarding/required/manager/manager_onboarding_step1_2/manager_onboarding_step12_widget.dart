import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/more_on/more_on_template/more_on_template_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'manager_onboarding_step12_model.dart';
export 'manager_onboarding_step12_model.dart';

class ManagerOnboardingStep12Widget extends StatefulWidget {
  const ManagerOnboardingStep12Widget({super.key});

  @override
  _ManagerOnboardingStep12WidgetState createState() =>
      _ManagerOnboardingStep12WidgetState();
}

class _ManagerOnboardingStep12WidgetState
    extends State<ManagerOnboardingStep12Widget> {
  late ManagerOnboardingStep12Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerOnboardingStep12Model());

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
          automaticallyImplyLeading: false,
          actions: [
            wrapWithModel(
              model: _model.cancelOnboardingButtonModel,
              updateCallback: () => setState(() {}),
              child: const CancelOnboardingButtonWidget(),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wie bist du / seid ihr organisiert?',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Gib an, welche der folgenden Optionen auf dich / euch zutrifft.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
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
                            value: _model.checkboxListTileValue1 ??=
                                currentUserDocument!.profile.isPrivateManager,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue1 = newValue!);
                              if (newValue!) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  profile: createProfileStruct(
                                    isPrivateManager: true,
                                    isPublicManager: false,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  profile: createProfileStruct(
                                    isPrivateManager: false,
                                    isPublicManager: true,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              }
                            },
                            title: Text(
                              'Privat',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            subtitle: Text(
                              'Privatperson',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            checkColor:
                                FlutterFlowTheme.of(context).primaryText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
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
                            value: _model.checkboxListTileValue2 ??=
                                currentUserDocument!.profile.isPublicManager,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.checkboxListTileValue2 = newValue!);
                              if (newValue!) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  profile: createProfileStruct(
                                    isPublicManager: true,
                                    isPrivateManager: false,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  profile: createProfileStruct(
                                    isPublicManager: false,
                                    isPrivateManager: true,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              }
                            },
                            title: Text(
                              'Öffentlich',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            subtitle: Text(
                              'Verein, Institution, Firma',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            checkColor:
                                FlutterFlowTheme.of(context).primaryText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.00, -1.00),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (currentUserDocument!.profile.isPrivateManager &&
                                currentUserDocument!.profile.isPublicManager) {
                              await action_blocks.primarySnackBar(
                                context,
                                message:
                                    'Du kannst nicht gleichzeitig privat und öffentlich organisiert sein.',
                              );
                            } else if (currentUserDocument!
                                    .profile.isPrivateManager &&
                                !currentUserDocument!.profile.isPublicManager) {
                              context.pushNamed('OnboardingStep2');
                            } else if (!currentUserDocument!
                                    .profile.isPrivateManager &&
                                currentUserDocument!.profile.isPublicManager) {
                              context.pushNamed('OnboardingStep2');
                            } else {
                              await action_blocks.primarySnackBar(
                                context,
                                message: 'Unbekannter Fehler',
                              );
                            }
                          },
                          text: 'Weiter',
                          options: FFButtonOptions(
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
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
                      Align(
                        alignment: const AlignmentDirectional(1.00, -1.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        child: const MoreOnTemplateWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Mehr Informationen',
                            options: FFButtonOptions(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    decoration: TextDecoration.underline,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  wrapWithModel(
                    model: _model.giveFeedbackButtonModel,
                    updateCallback: () => setState(() {}),
                    child: const GiveFeedbackButtonWidget(
                      page: 'managerOnboardingStep1-2',
                    ),
                  ),
                ].divide(const SizedBox(height: 30.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
