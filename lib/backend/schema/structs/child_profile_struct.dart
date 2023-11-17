// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildProfileStruct extends FFFirebaseStruct {
  ChildProfileStruct({
    DocumentReference? childProfileRef,
    DocumentReference? owner,
    List<RelationStruct>? relations,
    String? givenName,
    String? familyName,
    String? birthdate,
    String? gender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _childProfileRef = childProfileRef,
        _owner = owner,
        _relations = relations,
        _givenName = givenName,
        _familyName = familyName,
        _birthdate = birthdate,
        _gender = gender,
        super(firestoreUtilData);

  // "childProfileRef" field.
  DocumentReference? _childProfileRef;
  DocumentReference? get childProfileRef => _childProfileRef;
  set childProfileRef(DocumentReference? val) => _childProfileRef = val;
  bool hasChildProfileRef() => _childProfileRef != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;
  bool hasOwner() => _owner != null;

  // "relations" field.
  List<RelationStruct>? _relations;
  List<RelationStruct> get relations => _relations ?? const [];
  set relations(List<RelationStruct>? val) => _relations = val;
  void updateRelations(Function(List<RelationStruct>) updateFn) =>
      updateFn(_relations ??= []);
  bool hasRelations() => _relations != null;

  // "givenName" field.
  String? _givenName;
  String get givenName => _givenName ?? '';
  set givenName(String? val) => _givenName = val;
  bool hasGivenName() => _givenName != null;

  // "familyName" field.
  String? _familyName;
  String get familyName => _familyName ?? '';
  set familyName(String? val) => _familyName = val;
  bool hasFamilyName() => _familyName != null;

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  set birthdate(String? val) => _birthdate = val;
  bool hasBirthdate() => _birthdate != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  static ChildProfileStruct fromMap(Map<String, dynamic> data) =>
      ChildProfileStruct(
        childProfileRef: data['childProfileRef'] as DocumentReference?,
        owner: data['owner'] as DocumentReference?,
        relations: getStructList(
          data['relations'],
          RelationStruct.fromMap,
        ),
        givenName: data['givenName'] as String?,
        familyName: data['familyName'] as String?,
        birthdate: data['birthdate'] as String?,
        gender: data['gender'] as String?,
      );

  static ChildProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChildProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'childProfileRef': _childProfileRef,
        'owner': _owner,
        'relations': _relations?.map((e) => e.toMap()).toList(),
        'givenName': _givenName,
        'familyName': _familyName,
        'birthdate': _birthdate,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'childProfileRef': serializeParam(
          _childProfileRef,
          ParamType.DocumentReference,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
        'relations': serializeParam(
          _relations,
          ParamType.DataStruct,
          true,
        ),
        'givenName': serializeParam(
          _givenName,
          ParamType.String,
        ),
        'familyName': serializeParam(
          _familyName,
          ParamType.String,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChildProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChildProfileStruct(
        childProfileRef: deserializeParam(
          data['childProfileRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['childProfiles'],
        ),
        owner: deserializeParam(
          data['owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        relations: deserializeStructParam<RelationStruct>(
          data['relations'],
          ParamType.DataStruct,
          true,
          structBuilder: RelationStruct.fromSerializableMap,
        ),
        givenName: deserializeParam(
          data['givenName'],
          ParamType.String,
          false,
        ),
        familyName: deserializeParam(
          data['familyName'],
          ParamType.String,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChildProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChildProfileStruct &&
        childProfileRef == other.childProfileRef &&
        owner == other.owner &&
        listEquality.equals(relations, other.relations) &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        birthdate == other.birthdate &&
        gender == other.gender;
  }

  @override
  int get hashCode => const ListEquality().hash([
        childProfileRef,
        owner,
        relations,
        givenName,
        familyName,
        birthdate,
        gender
      ]);
}

ChildProfileStruct createChildProfileStruct({
  DocumentReference? childProfileRef,
  DocumentReference? owner,
  String? givenName,
  String? familyName,
  String? birthdate,
  String? gender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChildProfileStruct(
      childProfileRef: childProfileRef,
      owner: owner,
      givenName: givenName,
      familyName: familyName,
      birthdate: birthdate,
      gender: gender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChildProfileStruct? updateChildProfileStruct(
  ChildProfileStruct? childProfile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    childProfile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChildProfileStructData(
  Map<String, dynamic> firestoreData,
  ChildProfileStruct? childProfile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (childProfile == null) {
    return;
  }
  if (childProfile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && childProfile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final childProfileData =
      getChildProfileFirestoreData(childProfile, forFieldValue);
  final nestedData =
      childProfileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = childProfile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChildProfileFirestoreData(
  ChildProfileStruct? childProfile, [
  bool forFieldValue = false,
]) {
  if (childProfile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(childProfile.toMap());

  // Add any Firestore field values
  childProfile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChildProfileListFirestoreData(
  List<ChildProfileStruct>? childProfiles,
) =>
    childProfiles?.map((e) => getChildProfileFirestoreData(e, true)).toList() ??
    [];
