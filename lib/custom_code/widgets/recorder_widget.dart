// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class RecorderWidget extends StatefulWidget {
  const RecorderWidget(
      {Key? key,
      this.width,
      this.height,
      required this.uid,
      required this.eventId})
      : super(key: key);

  final double? width;
  final double? height;
  final String uid;
  final String eventId;

  @override
  _RecorderWidgetState createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends State<RecorderWidget> {
  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;
  bool _isUploading = false;
  bool _uploadComplete = false;
  String? _path;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _recorder?.openAudioSession();
  }

  @override
  void dispose() {
    _recorder?.closeAudioSession();
    super.dispose();
  }

  Future<void> _startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    _path = '${directory.path}/audio.mp4';
    await _recorder?.startRecorder(toFile: _path, codec: Codec.aacMP4);
    setState(() => _isRecording = true);
  }

  Future<void> _stopRecording() async {
    await _recorder?.stopRecorder();
    setState(() => _isRecording = false);
  }

  Future<void> _uploadAudio() async {
    setState(() {
      _isUploading = true;
    });
    if (_path != null) {
      File file = File(_path!);
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final fileName = 'audio_messages/audio_$timestamp.mp4';

      TaskSnapshot taskSnapshot =
          await FirebaseStorage.instance.ref(fileName).putFile(file);

      final downloadUrl = await taskSnapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('recordings').add({
        'downloadURL': downloadUrl,
        'timestamp': timestamp,
        'uid': widget.uid,
        'eventId': widget.eventId
      });

      setState(() {
        _isUploading = false;
        _uploadComplete = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _uploadComplete
            ? Text('Du kannst dieses Fenster jetzt schliessen.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isUploading) CircularProgressIndicator(),
                  if (!_isUploading && !_isRecording && !_uploadComplete)
                    IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: _startRecording,
                    ),
                  if (_isRecording)
                    IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: _stopRecording,
                    ),
                  if (!_isUploading && !_isRecording && _path != null)
                    ElevatedButton(
                      onPressed: _uploadAudio,
                      child: const Text('Absenden'),
                    ),
                ],
              ),
      ),
    );
  }
}
