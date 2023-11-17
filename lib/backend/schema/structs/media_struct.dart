// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MediaStruct extends FFFirebaseStruct {
  MediaStruct({
    String? image,
    String? video,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _video = video,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;
  bool hasVideo() => _video != null;

  static MediaStruct fromMap(Map<String, dynamic> data) => MediaStruct(
        image: data['image'] as String?,
        video: data['video'] as String?,
      );

  static MediaStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MediaStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'video': _video,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
      }.withoutNulls;

  static MediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaStruct && image == other.image && video == other.video;
  }

  @override
  int get hashCode => const ListEquality().hash([image, video]);
}

MediaStruct createMediaStruct({
  String? image,
  String? video,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MediaStruct(
      image: image,
      video: video,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MediaStruct? updateMediaStruct(
  MediaStruct? media, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    media
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMediaStructData(
  Map<String, dynamic> firestoreData,
  MediaStruct? media,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (media == null) {
    return;
  }
  if (media.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && media.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mediaData = getMediaFirestoreData(media, forFieldValue);
  final nestedData = mediaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = media.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMediaFirestoreData(
  MediaStruct? media, [
  bool forFieldValue = false,
]) {
  if (media == null) {
    return {};
  }
  final firestoreData = mapToFirestore(media.toMap());

  // Add any Firestore field values
  media.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMediaListFirestoreData(
  List<MediaStruct>? medias,
) =>
    medias?.map((e) => getMediaFirestoreData(e, true)).toList() ?? [];
