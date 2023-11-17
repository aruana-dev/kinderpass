import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FeedbacksRecord extends FirestoreRecord {
  FeedbacksRecord._(
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

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "page" field.
  String? _page;
  String get page => _page ?? '';
  bool hasPage() => _page != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _feedback = snapshotData['feedback'] as String?;
    _page = snapshotData['page'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedbacks');

  static Stream<FeedbacksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbacksRecord.fromSnapshot(s));

  static Future<FeedbacksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbacksRecord.fromSnapshot(s));

  static FeedbacksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbacksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbacksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbacksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbacksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbacksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbacksRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  String? feedback,
  String? page,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'user': user,
      'feedback': feedback,
      'page': page,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbacksRecordDocumentEquality implements Equality<FeedbacksRecord> {
  const FeedbacksRecordDocumentEquality();

  @override
  bool equals(FeedbacksRecord? e1, FeedbacksRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.feedback == e2?.feedback &&
        e1?.page == e2?.page;
  }

  @override
  int hash(FeedbacksRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.user, e?.feedback, e?.page]);

  @override
  bool isValidKey(Object? o) => o is FeedbacksRecord;
}
