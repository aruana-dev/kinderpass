import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? const RedirectWidget() : const SplashWidget(),
        errorRoute: state.location,
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? const RedirectWidget() : const SplashWidget(),
          ),
          routes: [
            FFRoute(
              name: 'PhoneAuthentication',
              path: 'phoneAuthentication',
              builder: (context, params) => const PhoneAuthenticationWidget(),
            ),
            FFRoute(
              name: 'Splash',
              path: 'splash',
              builder: (context, params) => const SplashWidget(),
            ),
            FFRoute(
              name: 'Inbox',
              path: 'inbox',
              requireAuth: true,
              builder: (context, params) => const InboxWidget(),
            ),
            FFRoute(
              name: 'ClientProfile',
              path: 'clientProfile',
              requireAuth: true,
              builder: (context, params) => const ClientProfileWidget(),
            ),
            FFRoute(
              name: 'Explore',
              path: 'explore',
              requireAuth: true,
              builder: (context, params) => const ExploreWidget(),
            ),
            FFRoute(
              name: 'Favorites',
              path: 'favorites',
              requireAuth: true,
              builder: (context, params) => const FavoritesWidget(),
            ),
            FFRoute(
              name: 'Bookings',
              path: 'bookings',
              requireAuth: true,
              builder: (context, params) => const BookingsWidget(),
            ),
            FFRoute(
              name: 'TermsOfUse',
              path: 'termsOfUse',
              builder: (context, params) => const TermsOfUseWidget(),
            ),
            FFRoute(
              name: 'PhoneVerification',
              path: 'phoneVerification',
              builder: (context, params) => const PhoneVerificationWidget(),
            ),
            FFRoute(
              name: 'RegistrationStep1',
              path: 'RegistrationStep1',
              builder: (context, params) => const RegistrationStep1Widget(),
            ),
            FFRoute(
              name: 'RegistrationStep2',
              path: 'registrationStep2',
              builder: (context, params) => RegistrationStep2Widget(
                comingFrom: params.getParam('comingFrom', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegistrationStep3',
              path: 'registrationStep3',
              builder: (context, params) => RegistrationStep3Widget(
                mobile: params.getParam('mobile', ParamType.String),
                comingFrom: params.getParam('comingFrom', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegistrationStep4',
              path: 'registrationStep4',
              builder: (context, params) => RegistrationStep4Widget(
                mobile: params.getParam('mobile', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegistrationStep5',
              path: 'registrationStep5',
              builder: (context, params) => const RegistrationStep5Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep1',
              path: 'onboardingStep1',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep1Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep2',
              path: 'onboardingStep2',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep2Widget(),
            ),
            FFRoute(
              name: 'ClientOnboardingStep1-2',
              path: 'clientOnboardingStep12',
              requireAuth: true,
              builder: (context, params) => const ClientOnboardingStep12Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep3',
              path: 'onboardingStep3',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep3Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep4',
              path: 'onboardingStep4',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep4Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep5',
              path: 'onboardingStep5',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep5Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep6',
              path: 'onboardingStep6',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep6Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep6-1',
              path: 'onboardingStep61',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep61Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep6-2',
              path: 'onboardingStep62',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep62Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep7',
              path: 'onboardingStep7',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep7Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep7-2',
              path: 'onboardingStep72',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep72Widget(),
            ),
            FFRoute(
              name: 'OnboardingStep7-3',
              path: 'onboardingStep73',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep73Widget(),
            ),
            FFRoute(
              name: 'AddChildProfileStep1',
              path: 'addChildProfileStep1',
              requireAuth: true,
              builder: (context, params) => AddChildProfileStep1Widget(
                cameFrom: params.getParam('cameFrom', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddChildProfileStep2',
              path: 'addChildProfileStep2',
              requireAuth: true,
              asyncParams: {
                'newlyCreatedChildProfile':
                    getDoc(['childProfiles'], ChildProfilesRecord.fromSnapshot),
              },
              builder: (context, params) => AddChildProfileStep2Widget(
                newlyCreatedChildProfile: params.getParam(
                    'newlyCreatedChildProfile', ParamType.Document),
                cameFrom: params.getParam('cameFrom', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'RegistrationStep6',
              path: 'registrationStep6',
              builder: (context, params) => const RegistrationStep6Widget(),
            ),
            FFRoute(
              name: 'EmailAuthentication',
              path: 'emailAuthentication',
              builder: (context, params) => const EmailAuthenticationWidget(),
            ),
            FFRoute(
              name: 'ChooseAuthenticationFlow',
              path: 'chooseAuthenticationFlow',
              builder: (context, params) => const ChooseAuthenticationFlowWidget(),
            ),
            FFRoute(
              name: 'ResetPasswort',
              path: 'resetPasswort',
              builder: (context, params) => ResetPasswortWidget(
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ClientSettings',
              path: 'settings',
              requireAuth: true,
              builder: (context, params) => const ClientSettingsWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'notifications',
              requireAuth: true,
              builder: (context, params) => const NotificationsWidget(),
            ),
            FFRoute(
              name: 'AddChildProfileStep3',
              path: 'addChildProfileStep3',
              requireAuth: true,
              builder: (context, params) => AddChildProfileStep3Widget(
                cameFrom: params.getParam('cameFrom', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SingleEvent',
              path: 'singleEvent',
              requireAuth: true,
              asyncParams: {
                'event': getDoc(['events'], EventsRecord.fromSnapshot),
              },
              builder: (context, params) => SingleEventWidget(
                event: params.getParam('event', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'Language',
              path: 'language',
              builder: (context, params) => const LanguageWidget(),
            ),
            FFRoute(
              name: 'Access',
              path: 'access',
              requireAuth: true,
              builder: (context, params) => AccessWidget(
                comingFrom: params.getParam('comingFrom', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ErrorPage',
              path: 'errorPage',
              builder: (context, params) => ErrorPageWidget(
                log: params.getParam('log', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddEvent',
              path: 'addEvent',
              requireAuth: true,
              builder: (context, params) => const AddEventWidget(),
            ),
            FFRoute(
              name: 'Overview',
              path: 'overview',
              requireAuth: true,
              builder: (context, params) => const OverviewWidget(),
            ),
            FFRoute(
              name: 'ManagerProfile',
              path: 'managerProfile',
              requireAuth: true,
              builder: (context, params) => const ManagerProfileWidget(),
            ),
            FFRoute(
              name: 'ManagerSettings',
              path: 'managerSettings',
              requireAuth: true,
              builder: (context, params) => const ManagerSettingsWidget(),
            ),
            FFRoute(
              name: 'ManagerInbox',
              path: 'managerInbox',
              requireAuth: true,
              builder: (context, params) => const ManagerInboxWidget(),
            ),
            FFRoute(
              name: 'OnboardingStep0',
              path: 'onboardingStep0',
              requireAuth: true,
              builder: (context, params) => const OnboardingStep0Widget(),
            ),
            FFRoute(
              name: 'Redirect',
              path: 'redirect',
              requireAuth: true,
              builder: (context, params) => const RedirectWidget(),
            ),
            FFRoute(
              name: 'ManagerOnboardingStep1-2',
              path: 'managerOnboardingStep12',
              requireAuth: true,
              builder: (context, params) => const ManagerOnboardingStep12Widget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
