// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStruct extends FFFirebaseStruct {
  EventStruct({
    DocumentReference? eventRef,
    String? eventId,
    DocumentReference? owner,
    String? mainImage,
    String? title,
    String? shortDescription,
    List<MediaStruct>? media,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eventRef = eventRef,
        _eventId = eventId,
        _owner = owner,
        _mainImage = mainImage,
        _title = title,
        _shortDescription = shortDescription,
        _media = media,
        _description = description,
        super(firestoreUtilData);

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  set eventRef(DocumentReference? val) => _eventRef = val;
  bool hasEventRef() => _eventRef != null;

  // "eventId" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  set eventId(String? val) => _eventId = val;
  bool hasEventId() => _eventId != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;
  bool hasOwner() => _owner != null;

  // "mainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;
  bool hasMainImage() => _mainImage != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  set shortDescription(String? val) => _shortDescription = val;
  bool hasShortDescription() => _shortDescription != null;

  // "media" field.
  List<MediaStruct>? _media;
  List<MediaStruct> get media => _media ?? const [];
  set media(List<MediaStruct>? val) => _media = val;
  void updateMedia(Function(List<MediaStruct>) updateFn) =>
      updateFn(_media ??= []);
  bool hasMedia() => _media != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        eventRef: data['eventRef'] as DocumentReference?,
        eventId: data['eventId'] as String?,
        owner: data['owner'] as DocumentReference?,
        mainImage: data['mainImage'] as String?,
        title: data['title'] as String?,
        shortDescription: data['shortDescription'] as String?,
        media: getStructList(
          data['media'],
          MediaStruct.fromMap,
        ),
        description: data['description'] as String?,
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EventStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'eventRef': _eventRef,
        'eventId': _eventId,
        'owner': _owner,
        'mainImage': _mainImage,
        'title': _title,
        'shortDescription': _shortDescription,
        'media': _media?.map((e) => e.toMap()).toList(),
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'eventRef': serializeParam(
          _eventRef,
          ParamType.DocumentReference,
        ),
        'eventId': serializeParam(
          _eventId,
          ParamType.String,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
        'mainImage': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'shortDescription': serializeParam(
          _shortDescription,
          ParamType.String,
        ),
        'media': serializeParam(
          _media,
          ParamType.DataStruct,
          true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStruct(
        eventRef: deserializeParam(
          data['eventRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['events'],
        ),
        eventId: deserializeParam(
          data['eventId'],
          ParamType.String,
          false,
        ),
        owner: deserializeParam(
          data['owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        mainImage: deserializeParam(
          data['mainImage'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        shortDescription: deserializeParam(
          data['shortDescription'],
          ParamType.String,
          false,
        ),
        media: deserializeStructParam<MediaStruct>(
          data['media'],
          ParamType.DataStruct,
          true,
          structBuilder: MediaStruct.fromSerializableMap,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EventStruct &&
        eventRef == other.eventRef &&
        eventId == other.eventId &&
        owner == other.owner &&
        mainImage == other.mainImage &&
        title == other.title &&
        shortDescription == other.shortDescription &&
        listEquality.equals(media, other.media) &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        eventRef,
        eventId,
        owner,
        mainImage,
        title,
        shortDescription,
        media,
        description
      ]);
}

EventStruct createEventStruct({
  DocumentReference? eventRef,
  String? eventId,
  DocumentReference? owner,
  String? mainImage,
  String? title,
  String? shortDescription,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventStruct(
      eventRef: eventRef,
      eventId: eventId,
      owner: owner,
      mainImage: mainImage,
      title: title,
      shortDescription: shortDescription,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventStruct? updateEventStruct(
  EventStruct? event, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    event
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventStructData(
  Map<String, dynamic> firestoreData,
  EventStruct? event,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (event == null) {
    return;
  }
  if (event.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && event.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventData = getEventFirestoreData(event, forFieldValue);
  final nestedData = eventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = event.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventFirestoreData(
  EventStruct? event, [
  bool forFieldValue = false,
]) {
  if (event == null) {
    return {};
  }
  final firestoreData = mapToFirestore(event.toMap());

  // Add any Firestore field values
  event.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventListFirestoreData(
  List<EventStruct>? events,
) =>
    events?.map((e) => getEventFirestoreData(e, true)).toList() ?? [];
