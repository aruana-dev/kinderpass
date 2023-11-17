// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';

Future<String> audioToBase64(String audioPath) async {
  // convert an audiopath to base64 string
// Read the audio file as bytes
  final bytes = await File(audioPath).readAsBytes();

  // Encode the bytes as base64 string
  final base64String = base64Encode(bytes);

  return base64String;
}
