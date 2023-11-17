import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_model.dart';
export 'event_model.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  late EventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventModel());

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
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 300.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/galaxy_background.png',
                  width: double.infinity,
                  height: 300.0,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.00, -1.00),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.00, -1.00),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.favorite,
                          color: currentUserDocument!.profile.favoriteEventsRefs
                                  .contains(widget.event?.reference)
                              ? FlutterFlowTheme.of(context).error
                              : FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          if (currentUserDocument!.profile.favoriteEventsRefs
                              .contains(widget.event?.reference)) {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              profile: createProfileStruct(
                                fieldValues: {
                                  'favoriteEventsRefs': FieldValue.arrayRemove(
                                      [widget.event?.reference]),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                          } else {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              profile: createProfileStruct(
                                fieldValues: {
                                  'favoriteEventsRefs': FieldValue.arrayUnion(
                                      [widget.event?.reference]),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.00, -1.00),
                            child: Container(
                              height: 25.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0E3E7),
                                borderRadius: BorderRadius.circular(30.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'übermorgen',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.00, -1.00),
                            child: Container(
                              height: 25.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).warning,
                                borderRadius: BorderRadius.circular(30.0),
                                shape: BoxShape.rectangle,
                              ),
                              alignment: const AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                  'unklar',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget.event?.event.title,
                            'Titel',
                          ).maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context).titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
