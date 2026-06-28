import 'package:flutter/material.dart';
import '../../widgets/digital_clock/digital_clock_widget.dart';
import '../../widgets/digital_clock/analog_clock_widget.dart';
import '../../widgets/digital_clock/clock_model.dart';

/// Clock Screen showing digital and analog clocks with multiple time zones
class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late List<TimeZoneModel> _timeZones;
  bool _is24HourFormat = true;
  TimeZoneModel? _selectedTimeZone;

  @override
  void initState() {
    super.initState();
    _timeZones = TimeZoneConstants.defaultTimeZones;
    _selectedTimeZone = _timeZones.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        title: const Text('WORLD CLOCK'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Digital Clock Widget
            DigitalClockWidget(
              timeZones: _timeZones,
              is24HourFormat: _is24HourFormat,
              onTimeZoneSelected: (timeZone) {
                setState(() {
                  _selectedTimeZone = timeZone;
                });
              },
            ),
            const SizedBox(height: 32),
            // Analog Clock Display
            if (_selectedTimeZone != null) ...[_buildAnalogClockSection()],
          ],
        ),
      ),
    );
  }

  Widget _buildAnalogClockSection() {
    return Column(
      children: [
        Text(
          'ANALOG VIEW',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _selectedTimeZone!.color,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                _selectedTimeZone!.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: _selectedTimeZone!.color,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 250,
                height: 250,
                child: AnalogClockWidget(
                  timeZone: _selectedTimeZone!,
                  currentTime: DateTime.now(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1F3A),
      builder: (context) => _buildSettingsPanel(),
    );
  }

  Widget _buildSettingsPanel() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Clock Settings',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          // Time Format Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '24-Hour Format',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Switch(
                value: _is24HourFormat,
                onChanged: (value) {
                  setState(() {
                    _is24HourFormat = value;
                  });
                  Navigator.pop(context);
                },
                activeColor: const Color(0xFF00D9FF),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Time Zones Selection
          Text(
            'Select Time Zones to Display',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: _timeZones.length,
              itemBuilder: (context, index) {
                final timeZone = _timeZones[index];
                return CheckboxListTile(
                  title: Text(timeZone.name),
                  value: timeZone.isActive,
                  onChanged: (value) {
                    setState(() {
                      _timeZones[index] = timeZone.copyWith(isActive: value);
                    });
                  },
                  activeColor: const Color(0xFF00D9FF),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}
