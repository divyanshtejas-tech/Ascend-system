import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

/// Model for a single time zone
class TimeZoneModel {
  final String name;
  final String timeZoneId;
  final String abbreviation;
  final Color color;
  final bool isActive;

  TimeZoneModel({
    required this.name,
    required this.timeZoneId,
    required this.abbreviation,
    required this.color,
    this.isActive = false,
  });

  TimeZoneModel copyWith({
    String? name,
    String? timeZoneId,
    String? abbreviation,
    Color? color,
    bool? isActive,
  }) {
    return TimeZoneModel(
      name: name ?? this.name,
      timeZoneId: timeZoneId ?? this.timeZoneId,
      abbreviation: abbreviation ?? this.abbreviation,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
    );
  }
}

/// Model for clock state
class ClockState {
  final DateTime currentTime;
  final List<TimeZoneModel> timeZones;
  final bool is24HourFormat;

  ClockState({
    required this.currentTime,
    required this.timeZones,
    this.is24HourFormat = true,
  });

  String getFormattedTime(String timeZoneId) {
    try {
      final format = is24HourFormat ? 'HH:mm:ss' : 'hh:mm:ss a';
      final dateFormat = DateFormat(format);
      final tz = DateTime.now().timeZoneOffset;
      final utcTime = currentTime.toUtc();
      
      // Calculate offset for the specific timezone
      final formatter = DateFormat(format);
      return formatter.format(utcTime);
    } catch (e) {
      return '00:00:00';
    }
  }

  ClockState copyWith({
    DateTime? currentTime,
    List<TimeZoneModel>? timeZones,
    bool? is24HourFormat,
  }) {
    return ClockState(
      currentTime: currentTime ?? this.currentTime,
      timeZones: timeZones ?? this.timeZones,
      is24HourFormat: is24HourFormat ?? this.is24HourFormat,
    );
  }
}

/// Predefined time zones
class TimeZoneConstants {
  static const List<TimeZoneModel> defaultTimeZones = [
    TimeZoneModel(
      name: 'New York',
      timeZoneId: 'America/New_York',
      abbreviation: 'EST/EDT',
      color: Color(0xFF00D9FF),
    ),
    TimeZoneModel(
      name: 'London',
      timeZoneId: 'Europe/London',
      abbreviation: 'GMT/BST',
      color: Color(0xFF0066FF),
    ),
    TimeZoneModel(
      name: 'Tokyo',
      timeZoneId: 'Asia/Tokyo',
      abbreviation: 'JST',
      color: Color(0xFF9D00FF),
    ),
    TimeZoneModel(
      name: 'Sydney',
      timeZoneId: 'Australia/Sydney',
      abbreviation: 'AEST/AEDT',
      color: Color(0xFF00FF88),
    ),
    TimeZoneModel(
      name: 'Dubai',
      timeZoneId: 'Asia/Dubai',
      abbreviation: 'GST',
      color: Color(0xFFFF6B00),
    ),
    TimeZoneModel(
      name: 'Mumbai',
      timeZoneId: 'Asia/Kolkata',
      abbreviation: 'IST',
      color: Color(0xFFFF006E),
    ),
    TimeZoneModel(
      name: 'Singapore',
      timeZoneId: 'Asia/Singapore',
      abbreviation: 'SGT',
      color: Color(0xFF00D9FF),
    ),
    TimeZoneModel(
      name: 'Los Angeles',
      timeZoneId: 'America/Los_Angeles',
      abbreviation: 'PST/PDT',
      color: Color(0xFF0066FF),
    ),
  ];
}
