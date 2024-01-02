import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? aMonthAgo(DateTime? now) {
  if (now == null) {
    // Handle the case where now is null, for example, return null
    return null;
  }

  // Calculate the difference in months (assuming 30 days per month for simplicity)
  final int oneMonthAgo = now.month - 1;

  // Adjust the year and month
  int year = now.year;
  int month = oneMonthAgo <= 0 ? 12 : oneMonthAgo;

  // If the current month is January, adjust the year as well
  if (oneMonthAgo <= 0) {
    year--;
  }

  // Create and return the DateTime from a month ago
  return DateTime(year, month, now.day, now.hour, now.minute, now.second,
      now.millisecond, now.microsecond);
}

String? countStatuses(
  List<int> workStatuses,
  int status,
) {
  return workStatuses.where((element) => element == status).length.toString();
}
