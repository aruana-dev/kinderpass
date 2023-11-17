import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SystemLogsRecord extends FirestoreRecord {
  SystemLogsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "log" field.
  String? _log;
  String get log => _log ?? '';
  bool hasLog() => _log != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _log = snapshotData['log'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('systemLogs');

  static Stream<SystemLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SystemLogsRecord.fromSnapshot(s));

  static Future<SystemLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SystemLogsRecord.fromSnapshot(s));

  static SystemLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SystemLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SystemLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SystemLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SystemLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SystemLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSystemLogsRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  String? log,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'user': user,
      'log': log,
    }.withoutNulls,
  );

  return firestoreData;
}

class SystemLogsRecordDocumentEquality implements Equality<SystemLogsRecord> {
  const SystemLogsRecordDocumentEquality();

  @override
  bool equals(SystemLogsRecord? e1, SystemLogsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.log == e2?.log;
  }

  @override
  int hash(SystemLogsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.user, e?.log]);

  @override
  bool isValidKey(Object? o) => o is SystemLogsRecord;
}
