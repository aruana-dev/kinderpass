import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'registration_step5_model.dart';
export 'registration_step5_model.dart';

class RegistrationStep5Widget extends StatefulWidget {
  const RegistrationStep5Widget({super.key});

  @override
  _RegistrationStep5WidgetState createState() =>
      _RegistrationStep5WidgetState();
}

class _RegistrationStep5WidgetState extends State<RegistrationStep5Widget> {
  late RegistrationStep5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrationStep5Model());

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
                        'Bestätigungslink gesendet',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Text(
                        'Wir haben dir einen Link zum Setzen deines Passworts geschickt.',
                        style: FlutterFlowTheme.of(context).bodyLarge,
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.00, -1.00),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.goNamed('RegistrationStep6');
                      },
                      text: 'Weiter',
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
                      page: 'registrationStep5',
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
