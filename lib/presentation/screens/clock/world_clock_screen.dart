import 'package:flutter/material.dart';
import '../../widgets/digital_clock/clock_model.dart';
import 'package:intl/intl.dart';

/// World Clock Screen showing all time zones
class WorldClockScreen extends StatefulWidget {
  const WorldClockScreen({Key? key}) : super(key: key);

  @override
  State<WorldClockScreen> createState() => _WorldClockScreenState();
}

class _WorldClockScreenState extends State<WorldClockScreen> {
  late List<TimeZoneModel> _timeZones;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _timeZones = TimeZoneConstants.defaultTimeZones;
  }

  @override
  Widget build(BuildContext context) {
    final filteredTimeZones = _timeZones
        .where((tz) => tz.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        title: const Text('WORLD CLOCK'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search City',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF00D9FF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Time Zones List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredTimeZones.length,
              itemBuilder: (context, index) {
                return _buildTimeZoneListItem(
                  filteredTimeZones[index],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeZoneListItem(TimeZoneModel timeZone, int index) {
    final now = DateTime.now();
    final time = DateFormat('HH:mm:ss').format(now);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              timeZone.color.withOpacity(0.15),
              timeZone.color.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: timeZone.color,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  timeZone.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: timeZone.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timeZone.timeZoneId,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: timeZone.color.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: timeZone.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timeZone.abbreviation,
                  style: TextStyle(
                    color: timeZone.color.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
