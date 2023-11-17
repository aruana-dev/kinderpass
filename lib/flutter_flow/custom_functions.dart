import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int returnAgeFromBirthdate(String birthdate) {
  List<String> parts = birthdate.split('.');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);
  DateTime birthday = DateTime(year, month, day);

  DateTime today = DateTime.now();

  int age = today.year - birthday.year;
  int month1 = today.month;
  int month2 = birthday.month;

  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = today.day;
    int day2 = birthday.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
