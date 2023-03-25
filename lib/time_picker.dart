import 'package:flutter/material.dart';
import 'main.dart';

void main() => runApp(const MyApp());

class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Time Picker Themed Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}

class Tempo extends StatefulWidget {
  const Tempo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TempoState createState() => _TempoState();
}

class _TempoState extends State<Tempo> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectTime,
              child: const Text('SELECT TIME'),
            ),
            const SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
          ],
        ),
      ),
    );
  }
}
