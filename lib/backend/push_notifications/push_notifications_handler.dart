import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.black,
          child: Center(
            child: Image.asset(
              'assets/images/kinderpass_logo_white_cropped_transparent.png',
              width: 150.0,
              fit: BoxFit.scaleDown,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'PhoneAuthentication': ParameterData.none(),
  'Splash': ParameterData.none(),
  'Inbox': ParameterData.none(),
  'ClientProfile': ParameterData.none(),
  'Explore': ParameterData.none(),
  'Favorites': ParameterData.none(),
  'Bookings': ParameterData.none(),
  'TermsOfUse': ParameterData.none(),
  'PhoneVerification': ParameterData.none(),
  'RegistrationStep1': ParameterData.none(),
  'RegistrationStep2': (data) async => ParameterData(
        allParams: {
          'comingFrom': getParameter<String>(data, 'comingFrom'),
        },
      ),
  'RegistrationStep3': (data) async => ParameterData(
        allParams: {
          'mobile': getParameter<String>(data, 'mobile'),
          'comingFrom': getParameter<String>(data, 'comingFrom'),
        },
      ),
  'RegistrationStep4': (data) async => ParameterData(
        allParams: {
          'mobile': getParameter<String>(data, 'mobile'),
        },
      ),
  'RegistrationStep5': ParameterData.none(),
  'OnboardingStep1': ParameterData.none(),
  'OnboardingStep2': ParameterData.none(),
  'ClientOnboardingStep1-2': ParameterData.none(),
  'OnboardingStep3': ParameterData.none(),
  'OnboardingStep4': ParameterData.none(),
  'OnboardingStep5': ParameterData.none(),
  'OnboardingStep6': ParameterData.none(),
  'OnboardingStep6-1': ParameterData.none(),
  'OnboardingStep6-2': ParameterData.none(),
  'OnboardingStep7': ParameterData.none(),
  'OnboardingStep7-2': ParameterData.none(),
  'OnboardingStep7-3': ParameterData.none(),
  'AddChildProfileStep1': (data) async => ParameterData(
        allParams: {
          'cameFrom': getParameter<String>(data, 'cameFrom'),
        },
      ),
  'AddChildProfileStep2': (data) async => ParameterData(
        allParams: {
          'newlyCreatedChildProfile':
              await getDocumentParameter<ChildProfilesRecord>(data,
                  'newlyCreatedChildProfile', ChildProfilesRecord.fromSnapshot),
          'cameFrom': getParameter<String>(data, 'cameFrom'),
        },
      ),
  'RegistrationStep6': ParameterData.none(),
  'EmailAuthentication': ParameterData.none(),
  'ChooseAuthenticationFlow': ParameterData.none(),
  'ResetPasswort': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'ClientSettings': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'AddChildProfileStep3': (data) async => ParameterData(
        allParams: {
          'cameFrom': getParameter<String>(data, 'cameFrom'),
        },
      ),
  'SingleEvent': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
        },
      ),
  'Language': ParameterData.none(),
  'Access': (data) async => ParameterData(
        allParams: {
          'comingFrom': getParameter<String>(data, 'comingFrom'),
        },
      ),
  'ErrorPage': (data) async => ParameterData(
        allParams: {
          'log': getParameter<String>(data, 'log'),
        },
      ),
  'AddEvent': ParameterData.none(),
  'Overview': ParameterData.none(),
  'ManagerProfile': ParameterData.none(),
  'ManagerSettings': ParameterData.none(),
  'ManagerInbox': ParameterData.none(),
  'OnboardingStep0': ParameterData.none(),
  'Redirect': ParameterData.none(),
  'ManagerOnboardingStep1-2': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
