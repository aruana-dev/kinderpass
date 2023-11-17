import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AddressesRecord extends FirestoreRecord {
  AddressesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _address = AddressStruct.maybeFromMap(snapshotData['address']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('addresses');

  static Stream<AddressesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddressesRecord.fromSnapshot(s));

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddressesRecord.fromSnapshot(s));

  static AddressesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddressesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddressesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddressesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddressesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddressesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddressesRecordData({
  AddressStruct? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': AddressStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}

class AddressesRecordDocumentEquality implements Equality<AddressesRecord> {
  const AddressesRecordDocumentEquality();

  @override
  bool equals(AddressesRecord? e1, AddressesRecord? e2) {
    return e1?.address == e2?.address;
  }

  @override
  int hash(AddressesRecord? e) => const ListEquality().hash([e?.address]);

  @override
  bool isValidKey(Object? o) => o is AddressesRecord;
}
