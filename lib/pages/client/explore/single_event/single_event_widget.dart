import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/feedback/give_feedback_button/give_feedback_button_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'single_event_model.dart';
export 'single_event_model.dart';

class SingleEventWidget extends StatefulWidget {
  const SingleEventWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  _SingleEventWidgetState createState() => _SingleEventWidgetState();
}

class _SingleEventWidgetState extends State<SingleEventWidget> {
  late SingleEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleEventModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!currentUserDocument!.profile.hasPassedRequiredRegistrationSteps) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Unbekannter Fehler im Registrierungsprozess',
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Open Sans',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).warning,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 1000));
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        context.pushNamedAuth('Splash', context.mounted);
      } else if (!currentUserDocument!
          .profile.hasPassedRequiredOnboardingSteps) {
        context.goNamedAuth('OnboardingStep1', context.mounted);
      } else if (!currentUserDocument!.profile.hasPassedPersonalProfileSteps) {
        setState(() {
          FFAppState().needsAttention = true;
        });
      } else if (!currentUserDocument!.profile.hasPassedFamilyProfileSteps) {
        setState(() {
          FFAppState().needsAttention = true;
        });
      } else {
        setState(() {
          FFAppState().isReady = true;
          FFAppState().needsAttention = false;
        });
        await action_blocks.getFilteredEvents(context);
        setState(() {});
      }
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                widget.event?.event.mainImage,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kinderpass-02hgj3/assets/7woo487y4v7t/galaxy_background.png',
                              ),
                              fit: BoxFit.contain,
                              alignment: const Alignment(0.00, -1.00),
                            ),
                            allowRotation: false,
                            tag: valueOrDefault<String>(
                              widget.event?.event.mainImage,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kinderpass-02hgj3/assets/7woo487y4v7t/galaxy_background.png',
                            ),
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: valueOrDefault<String>(
                        widget.event?.event.mainImage,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kinderpass-02hgj3/assets/7woo487y4v7t/galaxy_background.png',
                      ),
                      transitionOnUserGestures: true,
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: valueOrDefault<String>(
                          widget.event?.event.mainImage,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/kinderpass-02hgj3/assets/7woo487y4v7t/galaxy_background.png',
                        ),
                        width: double.infinity,
                        height: 300.0,
                        fit: BoxFit.cover,
                        alignment: const Alignment(0.00, -1.00),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(30.0),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'in 2 Tagen',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.00, -1.00),
                          child: Container(
                            height: 25.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(30.0),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: const AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'Eignung unklar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.event!.event.title,
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    Text(
                      'Veranstalter:in',
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(30.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Text(
                          'ab 12 Jahren',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  widget.event!.event.shortDescription,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Jetzt buchen',
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  widget.event!.event.description,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              if (widget.event!.event.media.isNotEmpty)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: StreamBuilder<EventsRecord>(
                    stream: EventsRecord.getDocument(widget.event!.reference),
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
                      final carouselEventsRecord = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final media =
                              carouselEventsRecord.event.media.toList();
                          if (media.isEmpty) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/galaxy_background.png',
                                height: 300.0,
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                          return SizedBox(
                            height: 300.0,
                            child: CarouselSlider.builder(
                              itemCount: media.length,
                              itemBuilder: (context, mediaIndex, _) {
                                final mediaItem = media[mediaIndex];
                                return FlutterFlowMediaDisplay(
                                  path: mediaItem.image != ''
                                      ? mediaItem.image
                                      : mediaItem.video,
                                  imageBuilder: (path) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      path,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  videoPlayerBuilder: (path) =>
                                      FlutterFlowVideoPlayer(
                                    path: path,
                                    width: double.infinity,
                                    height: double.infinity,
                                    autoPlay: true,
                                    looping: true,
                                    showControls: false,
                                    allowFullScreen: false,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselController(),
                              options: CarouselOptions(
                                initialPage: min(0, media.length - 1),
                                viewportFraction: 1.0,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 1.0,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.horizontal,
                                autoPlay: false,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              wrapWithModel(
                model: _model.giveFeedbackButtonModel,
                updateCallback: () => setState(() {}),
                child: const GiveFeedbackButtonWidget(
                  page: 'singleEvent',
                ),
              ),
            ].divide(const SizedBox(height: 30.0)),
          ),
        ),
      ),
    );
  }
}
