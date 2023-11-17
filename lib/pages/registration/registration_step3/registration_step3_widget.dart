import '/auth/firebase_auth/auth_util.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'registration_step3_model.dart';
export 'registration_step3_model.dart';

class RegistrationStep3Widget extends StatefulWidget {
  const RegistrationStep3Widget({
    super.key,
    required this.mobile,
    this.comingFrom,
  });

  final String? mobile;
  final String? comingFrom;

  @override
  _RegistrationStep3WidgetState createState() =>
      _RegistrationStep3WidgetState();
}

class _RegistrationStep3WidgetState extends State<RegistrationStep3Widget> {
  late RegistrationStep3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationStep3Model());

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
                if (widget.comingFrom == 'access') {
                  context.pushNamed(
                    'Access',
                    queryParameters: {
                      'comingFrom': serializeParam(
                        'triedToChangeMobile',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                } else {
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
                }
              },
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
                        'Verifizierungstoken bestätigen',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Gib den Verifizierungstoken ein und klicke anschliessend auf Bestätigen.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  Text(
                    valueOrDefault<String>(
                      'Wir haben dir einen Verifizierungstoken an die Nummer ${widget.mobile} geschickt.',
                      'Wir haben dir einen Verifizierungstoken an die Nummer +41 79 123 45 67 geschickt.',
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 6,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Open Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          enableActiveFill: false,
                          autoFocus: true,
                          enablePinAutofill: false,
                          errorTextSpace: 16.0,
                          showCursor: false,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          obscureText: false,
                          hintCharacter: '●',
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 44.0,
                            fieldWidth: 44.0,
                            borderWidth: 3.0,
                            borderRadius: BorderRadius.circular(10.0),
                            shape: PinCodeFieldShape.box,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            inactiveColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            selectedColor: FlutterFlowTheme.of(context).primary,
                            activeFillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            inactiveFillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                          controller: _model.token,
                          onChanged: (_) {},
                          autovalidateMode: AutovalidateMode.disabled,
                          validator: _model.tokenValidator.asValidator(context),
                        ),
                        Text(
                          'Der Verifizierungstoken ist 10 Minuten gültig.',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ],
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
                            try {
                              final result = await FirebaseFunctions.instance
                                  .httpsCallable('verifyTokenCLIENT')
                                  .call({
                                "mobile": widget.mobile!,
                                "token": _model.token!.text,
                              });
                              _model.verifyTokenRES =
                                  VerifyTokenCLIENTCloudFunctionCallResponse(
                                data: result.data,
                                succeeded: true,
                                resultAsString: result.data.toString(),
                                jsonBody: result.data,
                              );
                            } on FirebaseFunctionsException catch (error) {
                              _model.verifyTokenRES =
                                  VerifyTokenCLIENTCloudFunctionCallResponse(
                                errorCode: error.code,
                                succeeded: false,
                              );
                            }

                            if (_model.verifyTokenRES!.succeeded!) {
                              if (widget.comingFrom == 'access') {
                                try {
                                  final result = await FirebaseFunctions
                                      .instance
                                      .httpsCallable('updatePhoneNumberCLIENT')
                                      .call({
                                    "oldMobile": currentPhoneNumber,
                                    "mobile": widget.mobile!,
                                  });
                                  _model.updatePhoneNumberRES =
                                      UpdatePhoneNumberCLIENTCloudFunctionCallResponse(
                                    data: result.data,
                                    succeeded: true,
                                    resultAsString: result.data.toString(),
                                    jsonBody: result.data,
                                  );
                                } on FirebaseFunctionsException catch (error) {
                                  _model.updatePhoneNumberRES =
                                      UpdatePhoneNumberCLIENTCloudFunctionCallResponse(
                                    errorCode: error.code,
                                    succeeded: false,
                                  );
                                }

                                if (_model.updatePhoneNumberRES!.succeeded!) {
                                  context.goNamed(
                                    'Access',
                                    queryParameters: {
                                      'comingFrom': serializeParam(
                                        'changedMobile',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.goNamed(
                                    'Access',
                                    queryParameters: {
                                      'comingFrom': serializeParam(
                                        'triedToChangeMobile',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              } else {
                                try {
                                  final result = await FirebaseFunctions
                                      .instance
                                      .httpsCallable('createUserCLIENT')
                                      .call({
                                    "mobile": widget.mobile!,
                                  });
                                  _model.createUserRES =
                                      CreateUserCLIENTCloudFunctionCallResponse(
                                    data: result.data,
                                    succeeded: true,
                                    resultAsString: result.data.toString(),
                                    jsonBody: result.data,
                                  );
                                } on FirebaseFunctionsException catch (error) {
                                  _model.createUserRES =
                                      CreateUserCLIENTCloudFunctionCallResponse(
                                    errorCode: error.code,
                                    succeeded: false,
                                  );
                                }

                                if (_model.createUserRES!.data!) {
                                  context.goNamed(
                                    'RegistrationStep4',
                                    queryParameters: {
                                      'mobile': serializeParam(
                                        widget.mobile,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              }
                            } else {
                              await action_blocks.primarySnackBar(
                                context,
                                message: 'Unbekannter Fehler',
                              );
                            }

                            setState(() {});
                          },
                          text: 'Bestätigen',
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
                              context.goNamed(
                                'PhoneAuthentication',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            text: 'Keinen Token erhalten?',
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
                      page: 'registrationStep3',
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
