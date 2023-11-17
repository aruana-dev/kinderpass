// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelationStruct extends FFFirebaseStruct {
  RelationStruct({
    DocumentReference? user,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _type = type,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static RelationStruct fromMap(Map<String, dynamic> data) => RelationStruct(
        user: data['user'] as DocumentReference?,
        type: data['type'] as String?,
      );

  static RelationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RelationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static RelationStruct fromSerializableMap(Map<String, dynamic> data) =>
      RelationStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RelationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RelationStruct && user == other.user && type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([user, type]);
}

RelationStruct createRelationStruct({
  DocumentReference? user,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RelationStruct(
      user: user,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RelationStruct? updateRelationStruct(
  RelationStruct? relation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    relation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRelationStructData(
  Map<String, dynamic> firestoreData,
  RelationStruct? relation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (relation == null) {
    return;
  }
  if (relation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && relation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final relationData = getRelationFirestoreData(relation, forFieldValue);
  final nestedData = relationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = relation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRelationFirestoreData(
  RelationStruct? relation, [
  bool forFieldValue = false,
]) {
  if (relation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(relation.toMap());

  // Add any Firestore field values
  relation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRelationListFirestoreData(
  List<RelationStruct>? relations,
) =>
    relations?.map((e) => getRelationFirestoreData(e, true)).toList() ?? [];
