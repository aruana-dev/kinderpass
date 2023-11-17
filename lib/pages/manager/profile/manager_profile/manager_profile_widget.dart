import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/pages/components/navbar/manager_nav_bar/manager_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'manager_profile_model.dart';
export 'manager_profile_model.dart';

class ManagerProfileWidget extends StatefulWidget {
  const ManagerProfileWidget({super.key});

  @override
  _ManagerProfileWidgetState createState() => _ManagerProfileWidgetState();
}

class _ManagerProfileWidgetState extends State<ManagerProfileWidget> {
  late ManagerProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().currentPage = 'profile';
      });
    });

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
            FlutterFlowIconButton(
              borderRadius: 30.0,
              borderWidth: 0.0,
              buttonSize: 60.0,
              fillColor: const Color(0x00FFFFFF),
              icon: Icon(
                Icons.settings_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('ManagerSettings');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        'Profil',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: wrapWithModel(
                        model: _model.giveFeedbackButtonModel,
                        updateCallback: () => setState(() {}),
                        child: const GiveFeedbackButtonWidget(
                          page: 'managerProfile',
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 30.0)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: wrapWithModel(
                  model: _model.managerNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: const ManagerNavBarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
