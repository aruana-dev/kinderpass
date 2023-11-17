// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingStruct extends FFFirebaseStruct {
  BookingStruct({
    DocumentReference? owner,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _owner = owner,
        super(firestoreUtilData);

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;
  bool hasOwner() => _owner != null;

  static BookingStruct fromMap(Map<String, dynamic> data) => BookingStruct(
        owner: data['owner'] as DocumentReference?,
      );

  static BookingStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BookingStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'owner': _owner,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static BookingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingStruct(
        owner: deserializeParam(
          data['owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'BookingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookingStruct && owner == other.owner;
  }

  @override
  int get hashCode => const ListEquality().hash([owner]);
}

BookingStruct createBookingStruct({
  DocumentReference? owner,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookingStruct(
      owner: owner,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookingStruct? updateBookingStruct(
  BookingStruct? booking, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    booking
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookingStructData(
  Map<String, dynamic> firestoreData,
  BookingStruct? booking,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (booking == null) {
    return;
  }
  if (booking.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && booking.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookingData = getBookingFirestoreData(booking, forFieldValue);
  final nestedData = bookingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = booking.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookingFirestoreData(
  BookingStruct? booking, [
  bool forFieldValue = false,
]) {
  if (booking == null) {
    return {};
  }
  final firestoreData = mapToFirestore(booking.toMap());

  // Add any Firestore field values
  booking.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookingListFirestoreData(
  List<BookingStruct>? bookings,
) =>
    bookings?.map((e) => getBookingFirestoreData(e, true)).toList() ?? [];
