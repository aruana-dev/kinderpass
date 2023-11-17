// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends FFFirebaseStruct {
  ProfileStruct({
    DocumentReference? owner,
    bool? confirmedPrerequisites,
    bool? hasPassedRequiredRegistrationSteps,
    bool? hasPassedRequiredOnboardingSteps,
    bool? booksForOwn,
    bool? booksForRelatives,
    bool? booksOfficially,
    bool? isPrivateManager,
    bool? isPublicManager,
    String? givenName,
    String? familyName,
    String? birthdate,
    AddressStruct? address,
    String? temporaryProfileImage,
    bool? hasPassedPersonalProfileSteps,
    bool? hasPassedFamilyProfileSteps,
    List<DocumentReference>? selectedChildProfilesRefs,
    List<DocumentReference>? validEventsRefs,
    List<DocumentReference>? rejectedEventsRefs,
    List<DocumentReference>? favoriteEventsRefs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _owner = owner,
        _confirmedPrerequisites = confirmedPrerequisites,
        _hasPassedRequiredRegistrationSteps =
            hasPassedRequiredRegistrationSteps,
        _hasPassedRequiredOnboardingSteps = hasPassedRequiredOnboardingSteps,
        _booksForOwn = booksForOwn,
        _booksForRelatives = booksForRelatives,
        _booksOfficially = booksOfficially,
        _isPrivateManager = isPrivateManager,
        _isPublicManager = isPublicManager,
        _givenName = givenName,
        _familyName = familyName,
        _birthdate = birthdate,
        _address = address,
        _temporaryProfileImage = temporaryProfileImage,
        _hasPassedPersonalProfileSteps = hasPassedPersonalProfileSteps,
        _hasPassedFamilyProfileSteps = hasPassedFamilyProfileSteps,
        _selectedChildProfilesRefs = selectedChildProfilesRefs,
        _validEventsRefs = validEventsRefs,
        _rejectedEventsRefs = rejectedEventsRefs,
        _favoriteEventsRefs = favoriteEventsRefs,
        super(firestoreUtilData);

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;
  bool hasOwner() => _owner != null;

  // "confirmedPrerequisites" field.
  bool? _confirmedPrerequisites;
  bool get confirmedPrerequisites => _confirmedPrerequisites ?? false;
  set confirmedPrerequisites(bool? val) => _confirmedPrerequisites = val;
  bool hasConfirmedPrerequisites() => _confirmedPrerequisites != null;

  // "hasPassedRequiredRegistrationSteps" field.
  bool? _hasPassedRequiredRegistrationSteps;
  bool get hasPassedRequiredRegistrationSteps =>
      _hasPassedRequiredRegistrationSteps ?? false;
  set hasPassedRequiredRegistrationSteps(bool? val) =>
      _hasPassedRequiredRegistrationSteps = val;
  bool hasHasPassedRequiredRegistrationSteps() =>
      _hasPassedRequiredRegistrationSteps != null;

  // "hasPassedRequiredOnboardingSteps" field.
  bool? _hasPassedRequiredOnboardingSteps;
  bool get hasPassedRequiredOnboardingSteps =>
      _hasPassedRequiredOnboardingSteps ?? false;
  set hasPassedRequiredOnboardingSteps(bool? val) =>
      _hasPassedRequiredOnboardingSteps = val;
  bool hasHasPassedRequiredOnboardingSteps() =>
      _hasPassedRequiredOnboardingSteps != null;

  // "booksForOwn" field.
  bool? _booksForOwn;
  bool get booksForOwn => _booksForOwn ?? false;
  set booksForOwn(bool? val) => _booksForOwn = val;
  bool hasBooksForOwn() => _booksForOwn != null;

  // "booksForRelatives" field.
  bool? _booksForRelatives;
  bool get booksForRelatives => _booksForRelatives ?? false;
  set booksForRelatives(bool? val) => _booksForRelatives = val;
  bool hasBooksForRelatives() => _booksForRelatives != null;

  // "booksOfficially" field.
  bool? _booksOfficially;
  bool get booksOfficially => _booksOfficially ?? false;
  set booksOfficially(bool? val) => _booksOfficially = val;
  bool hasBooksOfficially() => _booksOfficially != null;

  // "isPrivateManager" field.
  bool? _isPrivateManager;
  bool get isPrivateManager => _isPrivateManager ?? false;
  set isPrivateManager(bool? val) => _isPrivateManager = val;
  bool hasIsPrivateManager() => _isPrivateManager != null;

  // "isPublicManager" field.
  bool? _isPublicManager;
  bool get isPublicManager => _isPublicManager ?? false;
  set isPublicManager(bool? val) => _isPublicManager = val;
  bool hasIsPublicManager() => _isPublicManager != null;

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

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  set address(AddressStruct? val) => _address = val;
  void updateAddress(Function(AddressStruct) updateFn) =>
      updateFn(_address ??= AddressStruct());
  bool hasAddress() => _address != null;

  // "temporaryProfileImage" field.
  String? _temporaryProfileImage;
  String get temporaryProfileImage => _temporaryProfileImage ?? '';
  set temporaryProfileImage(String? val) => _temporaryProfileImage = val;
  bool hasTemporaryProfileImage() => _temporaryProfileImage != null;

  // "hasPassedPersonalProfileSteps" field.
  bool? _hasPassedPersonalProfileSteps;
  bool get hasPassedPersonalProfileSteps =>
      _hasPassedPersonalProfileSteps ?? false;
  set hasPassedPersonalProfileSteps(bool? val) =>
      _hasPassedPersonalProfileSteps = val;
  bool hasHasPassedPersonalProfileSteps() =>
      _hasPassedPersonalProfileSteps != null;

  // "hasPassedFamilyProfileSteps" field.
  bool? _hasPassedFamilyProfileSteps;
  bool get hasPassedFamilyProfileSteps => _hasPassedFamilyProfileSteps ?? false;
  set hasPassedFamilyProfileSteps(bool? val) =>
      _hasPassedFamilyProfileSteps = val;
  bool hasHasPassedFamilyProfileSteps() => _hasPassedFamilyProfileSteps != null;

  // "selectedChildProfilesRefs" field.
  List<DocumentReference>? _selectedChildProfilesRefs;
  List<DocumentReference> get selectedChildProfilesRefs =>
      _selectedChildProfilesRefs ?? const [];
  set selectedChildProfilesRefs(List<DocumentReference>? val) =>
      _selectedChildProfilesRefs = val;
  void updateSelectedChildProfilesRefs(
          Function(List<DocumentReference>) updateFn) =>
      updateFn(_selectedChildProfilesRefs ??= []);
  bool hasSelectedChildProfilesRefs() => _selectedChildProfilesRefs != null;

  // "validEventsRefs" field.
  List<DocumentReference>? _validEventsRefs;
  List<DocumentReference> get validEventsRefs => _validEventsRefs ?? const [];
  set validEventsRefs(List<DocumentReference>? val) => _validEventsRefs = val;
  void updateValidEventsRefs(Function(List<DocumentReference>) updateFn) =>
      updateFn(_validEventsRefs ??= []);
  bool hasValidEventsRefs() => _validEventsRefs != null;

  // "rejectedEventsRefs" field.
  List<DocumentReference>? _rejectedEventsRefs;
  List<DocumentReference> get rejectedEventsRefs =>
      _rejectedEventsRefs ?? const [];
  set rejectedEventsRefs(List<DocumentReference>? val) =>
      _rejectedEventsRefs = val;
  void updateRejectedEventsRefs(Function(List<DocumentReference>) updateFn) =>
      updateFn(_rejectedEventsRefs ??= []);
  bool hasRejectedEventsRefs() => _rejectedEventsRefs != null;

  // "favoriteEventsRefs" field.
  List<DocumentReference>? _favoriteEventsRefs;
  List<DocumentReference> get favoriteEventsRefs =>
      _favoriteEventsRefs ?? const [];
  set favoriteEventsRefs(List<DocumentReference>? val) =>
      _favoriteEventsRefs = val;
  void updateFavoriteEventsRefs(Function(List<DocumentReference>) updateFn) =>
      updateFn(_favoriteEventsRefs ??= []);
  bool hasFavoriteEventsRefs() => _favoriteEventsRefs != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        owner: data['owner'] as DocumentReference?,
        confirmedPrerequisites: data['confirmedPrerequisites'] as bool?,
        hasPassedRequiredRegistrationSteps:
            data['hasPassedRequiredRegistrationSteps'] as bool?,
        hasPassedRequiredOnboardingSteps:
            data['hasPassedRequiredOnboardingSteps'] as bool?,
        booksForOwn: data['booksForOwn'] as bool?,
        booksForRelatives: data['booksForRelatives'] as bool?,
        booksOfficially: data['booksOfficially'] as bool?,
        isPrivateManager: data['isPrivateManager'] as bool?,
        isPublicManager: data['isPublicManager'] as bool?,
        givenName: data['givenName'] as String?,
        familyName: data['familyName'] as String?,
        birthdate: data['birthdate'] as String?,
        address: AddressStruct.maybeFromMap(data['address']),
        temporaryProfileImage: data['temporaryProfileImage'] as String?,
        hasPassedPersonalProfileSteps:
            data['hasPassedPersonalProfileSteps'] as bool?,
        hasPassedFamilyProfileSteps:
            data['hasPassedFamilyProfileSteps'] as bool?,
        selectedChildProfilesRefs:
            getDataList(data['selectedChildProfilesRefs']),
        validEventsRefs: getDataList(data['validEventsRefs']),
        rejectedEventsRefs: getDataList(data['rejectedEventsRefs']),
        favoriteEventsRefs: getDataList(data['favoriteEventsRefs']),
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'owner': _owner,
        'confirmedPrerequisites': _confirmedPrerequisites,
        'hasPassedRequiredRegistrationSteps':
            _hasPassedRequiredRegistrationSteps,
        'hasPassedRequiredOnboardingSteps': _hasPassedRequiredOnboardingSteps,
        'booksForOwn': _booksForOwn,
        'booksForRelatives': _booksForRelatives,
        'booksOfficially': _booksOfficially,
        'isPrivateManager': _isPrivateManager,
        'isPublicManager': _isPublicManager,
        'givenName': _givenName,
        'familyName': _familyName,
        'birthdate': _birthdate,
        'address': _address?.toMap(),
        'temporaryProfileImage': _temporaryProfileImage,
        'hasPassedPersonalProfileSteps': _hasPassedPersonalProfileSteps,
        'hasPassedFamilyProfileSteps': _hasPassedFamilyProfileSteps,
        'selectedChildProfilesRefs': _selectedChildProfilesRefs,
        'validEventsRefs': _validEventsRefs,
        'rejectedEventsRefs': _rejectedEventsRefs,
        'favoriteEventsRefs': _favoriteEventsRefs,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
        'confirmedPrerequisites': serializeParam(
          _confirmedPrerequisites,
          ParamType.bool,
        ),
        'hasPassedRequiredRegistrationSteps': serializeParam(
          _hasPassedRequiredRegistrationSteps,
          ParamType.bool,
        ),
        'hasPassedRequiredOnboardingSteps': serializeParam(
          _hasPassedRequiredOnboardingSteps,
          ParamType.bool,
        ),
        'booksForOwn': serializeParam(
          _booksForOwn,
          ParamType.bool,
        ),
        'booksForRelatives': serializeParam(
          _booksForRelatives,
          ParamType.bool,
        ),
        'booksOfficially': serializeParam(
          _booksOfficially,
          ParamType.bool,
        ),
        'isPrivateManager': serializeParam(
          _isPrivateManager,
          ParamType.bool,
        ),
        'isPublicManager': serializeParam(
          _isPublicManager,
          ParamType.bool,
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
        'address': serializeParam(
          _address,
          ParamType.DataStruct,
        ),
        'temporaryProfileImage': serializeParam(
          _temporaryProfileImage,
          ParamType.String,
        ),
        'hasPassedPersonalProfileSteps': serializeParam(
          _hasPassedPersonalProfileSteps,
          ParamType.bool,
        ),
        'hasPassedFamilyProfileSteps': serializeParam(
          _hasPassedFamilyProfileSteps,
          ParamType.bool,
        ),
        'selectedChildProfilesRefs': serializeParam(
          _selectedChildProfilesRefs,
          ParamType.DocumentReference,
          true,
        ),
        'validEventsRefs': serializeParam(
          _validEventsRefs,
          ParamType.DocumentReference,
          true,
        ),
        'rejectedEventsRefs': serializeParam(
          _rejectedEventsRefs,
          ParamType.DocumentReference,
          true,
        ),
        'favoriteEventsRefs': serializeParam(
          _favoriteEventsRefs,
          ParamType.DocumentReference,
          true,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        owner: deserializeParam(
          data['owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        confirmedPrerequisites: deserializeParam(
          data['confirmedPrerequisites'],
          ParamType.bool,
          false,
        ),
        hasPassedRequiredRegistrationSteps: deserializeParam(
          data['hasPassedRequiredRegistrationSteps'],
          ParamType.bool,
          false,
        ),
        hasPassedRequiredOnboardingSteps: deserializeParam(
          data['hasPassedRequiredOnboardingSteps'],
          ParamType.bool,
          false,
        ),
        booksForOwn: deserializeParam(
          data['booksForOwn'],
          ParamType.bool,
          false,
        ),
        booksForRelatives: deserializeParam(
          data['booksForRelatives'],
          ParamType.bool,
          false,
        ),
        booksOfficially: deserializeParam(
          data['booksOfficially'],
          ParamType.bool,
          false,
        ),
        isPrivateManager: deserializeParam(
          data['isPrivateManager'],
          ParamType.bool,
          false,
        ),
        isPublicManager: deserializeParam(
          data['isPublicManager'],
          ParamType.bool,
          false,
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
        address: deserializeStructParam(
          data['address'],
          ParamType.DataStruct,
          false,
          structBuilder: AddressStruct.fromSerializableMap,
        ),
        temporaryProfileImage: deserializeParam(
          data['temporaryProfileImage'],
          ParamType.String,
          false,
        ),
        hasPassedPersonalProfileSteps: deserializeParam(
          data['hasPassedPersonalProfileSteps'],
          ParamType.bool,
          false,
        ),
        hasPassedFamilyProfileSteps: deserializeParam(
          data['hasPassedFamilyProfileSteps'],
          ParamType.bool,
          false,
        ),
        selectedChildProfilesRefs: deserializeParam<DocumentReference>(
          data['selectedChildProfilesRefs'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['childProfiles'],
        ),
        validEventsRefs: deserializeParam<DocumentReference>(
          data['validEventsRefs'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['events'],
        ),
        rejectedEventsRefs: deserializeParam<DocumentReference>(
          data['rejectedEventsRefs'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['events'],
        ),
        favoriteEventsRefs: deserializeParam<DocumentReference>(
          data['favoriteEventsRefs'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['events'],
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProfileStruct &&
        owner == other.owner &&
        confirmedPrerequisites == other.confirmedPrerequisites &&
        hasPassedRequiredRegistrationSteps ==
            other.hasPassedRequiredRegistrationSteps &&
        hasPassedRequiredOnboardingSteps ==
            other.hasPassedRequiredOnboardingSteps &&
        booksForOwn == other.booksForOwn &&
        booksForRelatives == other.booksForRelatives &&
        booksOfficially == other.booksOfficially &&
        isPrivateManager == other.isPrivateManager &&
        isPublicManager == other.isPublicManager &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        birthdate == other.birthdate &&
        address == other.address &&
        temporaryProfileImage == other.temporaryProfileImage &&
        hasPassedPersonalProfileSteps == other.hasPassedPersonalProfileSteps &&
        hasPassedFamilyProfileSteps == other.hasPassedFamilyProfileSteps &&
        listEquality.equals(
            selectedChildProfilesRefs, other.selectedChildProfilesRefs) &&
        listEquality.equals(validEventsRefs, other.validEventsRefs) &&
        listEquality.equals(rejectedEventsRefs, other.rejectedEventsRefs) &&
        listEquality.equals(favoriteEventsRefs, other.favoriteEventsRefs);
  }

  @override
  int get hashCode => const ListEquality().hash([
        owner,
        confirmedPrerequisites,
        hasPassedRequiredRegistrationSteps,
        hasPassedRequiredOnboardingSteps,
        booksForOwn,
        booksForRelatives,
        booksOfficially,
        isPrivateManager,
        isPublicManager,
        givenName,
        familyName,
        birthdate,
        address,
        temporaryProfileImage,
        hasPassedPersonalProfileSteps,
        hasPassedFamilyProfileSteps,
        selectedChildProfilesRefs,
        validEventsRefs,
        rejectedEventsRefs,
        favoriteEventsRefs
      ]);
}

ProfileStruct createProfileStruct({
  DocumentReference? owner,
  bool? confirmedPrerequisites,
  bool? hasPassedRequiredRegistrationSteps,
  bool? hasPassedRequiredOnboardingSteps,
  bool? booksForOwn,
  bool? booksForRelatives,
  bool? booksOfficially,
  bool? isPrivateManager,
  bool? isPublicManager,
  String? givenName,
  String? familyName,
  String? birthdate,
  AddressStruct? address,
  String? temporaryProfileImage,
  bool? hasPassedPersonalProfileSteps,
  bool? hasPassedFamilyProfileSteps,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileStruct(
      owner: owner,
      confirmedPrerequisites: confirmedPrerequisites,
      hasPassedRequiredRegistrationSteps: hasPassedRequiredRegistrationSteps,
      hasPassedRequiredOnboardingSteps: hasPassedRequiredOnboardingSteps,
      booksForOwn: booksForOwn,
      booksForRelatives: booksForRelatives,
      booksOfficially: booksOfficially,
      isPrivateManager: isPrivateManager,
      isPublicManager: isPublicManager,
      givenName: givenName,
      familyName: familyName,
      birthdate: birthdate,
      address: address ?? (clearUnsetFields ? AddressStruct() : null),
      temporaryProfileImage: temporaryProfileImage,
      hasPassedPersonalProfileSteps: hasPassedPersonalProfileSteps,
      hasPassedFamilyProfileSteps: hasPassedFamilyProfileSteps,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileStruct? updateProfileStruct(
  ProfileStruct? profile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileStructData(
  Map<String, dynamic> firestoreData,
  ProfileStruct? profile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profile == null) {
    return;
  }
  if (profile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileData = getProfileFirestoreData(profile, forFieldValue);
  final nestedData = profileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileFirestoreData(
  ProfileStruct? profile, [
  bool forFieldValue = false,
]) {
  if (profile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profile.toMap());

  // Handle nested data for "address" field.
  addAddressStructData(
    firestoreData,
    profile.hasAddress() ? profile.address : null,
    'address',
    forFieldValue,
  );

  // Add any Firestore field values
  profile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileListFirestoreData(
  List<ProfileStruct>? profiles,
) =>
    profiles?.map((e) => getProfileFirestoreData(e, true)).toList() ?? [];
