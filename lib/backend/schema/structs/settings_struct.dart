// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsStruct extends FFFirebaseStruct {
  SettingsStruct({
    bool? pushNotificationsEnabled,
    bool? emailNotificationsEnabled,
    String? colorMode,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pushNotificationsEnabled = pushNotificationsEnabled,
        _emailNotificationsEnabled = emailNotificationsEnabled,
        _colorMode = colorMode,
        _language = language,
        super(firestoreUtilData);

  // "pushNotificationsEnabled" field.
  bool? _pushNotificationsEnabled;
  bool get pushNotificationsEnabled => _pushNotificationsEnabled ?? false;
  set pushNotificationsEnabled(bool? val) => _pushNotificationsEnabled = val;
  bool hasPushNotificationsEnabled() => _pushNotificationsEnabled != null;

  // "emailNotificationsEnabled" field.
  bool? _emailNotificationsEnabled;
  bool get emailNotificationsEnabled => _emailNotificationsEnabled ?? false;
  set emailNotificationsEnabled(bool? val) => _emailNotificationsEnabled = val;
  bool hasEmailNotificationsEnabled() => _emailNotificationsEnabled != null;

  // "colorMode" field.
  String? _colorMode;
  String get colorMode => _colorMode ?? '';
  set colorMode(String? val) => _colorMode = val;
  bool hasColorMode() => _colorMode != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;
  bool hasLanguage() => _language != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        pushNotificationsEnabled: data['pushNotificationsEnabled'] as bool?,
        emailNotificationsEnabled: data['emailNotificationsEnabled'] as bool?,
        colorMode: data['colorMode'] as String?,
        language: data['language'] as String?,
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SettingsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'pushNotificationsEnabled': _pushNotificationsEnabled,
        'emailNotificationsEnabled': _emailNotificationsEnabled,
        'colorMode': _colorMode,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pushNotificationsEnabled': serializeParam(
          _pushNotificationsEnabled,
          ParamType.bool,
        ),
        'emailNotificationsEnabled': serializeParam(
          _emailNotificationsEnabled,
          ParamType.bool,
        ),
        'colorMode': serializeParam(
          _colorMode,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        pushNotificationsEnabled: deserializeParam(
          data['pushNotificationsEnabled'],
          ParamType.bool,
          false,
        ),
        emailNotificationsEnabled: deserializeParam(
          data['emailNotificationsEnabled'],
          ParamType.bool,
          false,
        ),
        colorMode: deserializeParam(
          data['colorMode'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsStruct &&
        pushNotificationsEnabled == other.pushNotificationsEnabled &&
        emailNotificationsEnabled == other.emailNotificationsEnabled &&
        colorMode == other.colorMode &&
        language == other.language;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pushNotificationsEnabled,
        emailNotificationsEnabled,
        colorMode,
        language
      ]);
}

SettingsStruct createSettingsStruct({
  bool? pushNotificationsEnabled,
  bool? emailNotificationsEnabled,
  String? colorMode,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsStruct(
      pushNotificationsEnabled: pushNotificationsEnabled,
      emailNotificationsEnabled: emailNotificationsEnabled,
      colorMode: colorMode,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsStruct? updateSettingsStruct(
  SettingsStruct? settings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsStructData(
  Map<String, dynamic> firestoreData,
  SettingsStruct? settings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settings == null) {
    return;
  }
  if (settings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsData = getSettingsFirestoreData(settings, forFieldValue);
  final nestedData = settingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsFirestoreData(
  SettingsStruct? settings, [
  bool forFieldValue = false,
]) {
  if (settings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settings.toMap());

  // Add any Firestore field values
  settings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsListFirestoreData(
  List<SettingsStruct>? settingss,
) =>
    settingss?.map((e) => getSettingsFirestoreData(e, true)).toList() ?? [];
