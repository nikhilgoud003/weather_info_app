import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';
  List<Map<String, String>> _weeklyForecast = [];

  void _fetchWeather() {
    final random = Random();
    setState(() {
      _cityName = _cityController.text;
      _temperature = '${random.nextInt(16) + 15}°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][random.nextInt(3)];
      _weeklyForecast = List.generate(7, (index) {
        return {
          'day': 'Day ${index + 1}',
          'temperature': '${random.nextInt(16) + 15}°C',
          'condition': ['Sunny', 'Cloudy', 'Rainy'][random.nextInt(3)],
        };
      });
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
                labelText: 'Enter city name',
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
            SizedBox(height: 20),
            Text('7-Day Forecast',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _weeklyForecast.length,
                itemBuilder: (context, index) {
                  final dayForecast = _weeklyForecast[index];
                  return ListTile(
                    title: Text(dayForecast['day']!),
                    subtitle: Text(
                        '${dayForecast['temperature']} - ${dayForecast['condition']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
