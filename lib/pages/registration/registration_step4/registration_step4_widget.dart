import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'registration_step4_model.dart';
export 'registration_step4_model.dart';

class RegistrationStep4Widget extends StatefulWidget {
  const RegistrationStep4Widget({
    super.key,
    required this.mobile,
  });

  final String? mobile;

  @override
  _RegistrationStep4WidgetState createState() =>
      _RegistrationStep4WidgetState();
}

class _RegistrationStep4WidgetState extends State<RegistrationStep4Widget> {
  late RegistrationStep4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationStep4Model());

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

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
                        'E-Mail-Adresse bestätigen',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Gib deine E-Mail-Adresse ein und klicke anschliessend auf Link zum Setzen des Passworts senden.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _model.emailController,
                          focusNode: _model.emailFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.emailController',
                            const Duration(milliseconds: 100),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'E-Mail-Adresse',
                            labelStyle: FlutterFlowTheme.of(context).labelSmall,
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
                            suffixIcon: _model.emailController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.emailController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailControllerValidator
                              .asValidator(context),
                        ),
                        Text(
                          'Wir senden dir einen Link zum Zurücksetzen deines Passworts.',
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.00, -1.00),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          return;
                        }
                        _model.isValid =
                            await BuildshipGroup.validateEmailCall.call(
                          email: _model.emailController.text,
                        );
                        if ((_model.isValid?.succeeded ?? true)) {
                          try {
                            final result = await FirebaseFunctions.instance
                                .httpsCallable('doesUserExistCLIENT')
                                .call({
                              "mobile": widget.mobile,
                              "email": _model.emailController.text,
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
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Du hast bereits ein Konto',
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
                                  label: 'Anmelden',
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  onPressed: () async {
                                    context.goNamed('PhoneAuthentication');
                                  },
                                ),
                              ),
                            );
                          } else {
                            try {
                              final result = await FirebaseFunctions.instance
                                  .httpsCallable('addEmailCLIENT')
                                  .call({
                                "mobile": widget.mobile!,
                                "email": _model.emailController.text,
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
                              await BuildshipGroup.sendWelcomeEmailCall.call(
                                email: _model.emailController.text,
                              );
                              if (_model.emailController.text.isEmpty) {
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
                                email: _model.emailController.text,
                                context: context,
                              );

                              context.goNamed('RegistrationStep5');
                            } else {
                              await action_blocks.primarySnackBar(
                                context,
                                message: 'Unbekannter Fehler',
                              );
                            }
                          }
                        } else {
                          await action_blocks.primarySnackBar(
                            context,
                            message: 'E-Mail-Adresse ungültig',
                          );
                        }

                        setState(() {});
                      },
                      text: 'Link zum Setzen des Passworts senden',
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
                  wrapWithModel(
                    model: _model.giveFeedbackButtonModel,
                    updateCallback: () => setState(() {}),
                    child: const GiveFeedbackButtonWidget(
                      page: 'registrationStep4',
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
