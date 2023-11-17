// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleStruct extends FFFirebaseStruct {
  RoleStruct({
    bool? isClient,
    bool? isManager,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isClient = isClient,
        _isManager = isManager,
        super(firestoreUtilData);

  // "isClient" field.
  bool? _isClient;
  bool get isClient => _isClient ?? false;
  set isClient(bool? val) => _isClient = val;
  bool hasIsClient() => _isClient != null;

  // "isManager" field.
  bool? _isManager;
  bool get isManager => _isManager ?? false;
  set isManager(bool? val) => _isManager = val;
  bool hasIsManager() => _isManager != null;

  static RoleStruct fromMap(Map<String, dynamic> data) => RoleStruct(
        isClient: data['isClient'] as bool?,
        isManager: data['isManager'] as bool?,
      );

  static RoleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RoleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'isClient': _isClient,
        'isManager': _isManager,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isClient': serializeParam(
          _isClient,
          ParamType.bool,
        ),
        'isManager': serializeParam(
          _isManager,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoleStruct(
        isClient: deserializeParam(
          data['isClient'],
          ParamType.bool,
          false,
        ),
        isManager: deserializeParam(
          data['isManager'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoleStruct &&
        isClient == other.isClient &&
        isManager == other.isManager;
  }

  @override
  int get hashCode => const ListEquality().hash([isClient, isManager]);
}

RoleStruct createRoleStruct({
  bool? isClient,
  bool? isManager,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoleStruct(
      isClient: isClient,
      isManager: isManager,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoleStruct? updateRoleStruct(
  RoleStruct? role, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    role
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoleStructData(
  Map<String, dynamic> firestoreData,
  RoleStruct? role,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (role == null) {
    return;
  }
  if (role.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && role.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roleData = getRoleFirestoreData(role, forFieldValue);
  final nestedData = roleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = role.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoleFirestoreData(
  RoleStruct? role, [
  bool forFieldValue = false,
]) {
  if (role == null) {
    return {};
  }
  final firestoreData = mapToFirestore(role.toMap());

  // Add any Firestore field values
  role.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoleListFirestoreData(
  List<RoleStruct>? roles,
) =>
    roles?.map((e) => getRoleFirestoreData(e, true)).toList() ?? [];
