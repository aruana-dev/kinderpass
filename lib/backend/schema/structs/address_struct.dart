// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    DocumentReference? owner,
    List<DocumentReference>? residents,
    String? streetName,
    String? streetNumber,
    String? postalCode,
    String? locality,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _owner = owner,
        _residents = residents,
        _streetName = streetName,
        _streetNumber = streetNumber,
        _postalCode = postalCode,
        _locality = locality,
        super(firestoreUtilData);

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;
  bool hasOwner() => _owner != null;

  // "residents" field.
  List<DocumentReference>? _residents;
  List<DocumentReference> get residents => _residents ?? const [];
  set residents(List<DocumentReference>? val) => _residents = val;
  void updateResidents(Function(List<DocumentReference>) updateFn) =>
      updateFn(_residents ??= []);
  bool hasResidents() => _residents != null;

  // "streetName" field.
  String? _streetName;
  String get streetName => _streetName ?? '';
  set streetName(String? val) => _streetName = val;
  bool hasStreetName() => _streetName != null;

  // "streetNumber" field.
  String? _streetNumber;
  String get streetNumber => _streetNumber ?? '';
  set streetNumber(String? val) => _streetNumber = val;
  bool hasStreetNumber() => _streetNumber != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;
  bool hasPostalCode() => _postalCode != null;

  // "locality" field.
  String? _locality;
  String get locality => _locality ?? '';
  set locality(String? val) => _locality = val;
  bool hasLocality() => _locality != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        owner: data['owner'] as DocumentReference?,
        residents: getDataList(data['residents']),
        streetName: data['streetName'] as String?,
        streetNumber: data['streetNumber'] as String?,
        postalCode: data['postalCode'] as String?,
        locality: data['locality'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'owner': _owner,
        'residents': _residents,
        'streetName': _streetName,
        'streetNumber': _streetNumber,
        'postalCode': _postalCode,
        'locality': _locality,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
        'residents': serializeParam(
          _residents,
          ParamType.DocumentReference,
          true,
        ),
        'streetName': serializeParam(
          _streetName,
          ParamType.String,
        ),
        'streetNumber': serializeParam(
          _streetNumber,
          ParamType.String,
        ),
        'postalCode': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'locality': serializeParam(
          _locality,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        owner: deserializeParam(
          data['owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        residents: deserializeParam<DocumentReference>(
          data['residents'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        streetName: deserializeParam(
          data['streetName'],
          ParamType.String,
          false,
        ),
        streetNumber: deserializeParam(
          data['streetNumber'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postalCode'],
          ParamType.String,
          false,
        ),
        locality: deserializeParam(
          data['locality'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AddressStruct &&
        owner == other.owner &&
        listEquality.equals(residents, other.residents) &&
        streetName == other.streetName &&
        streetNumber == other.streetNumber &&
        postalCode == other.postalCode &&
        locality == other.locality;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([owner, residents, streetName, streetNumber, postalCode, locality]);
}

AddressStruct createAddressStruct({
  DocumentReference? owner,
  String? streetName,
  String? streetNumber,
  String? postalCode,
  String? locality,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      owner: owner,
      streetName: streetName,
      streetNumber: streetNumber,
      postalCode: postalCode,
      locality: locality,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
