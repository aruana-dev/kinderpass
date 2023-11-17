import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'onboarding_step5_model.dart';
export 'onboarding_step5_model.dart';

class OnboardingStep5Widget extends StatefulWidget {
  const OnboardingStep5Widget({super.key});

  @override
  _OnboardingStep5WidgetState createState() => _OnboardingStep5WidgetState();
}

class _OnboardingStep5WidgetState extends State<OnboardingStep5Widget> {
  late OnboardingStep5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingStep5Model());

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
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dein neues Profil einrichten',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Nimm dir einen Moment Zeit, um dein neues Profil einzurichten.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
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
                          if (currentUserDocument
                                  ?.profile.hasPassedPersonalProfileSteps ==
                              true) {
                            HapticFeedback.lightImpact();
                          } else {
                            context.pushNamed('OnboardingStep6');
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Persönliches Profil',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: currentUserDocument?.profile
                                              .hasPassedPersonalProfileSteps ==
                                          true
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                ),
                          ),
                          subtitle: Text(
                            'Dauer: ungefähr 5 Minuten',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: currentUserDocument?.profile
                                              .hasPassedPersonalProfileSteps ==
                                          true
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: currentUserDocument?.profile
                                        .hasPassedPersonalProfileSteps ==
                                    true
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 10.0, 5.0),
                        ),
                      ),
                    ),
                    if (currentUserDocument?.profile.booksForOwn ?? true)
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (currentUserDocument
                                    ?.profile.hasPassedFamilyProfileSteps ==
                                true) {
                              HapticFeedback.lightImpact();
                            } else {
                              context.pushNamed('OnboardingStep7');
                            }
                          },
                          child: ListTile(
                            title: Text(
                              'Familienprofil',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: currentUserDocument?.profile
                                                .hasPassedFamilyProfileSteps ==
                                            true
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                  ),
                            ),
                            subtitle: Text(
                              'Dauer: ungefähr 10 Minuten',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: currentUserDocument?.profile
                                                .hasPassedFamilyProfileSteps ==
                                            true
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: currentUserDocument?.profile
                                          .hasPassedFamilyProfileSteps ==
                                      true
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dense: false,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 10.0, 5.0),
                          ),
                        ),
                      ),
                    if (currentUserDocument?.profile.booksForRelatives ?? true)
                      AuthUserStreamWidget(
                        builder: (context) => ListTile(
                          title: Text(
                            'Verwandtschaftsprofil',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          subtitle: Text(
                            'nicht verfügbar',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 10.0, 5.0),
                        ),
                      ),
                    if (currentUserDocument?.profile.booksOfficially ?? true)
                      AuthUserStreamWidget(
                        builder: (context) => ListTile(
                          title: Text(
                            'Offizielles Profil',
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                          subtitle: Text(
                            'nicht verfügbar',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          dense: false,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 10.0, 5.0),
                        ),
                      ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(1.00, -1.00),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.goNamed(
                          'Explore',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      text: 'Später einrichten',
                      options: FFButtonOptions(
                        width: double.infinity,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ),
                wrapWithModel(
                  model: _model.giveFeedbackButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const GiveFeedbackButtonWidget(
                    page: 'onboardingStep5',
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
