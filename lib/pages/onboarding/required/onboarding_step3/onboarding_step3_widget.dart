import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/more_on/more_on_template/more_on_template_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'onboarding_step3_model.dart';
export 'onboarding_step3_model.dart';

class OnboardingStep3Widget extends StatefulWidget {
  const OnboardingStep3Widget({super.key});

  @override
  _OnboardingStep3WidgetState createState() => _OnboardingStep3WidgetState();
}

class _OnboardingStep3WidgetState extends State<OnboardingStep3Widget> {
  late OnboardingStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingStep3Model());

    _model.streetNameController ??= TextEditingController();
    _model.streetNameFocusNode ??= FocusNode();

    _model.streetNumberController ??= TextEditingController();
    _model.streetNumberFocusNode ??= FocusNode();

    _model.postalCodeController ??= TextEditingController();
    _model.postalCodeFocusNode ??= FocusNode();

    _model.localityController ??= TextEditingController();
    _model.localityFocusNode ??= FocusNode();

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
                        'Wie können wir dich kontaktieren?',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Zur Sicherheit und für den Versand wichtiger Dokumente (z.B. Rechnung) benötigen wir deine Adresse.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: _model.streetNameController,
                                focusNode: _model.streetNameFocusNode,
                                autofocus: true,
                                autofillHints: const [
                                  AutofillHints.streetAddressLine1
                                ],
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Strasse',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelSmall,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                                keyboardType: TextInputType.streetAddress,
                                validator: _model.streetNameControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _model.streetNumberController,
                                focusNode: _model.streetNumberFocusNode,
                                autofocus: true,
                                autofillHints: const [
                                  AutofillHints.streetAddressLine2
                                ],
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nr.',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelSmall,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                                keyboardType: TextInputType.streetAddress,
                                validator: _model
                                    .streetNumberControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ].divide(const SizedBox(width: 3.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _model.postalCodeController,
                                focusNode: _model.postalCodeFocusNode,
                                autofocus: true,
                                autofillHints: const [AutofillHints.postalCode],
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'PLZ',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelSmall,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                                keyboardType: TextInputType.number,
                                validator: _model.postalCodeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: _model.localityController,
                                focusNode: _model.localityFocusNode,
                                autofocus: true,
                                autofillHints: const [AutofillHints.addressCity],
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Ort',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelSmall,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodySmall,
                                keyboardType: TextInputType.streetAddress,
                                validator: _model.localityControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ].divide(const SizedBox(width: 3.0)),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.00, -1.00),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }

                            await currentUserReference!
                                .update(createUsersRecordData(
                              profile: createProfileStruct(
                                address: createAddressStruct(
                                  streetName: _model.streetNameController.text,
                                  streetNumber:
                                      _model.streetNumberController.text,
                                  postalCode: _model.postalCodeController.text,
                                  locality: _model.localityController.text,
                                  clearUnsetFields: false,
                                ),
                                hasPassedRequiredOnboardingSteps: true,
                                clearUnsetFields: false,
                              ),
                            ));

                            context.goNamed('OnboardingStep4');
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
                      page: 'onboardingStep3',
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
