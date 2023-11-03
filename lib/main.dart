 import 'dart:convert';
 import 'package:flutter/material.dart';

 void main() {
   runApp(MyApp());
 }

 class WeatherInfo {
   final String city;
   final int temperature;
   final String condition;
   final int humidity;
   final double windSpeed;

   WeatherInfo({
     required this.city,
     required this.temperature,
     required this.condition,
     required this.humidity,
     required this.windSpeed,
   });

   factory WeatherInfo.fromJson(Map<String, dynamic> json) {
     return WeatherInfo(
       city: json['city'],
       temperature: json['temperature'],
       condition: json['condition'],
       humidity: json['humidity'],
       windSpeed: json['windSpeed'].toDouble(),
     );
   }
 }

 class MyApp extends StatelessWidget {
   final String jsonStr = '''
  [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]
  ''';

   List<WeatherInfo> weatherData = [];

   MyApp({super.key}) {
     List<dynamic> jsonList = json.decode(jsonStr);
     weatherData = jsonList.map((item) => WeatherInfo.fromJson(item)).toList();
   }

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: const Text('Weather Info App'),
         ),
         body: ListView.builder(
           itemCount: weatherData.length,
           itemBuilder: (context, index) {
             WeatherInfo weatherInfo = weatherData[index];
             return Card(
               elevation: 1, // Set the elevation for the shadow effect
               child: ListTile(
                 title: Text('City: ${weatherInfo.city}'),
                 subtitle: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text('Temperature: ${weatherInfo.temperature}°C'),
                     Text('Condition: ${weatherInfo.condition}'),
                     Text('Humidity: ${weatherInfo.humidity}%'),
                     Text('Wind Speed: ${weatherInfo.windSpeed} m/s'),
                   ],
                 ),
               ),
             );
           },
         ),
       ),
     );
   }
 }

