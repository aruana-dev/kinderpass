import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/support/contact_support_button/contact_support_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'choose_authentication_flow_model.dart';
export 'choose_authentication_flow_model.dart';

class ChooseAuthenticationFlowWidget extends StatefulWidget {
  const ChooseAuthenticationFlowWidget({super.key});

  @override
  _ChooseAuthenticationFlowWidgetState createState() =>
      _ChooseAuthenticationFlowWidgetState();
}

class _ChooseAuthenticationFlowWidgetState
    extends State<ChooseAuthenticationFlowWidget> {
  late ChooseAuthenticationFlowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseAuthenticationFlowModel());

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/galaxy_background.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.00, -1.00),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.00, -1.00),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 0.0,
                        buttonSize: 60.0,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
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
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anmelden',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  Text(
                    'Wie möchtest du fortfahren?',
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('PhoneAuthentication');
                    },
                    text: 'Mit Mobiltelefon fortfahren',
                    icon: const Icon(
                      Icons.phone_iphone,
                      size: 15.0,
                    ),
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
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('EmailAuthentication');
                    },
                    text: 'Mit E-Mail fortfahren',
                    icon: const Icon(
                      Icons.email,
                      size: 15.0,
                    ),
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
                ].divide(const SizedBox(height: 10.0)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.contactSupportButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const ContactSupportButtonWidget(),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.00, 1.00),
                  child: wrapWithModel(
                    model: _model.giveFeedbackButtonModel,
                    updateCallback: () => setState(() {}),
                    child: const GiveFeedbackButtonWidget(
                      page: 'chooseAuthenticationFlow',
                    ),
                  ),
                ),
              ],
            ),
          ].divide(const SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
