import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "booking" field.
  BookingStruct? _booking;
  BookingStruct get booking => _booking ?? BookingStruct();
  bool hasBooking() => _booking != null;

  void _initializeFields() {
    _booking = BookingStruct.maybeFromMap(snapshotData['booking']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  BookingStruct? booking,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking': BookingStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "booking" field.
  addBookingStructData(firestoreData, booking, 'booking');

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.booking == e2?.booking;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([e?.booking]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
