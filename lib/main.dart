import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  void _fetchWeather() {
    final random = Random();
    setState(() {
      _cityName = _cityController.text;
      _temperature = '${random.nextInt(16) + 15}°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][random.nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter City Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $_cityName', style: TextStyle(fontSize: 18)),
            Text('Temperature: $_temperature', style: TextStyle(fontSize: 18)),
            Text('Condition: $_weatherCondition',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
