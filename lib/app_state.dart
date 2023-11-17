import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _colorMode = prefs.getString('ff_colorMode') ?? _colorMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _needsAttention = false;
  bool get needsAttention => _needsAttention;
  set needsAttention(bool value) {
    _needsAttention = value;
  }

  bool _isReady = false;
  bool get isReady => _isReady;
  set isReady(bool value) {
    _isReady = value;
  }

  List<DocumentReference> _localSelectedChildProfilesRefs = [];
  List<DocumentReference> get localSelectedChildProfilesRefs =>
      _localSelectedChildProfilesRefs;
  set localSelectedChildProfilesRefs(List<DocumentReference> value) {
    _localSelectedChildProfilesRefs = value;
  }

  void addToLocalSelectedChildProfilesRefs(DocumentReference value) {
    _localSelectedChildProfilesRefs.add(value);
  }

  void removeFromLocalSelectedChildProfilesRefs(DocumentReference value) {
    _localSelectedChildProfilesRefs.remove(value);
  }

  void removeAtIndexFromLocalSelectedChildProfilesRefs(int index) {
    _localSelectedChildProfilesRefs.removeAt(index);
  }

  void updateLocalSelectedChildProfilesRefsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _localSelectedChildProfilesRefs[index] =
        updateFn(_localSelectedChildProfilesRefs[index]);
  }

  void insertAtIndexInLocalSelectedChildProfilesRefs(
      int index, DocumentReference value) {
    _localSelectedChildProfilesRefs.insert(index, value);
  }

  String _colorMode = 'system';
  String get colorMode => _colorMode;
  set colorMode(String value) {
    _colorMode = value;
    prefs.setString('ff_colorMode', value);
  }

  String _currentPage = '';
  String get currentPage => _currentPage;
  set currentPage(String value) {
    _currentPage = value;
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String value) {
    _filePath = value;
  }

  String _currentEventPreviewId = '';
  String get currentEventPreviewId => _currentEventPreviewId;
  set currentEventPreviewId(String value) {
    _currentEventPreviewId = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
