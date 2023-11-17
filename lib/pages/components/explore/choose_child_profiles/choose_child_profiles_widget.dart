import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'choose_child_profiles_model.dart';
export 'choose_child_profiles_model.dart';

class ChooseChildProfilesWidget extends StatefulWidget {
  const ChooseChildProfilesWidget({
    super.key,
    int? index,
  })  : index = index ?? 0;

  final int index;

  @override
  _ChooseChildProfilesWidgetState createState() =>
      _ChooseChildProfilesWidgetState();
}

class _ChooseChildProfilesWidgetState extends State<ChooseChildProfilesWidget> {
  late ChooseChildProfilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseChildProfilesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Für wen suchst du?',
                      style: FlutterFlowTheme.of(context).headlineLarge,
                    ),
                    Text(
                      'Wenn du mehr als ein Profil auswählst, suchen wir Angebote, die für diese Profile in Frage kommen.',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
                StreamBuilder<List<ChildProfilesRecord>>(
                  stream: queryChildProfilesRecord(
                    queryBuilder: (childProfilesRecord) =>
                        childProfilesRecord.where(
                      'childProfile.owner',
                      isEqualTo: currentUserReference,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ChildProfilesRecord> listViewChildProfilesRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChildProfilesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChildProfilesRecord =
                            listViewChildProfilesRecordList[listViewIndex];
                        return AuthUserStreamWidget(
                          builder: (context) => Theme(
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
                              value: _model.checkboxListTileValueMap[
                                      listViewChildProfilesRecord] ??=
                                  currentUserDocument!
                                      .profile.selectedChildProfilesRefs
                                      .contains(listViewChildProfilesRecord
                                          .reference),
                              onChanged: (newValue) async {
                                setState(() => _model.checkboxListTileValueMap[
                                    listViewChildProfilesRecord] = newValue!);
                                if (newValue!) {
                                  setState(() {
                                    FFAppState()
                                        .addToLocalSelectedChildProfilesRefs(
                                            listViewChildProfilesRecord
                                                .reference);
                                  });
                                } else {
                                  setState(() {
                                    FFAppState()
                                        .removeFromLocalSelectedChildProfilesRefs(
                                            listViewChildProfilesRecord
                                                .reference);
                                  });
                                }
                              },
                              title: Text(
                                listViewChildProfilesRecord
                                    .childProfile.givenName,
                                style: FlutterFlowTheme.of(context).titleLarge,
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
                        );
                      },
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            profile: createProfileStruct(
                              fieldValues: {
                                'selectedChildProfilesRefs':
                                    FFAppState().localSelectedChildProfilesRefs,
                              },
                              clearUnsetFields: false,
                            ),
                          ));
                          await action_blocks.getFilteredEvents(context);
                          Navigator.pop(context);
                        },
                        text: 'Speichern',
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
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'AddChildProfileStep1',
                            queryParameters: {
                              'cameFrom': serializeParam(
                                'explore',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Neues Kinderprofil erstellen',
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x00FFFFFF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  ].divide(const SizedBox(height: 10.0)),
                ),
                wrapWithModel(
                  model: _model.giveFeedbackButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const GiveFeedbackButtonWidget(
                    page: 'chooseChildProfiles',
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ].divide(const SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
