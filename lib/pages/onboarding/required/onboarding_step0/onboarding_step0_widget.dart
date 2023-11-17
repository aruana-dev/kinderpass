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
import 'onboarding_step0_model.dart';
export 'onboarding_step0_model.dart';

class OnboardingStep0Widget extends StatefulWidget {
  const OnboardingStep0Widget({super.key});

  @override
  _OnboardingStep0WidgetState createState() => _OnboardingStep0WidgetState();
}

class _OnboardingStep0WidgetState extends State<OnboardingStep0Widget> {
  late OnboardingStep0Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingStep0Model());

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zweck des Kontos bestimmen',
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                          Text(
                            'Zu welchem Zweck erstellst du dieses Konto? Wenn du sowohl Buchen als auch Anbieten auswählst, erstellst du ein Hybrid-Konto.',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  roles: createRoleStruct(
                                    isClient: true,
                                    isManager: false,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              },
                              child: ListTile(
                                title: Text(
                                  'Buchen',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                subtitle: Text(
                                  'Ich buche für mir gesetzlich anvertraute Kinder und Jugendliche.',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                trailing: Icon(
                                  Icons.check,
                                  color: currentUserDocument!.roles.isClient
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  size: 20.0,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                dense: false,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 5.0, 10.0, 5.0),
                              ),
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  roles: createRoleStruct(
                                    isClient: false,
                                    isManager: true,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              },
                              child: ListTile(
                                title: Text(
                                  'Anbieten',
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                subtitle: Text(
                                  'Ich repräsentiere eine private oder organisierte Veranstalter:in.',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                trailing: Icon(
                                  Icons.check,
                                  color: currentUserDocument!.roles.isManager
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  size: 20.0,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                dense: false,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 5.0, 10.0, 5.0),
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
                                if (currentUserDocument!.roles.isClient ||
                                    currentUserDocument!.roles.isManager) {
                                  context.goNamed('OnboardingStep1');
                                } else {
                                  await action_blocks.primarySnackBar(
                                    context,
                                    message:
                                        'Bestimme den Zweck des zu erstellenden Kontos.',
                                  );
                                }
                              },
                              text: 'Bestätigen',
                              options: FFButtonOptions(
                                width: double.infinity,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
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
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    barrierColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
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
                          page: 'onboardingStep0',
                        ),
                      ),
                    ].divide(const SizedBox(height: 30.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
