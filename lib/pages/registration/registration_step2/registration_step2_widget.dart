import '/backend/api_requests/api_calls.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/authentication/confirm_mobile/confirm_mobile_widget.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'registration_step2_model.dart';
export 'registration_step2_model.dart';

class RegistrationStep2Widget extends StatefulWidget {
  const RegistrationStep2Widget({
    super.key,
    this.comingFrom,
  });

  final String? comingFrom;

  @override
  _RegistrationStep2WidgetState createState() =>
      _RegistrationStep2WidgetState();
}

class _RegistrationStep2WidgetState extends State<RegistrationStep2Widget> {
  late RegistrationStep2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationStep2Model());

    _model.mobileController ??= TextEditingController();
    _model.mobileFocusNode ??= FocusNode();

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
                  context.goNamed(
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
                        'Mobiltelefonnummer bestätigen',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Gib deine Mobiltelefonnummer ein und klicke anschliessend auf Verifizierungstoken senden.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _model.mobileController,
                        focusNode: _model.mobileFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.mobileController',
                          const Duration(milliseconds: 100),
                          () => setState(() {}),
                        ),
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
                      Text(
                        'Wir senden dir einen einmaligen Verifizierungstoken.',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.00, -1.00),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.isValid =
                            await BuildshipGroup.validateMobileCall.call(
                          mobile: _model.mobileController.text,
                        );
                        if ((_model.isValid?.succeeded ?? true)) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            enableDrag: false,
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
                                        MediaQuery.sizeOf(context).height * 0.5,
                                    child: ConfirmMobileWidget(
                                      mobile: _model.mobileController.text,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) =>
                              safeSetState(() => _model.isCorrect = value));

                          if (_model.isCorrect == true) {
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
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    onPressed: () async {
                                      context
                                          .goNamed('ChooseAuthenticationFlow');
                                    },
                                  ),
                                ),
                              );
                            } else {
                              try {
                                final result = await FirebaseFunctions.instance
                                    .httpsCallable(
                                        'sendVerificationTokenCLIENT')
                                    .call({
                                  "mobile": _model.mobileController.text,
                                });
                                _model.sendVerificationTokenRES =
                                    SendVerificationTokenCLIENTCloudFunctionCallResponse(
                                  data: result.data,
                                  succeeded: true,
                                  resultAsString: result.data.toString(),
                                  jsonBody: result.data,
                                );
                              } on FirebaseFunctionsException catch (error) {
                                _model.sendVerificationTokenRES =
                                    SendVerificationTokenCLIENTCloudFunctionCallResponse(
                                  errorCode: error.code,
                                  succeeded: false,
                                );
                              }

                              if (_model.sendVerificationTokenRES!.succeeded!) {
                                context.pushNamed(
                                  'RegistrationStep3',
                                  queryParameters: {
                                    'mobile': serializeParam(
                                      _model.mobileController.text,
                                      ParamType.String,
                                    ),
                                    'comingFrom': serializeParam(
                                      widget.comingFrom == 'access'
                                          ? 'access'
                                          : '',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Fehler beim Senden des Verifizierungstoken.',
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
                                  ),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Abgebrochen',
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
                              ),
                            );
                          }
                        } else {
                          await action_blocks.primarySnackBar(
                            context,
                            message: 'Mobiltelefonnummer ungültig',
                          );
                        }

                        setState(() {});
                      },
                      text: 'Verifizierungstoken senden',
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
                      page: 'registrationStep2',
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
