import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/more_on/more_on_template/more_on_template_widget.dart';
import '/pages/components/onboarding/cancel_onboarding_button/cancel_onboarding_button_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'onboarding_step2_model.dart';
export 'onboarding_step2_model.dart';

class OnboardingStep2Widget extends StatefulWidget {
  const OnboardingStep2Widget({super.key});

  @override
  _OnboardingStep2WidgetState createState() => _OnboardingStep2WidgetState();
}

class _OnboardingStep2WidgetState extends State<OnboardingStep2Widget> {
  late OnboardingStep2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingStep2Model());

    _model.givenNameController ??= TextEditingController();
    _model.givenNameFocusNode ??= FocusNode();

    _model.familiyNameController ??= TextEditingController();
    _model.familiyNameFocusNode ??= FocusNode();

    _model.birthdateController ??= TextEditingController();
    _model.birthdateFocusNode ??= FocusNode();

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
                        'Wen dürfen wir vorstellen?',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Gib die folgenden Informationen so an, wie sie auf deinem Ausweis stehen.',
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
                          controller: _model.givenNameController,
                          focusNode: _model.givenNameFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.givenNameController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofocus: true,
                          autofillHints: const [AutofillHints.givenName],
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Vorname(n)',
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
                            suffixIcon:
                                _model.givenNameController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.givenNameController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                          validator: _model.givenNameControllerValidator
                              .asValidator(context),
                        ),
                        TextFormField(
                          controller: _model.familiyNameController,
                          focusNode: _model.familiyNameFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.familiyNameController',
                            const Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          autofillHints: const [AutofillHints.familyName],
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Familienname',
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
                            suffixIcon:
                                _model.familiyNameController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.familiyNameController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                          validator: _model.familiyNameControllerValidator
                              .asValidator(context),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _model.birthdateController,
                              focusNode: _model.birthdateFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.birthdateController',
                                const Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Geburtsdatum',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelSmall,
                                hintText: 'z.B. 31.12.1980',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
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
                                suffixIcon: _model
                                        .birthdateController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.birthdateController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                              keyboardType: TextInputType.number,
                              validator: _model.birthdateControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.birthdateMask],
                            ),
                            Text(
                              'Dein Geburtsdatum bleibt privat.',
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                          ],
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
                                givenName: _model.givenNameController.text,
                                familyName: _model.familiyNameController.text,
                                birthdate: _model.birthdateController.text,
                                clearUnsetFields: false,
                              ),
                            ));

                            context.pushNamed('OnboardingStep3');
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
                      page: 'onboardingStep2',
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
