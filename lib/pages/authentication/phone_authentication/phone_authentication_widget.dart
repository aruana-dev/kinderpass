import '/auth/firebase_auth/auth_util.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'phone_authentication_model.dart';
export 'phone_authentication_model.dart';

class PhoneAuthenticationWidget extends StatefulWidget {
  const PhoneAuthenticationWidget({super.key});

  @override
  _PhoneAuthenticationWidgetState createState() =>
      _PhoneAuthenticationWidgetState();
}

class _PhoneAuthenticationWidgetState extends State<PhoneAuthenticationWidget> {
  late PhoneAuthenticationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneAuthenticationModel());

    _model.mobileController ??= TextEditingController();
    _model.mobileFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
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
        body: Padding(
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
                      'Mobiltelefon',
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                    Text(
                      'Gib deine Mobiltelefonnummer ein und klicke anschliessend auf Bestätigungscode senden.',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: TextFormField(
                        controller: _model.mobileController,
                        focusNode: _model.mobileFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.mobileController',
                          const Duration(milliseconds: 100),
                          () => setState(() {}),
                        ),
                        autofocus: true,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Mobiltelefonnummer',
                          labelStyle: FlutterFlowTheme.of(context).labelSmall,
                          hintText: 'z.B. +41 79 123 45 67',
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          suffixIcon: _model.mobileController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.mobileController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall,
                        keyboardType: TextInputType.phone,
                        validator: _model.mobileControllerValidator
                            .asValidator(context),
                        inputFormatters: [_model.mobileMask],
                      ),
                    ),
                    Text(
                      'Wir senden dir einen einmaligen Verifizierungstoken.',
                      style: FlutterFlowTheme.of(context).labelSmall,
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
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          try {
                            final result = await FirebaseFunctions.instance
                                .httpsCallable('doesUserExistCLIENT')
                                .call({
                              "mobile": _model.mobileController.text,
                              "email": null,
                            });
                            _model.doesUserExistRES =
                                DoesUserExistCLIENTCloudFunctionCallResponse(
                              data: result.data,
                              succeeded: true,
                              resultAsString: result.data.toString(),
                              jsonBody: result.data,
                            );
                          } on FirebaseFunctionsException catch (error) {
                            _model.doesUserExistRES =
                                DoesUserExistCLIENTCloudFunctionCallResponse(
                              errorCode: error.code,
                              succeeded: false,
                            );
                          }

                          if (_model.doesUserExistRES!.data!) {
                            final phoneNumberVal = _model.mobileController.text;
                            if (phoneNumberVal.isEmpty ||
                                !phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              return;
                            }
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                context.goNamedAuth(
                                  'PhoneVerification',
                                  context.mounted,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Du hast noch kein Konto',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Colors.black,
                                      ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).warning,
                                action: SnackBarAction(
                                  label: 'Registrieren',
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  onPressed: () async {
                                    context.goNamed('RegistrationStep1');
                                  },
                                ),
                              ),
                            );
                          }

                          setState(() {});
                        },
                        text: 'Verifizierungstoken senden',
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
                          borderSide: BorderSide(
                            color: _model.mobileController.text == ''
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context).primary,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.00, -1.00),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.goNamed('EmailAuthentication');
                          },
                          text: 'Mit E-Mail-Adresse anmelden',
                          options: FFButtonOptions(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x00FFFFFF),
                            textStyle: FlutterFlowTheme.of(context).titleSmall,
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
                Align(
                  alignment: const AlignmentDirectional(0.00, 0.38),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: wrapWithModel(
                      model: _model.giveFeedbackButtonModel,
                      updateCallback: () => setState(() {}),
                      child: const GiveFeedbackButtonWidget(
                        page: 'phoneAuthentication',
                      ),
                    ),
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
