import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChildProfilesRecord extends FirestoreRecord {
  ChildProfilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "childProfile" field.
  ChildProfileStruct? _childProfile;
  ChildProfileStruct get childProfile => _childProfile ?? ChildProfileStruct();
  bool hasChildProfile() => _childProfile != null;

  void _initializeFields() {
    _childProfile =
        ChildProfileStruct.maybeFromMap(snapshotData['childProfile']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('childProfiles');

  static Stream<ChildProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildProfilesRecord.fromSnapshot(s));

  static Future<ChildProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChildProfilesRecord.fromSnapshot(s));

  static ChildProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChildProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildProfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildProfilesRecordData({
  ChildProfileStruct? childProfile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'childProfile': ChildProfileStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "childProfile" field.
  addChildProfileStructData(firestoreData, childProfile, 'childProfile');

  return firestoreData;
}

class ChildProfilesRecordDocumentEquality
    implements Equality<ChildProfilesRecord> {
  const ChildProfilesRecordDocumentEquality();

  @override
  bool equals(ChildProfilesRecord? e1, ChildProfilesRecord? e2) {
    return e1?.childProfile == e2?.childProfile;
  }

  @override
  int hash(ChildProfilesRecord? e) =>
      const ListEquality().hash([e?.childProfile]);

  @override
  bool isValidKey(Object? o) => o is ChildProfilesRecord;
}
