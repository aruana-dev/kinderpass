import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'registration_step1_model.dart';
export 'registration_step1_model.dart';

class RegistrationStep1Widget extends StatefulWidget {
  const RegistrationStep1Widget({super.key});

  @override
  _RegistrationStep1WidgetState createState() =>
      _RegistrationStep1WidgetState();
}

class _RegistrationStep1WidgetState extends State<RegistrationStep1Widget> {
  late RegistrationStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationStep1Model());

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
          title: wrapWithModel(
            model: _model.contactSupportButtonModel,
            updateCallback: () => setState(() {}),
            child: const ContactSupportButtonWidget(),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).error,
                size: 24.0,
              ),
              onPressed: () async {
                context.goNamed(
                  'Splash',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
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
                            'Voraussetzungen bestätigen',
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                          Text(
                            'Bestätige, dass du die Voraussetzungen zur Kontoerstellung erfüllst und klicke anschliessend auf Weiter.',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Theme(
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
                              value: _model.checkboxListTileValue1 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue1 = newValue!);
                              },
                              title: Text(
                                'Zweitkonto',
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                              subtitle: Text(
                                'Es existiert kein zweites Konto unter meinem Namen.',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              checkColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                          Theme(
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
                              value: _model.checkboxListTileValue2 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue2 = newValue!);
                              },
                              title: Text(
                                'Zahlungsmittel',
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                              subtitle: Text(
                                'Ich verfüge über ein Zahlungsmittel (TWINT, Debit- oder Kreditkarte).',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              checkColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ),
                          Theme(
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
                              value: _model.checkboxListTileValue3 ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.checkboxListTileValue3 = newValue!);
                              },
                              title: Text(
                                'Nutzungsbedingungen',
                                style: FlutterFlowTheme.of(context).titleLarge,
                              ),
                              subtitle: Text(
                                'Ich habe die Nutzungsbedingungen von kinderpass gelesen und akzeptiert.',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              checkColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
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
                              onPressed: !(_model.checkboxListTileValue1! &&
                                      _model.checkboxListTileValue2! &&
                                      _model.checkboxListTileValue3!)
                                  ? null
                                  : () async {
                                      context.goNamed('RegistrationStep2');
                                    },
                              text: _model.checkboxListTileValue1! &&
                                      _model.checkboxListTileValue2! &&
                                      _model.checkboxListTileValue3!
                                  ? 'Bestätigen'
                                  : 'Bestätige zuerst alle Voraussetzungen',
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
                                disabledColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                disabledTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                  context.pushNamed('TermsOfUse');
                                },
                                text: 'Nutzungsbedingungen lesen',
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
                          page: 'registrationStep1',
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
