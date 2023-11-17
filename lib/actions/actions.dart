import '/auth/firebase_auth/auth_util.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

Future getFilteredEvents(BuildContext context) async {
  GetFilteredEventsCLIENTCloudFunctionCallResponse? getFilteredEventsRES;

  try {
    final result = await FirebaseFunctions.instance
        .httpsCallable('getFilteredEventsCLIENT')
        .call({});
    getFilteredEventsRES = GetFilteredEventsCLIENTCloudFunctionCallResponse(
      succeeded: true,
    );
  } on FirebaseFunctionsException catch (error) {
    getFilteredEventsRES = GetFilteredEventsCLIENTCloudFunctionCallResponse(
      errorCode: error.code,
      succeeded: false,
    );
  }
}

Future setup(BuildContext context) async {
  if (loggedIn) {
    FFAppState().update(() {
      FFAppState().colorMode = currentUserDocument!.settings.colorMode;
    });
    setAppLanguage(
        context,
        currentUserDocument?.settings.language != null &&
                currentUserDocument?.settings.language != ''
            ? currentUserDocument!.settings.language
            : 'de');
    if (!currentUserDocument!.profile.hasPassedRequiredRegistrationSteps) {
      context.goNamed(
        'ErrorPage',
        queryParameters: {
          'log': serializeParam(
            'redirect, !hasPassedRequiredRegistrationSteps',
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

      return;
    } else if (!currentUserDocument!.profile.hasPassedRequiredOnboardingSteps) {
      context.goNamed(
        'OnboardingStep0',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      return;
    }

    if (currentUserDocument!.roles.isClient &&
        currentUserDocument!.roles.isManager) {
      context.goNamed(
        'ErrorPage',
        queryParameters: {
          'log': serializeParam(
            'redirect, client and manager',
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
    } else if (currentUserDocument!.roles.isClient &&
        !currentUserDocument!.roles.isManager) {
      context.goNamed(
        'Explore',
        extra: <String, dynamic>{
          kTransitionInfoKey: const TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    } else if (!currentUserDocument!.roles.isClient &&
        currentUserDocument!.roles.isManager) {
      context.goNamed(
        'Overview',
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
        'ErrorPage',
        queryParameters: {
          'log': serializeParam(
            'redirect, else',
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
    }
  }
  if (FFAppState().colorMode == 'light') {
    setDarkModeSetting(context, ThemeMode.light);
  } else if (FFAppState().colorMode == 'dark') {
    setDarkModeSetting(context, ThemeMode.dark);
  } else if (FFAppState().colorMode == 'system') {
    setDarkModeSetting(context, ThemeMode.system);
  } else {
    setDarkModeSetting(context, ThemeMode.system);
  }
}

Future primarySnackBar(
  BuildContext context, {
  required String? message,
}) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'Open Sans',
              color: Colors.black,
            ),
      ),
      duration: const Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).warning,
    ),
  );
}
