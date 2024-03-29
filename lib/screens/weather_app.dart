// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/single_widgets.dart';

import '../api_integration.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  WeatherApp createState() => WeatherApp();
}

String location = 'karachi';
WeatherApi w = WeatherApi();

class WeatherApp extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                location = value;
                              },
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    w.getCurrent(location);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Weather()));
                                },
                                child: const Text('Submit'))
                          ],
                        ),
                      ));
                });
          },
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () {
                print('Menu Clicked');
              },
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/night.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          const SingleWidget()
        ],
      ),
    );
  }
}
