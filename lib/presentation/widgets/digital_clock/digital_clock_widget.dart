import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'clock_model.dart';

/// Digital Clock Widget that displays current time in different time zones
class DigitalClockWidget extends StatefulWidget {
  final List<TimeZoneModel> timeZones;
  final bool is24HourFormat;
  final Function(TimeZoneModel)? onTimeZoneSelected;

  const DigitalClockWidget({
    Key? key,
    required this.timeZones,
    this.is24HourFormat = true,
    this.onTimeZoneSelected,
  }) : super(key: key);

  @override
  State<DigitalClockWidget> createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
  late Timer _timer;
  late DateTime _currentTime;
  late ClockState _clockState;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _clockState = ClockState(
      currentTime: _currentTime,
      timeZones: widget.timeZones,
      is24HourFormat: widget.is24HourFormat,
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        _clockState = _clockState.copyWith(currentTime: _currentTime);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _getTimeInTimeZone(String timeZoneId) {
    try {
      final format = widget.is24HourFormat ? 'HH:mm:ss' : 'hh:mm:ss a';
      final dateFormat = DateFormat(format);
      
      // Get UTC time and calculate the offset for the timezone
      final utcTime = _currentTime.toUtc();
      
      // Using the timezone ID to get the correct time
      final locationTime = DateTime.parse(
        utcTime.toString().replaceAll('Z', '')
      ).add(Duration(
        hours: _getTimeZoneOffset(timeZoneId),
      ));
      
      return dateFormat.format(locationTime);
    } catch (e) {
      return '00:00:00';
    }
  }

  int _getTimeZoneOffset(String timeZoneId) {
    // Mapping of timezone IDs to their UTC offsets
    final offsets = {
      'America/New_York': -5, // EST
      'America/Los_Angeles': -8, // PST
      'Europe/London': 0, // GMT
      'Asia/Dubai': 4, // GST
      'Asia/Kolkata': 5, // IST (5:30 rounded to 5)
      'Asia/Singapore': 8, // SGT
      'Asia/Tokyo': 9, // JST
      'Australia/Sydney': 10, // AEST
    };
    return offsets[timeZoneId] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Clock Display
        _buildMainClockDisplay(),
        const SizedBox(height: 32),
        // Time Zones Grid
        _buildTimeZonesGrid(),
      ],
    );
  }

  Widget _buildMainClockDisplay() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1A1F3A),
            const Color(0xFF0A0E27),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF00D9FF),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'CURRENT TIME',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.is24HourFormat
                ? DateFormat('HH:mm:ss').format(_currentTime)
                : DateFormat('hh:mm:ss a').format(_currentTime),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 48,
              letterSpacing: 3,
              fontFamily: 'Courier',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            DateFormat('EEEE, MMMM d, yyyy').format(_currentTime),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeZonesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: widget.timeZones.length,
      itemBuilder: (context, index) {
        final timeZone = widget.timeZones[index];
        return _buildTimeZoneCard(timeZone);
      },
    );
  }

  Widget _buildTimeZoneCard(TimeZoneModel timeZone) {
    return GestureDetector(
      onTap: () => widget.onTimeZoneSelected?.call(timeZone),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              timeZone.color.withOpacity(0.2),
              timeZone.color.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: timeZone.color,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: timeZone.color.withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeZone.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: timeZone.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: timeZone.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    timeZone.abbreviation,
                    style: TextStyle(
                      color: timeZone.color,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              _getTimeInTimeZone(timeZone.timeZoneId),
              style: TextStyle(
                color: timeZone.color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Courier',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
