import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/weather_app.dart';
import 'package:weather_app/weather_locations.dart';

import '../api_integration.dart';

class SingleWidget extends StatefulWidget {
  const SingleWidget({Key? key}) : super(key: key);

  @override
  State<SingleWidget> createState() => _SingleWidgetState();
}

class _SingleWidgetState extends State<SingleWidget> {
  @override
  Widget build(BuildContext context) {
    WeatherApi w = WeatherApi();
    Weathers? a;
    Future<void> getData() async {
      a = (await w.getCurrent(location));
    }

    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapchot) {
          if (snapchot.connectionState == ConnectionState.done) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 150,
                                ),
                                Text(
                                  "${a!.cityname}",
                                  style: GoogleFonts.lato(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (a!.temp! - 273.15).toStringAsFixed(1) +
                                      "\u00B0C",
                                  style: GoogleFonts.lato(
                                      fontSize: 85,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                Row(children: [
                                  SvgPicture.asset(
                                    'assets/cloudy.svg',
                                    height: 34,
                                    width: 34,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Haze",
                                    style: GoogleFonts.lato(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ])
                              ])
                        ]),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.white30,
                        )),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Wind',
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "${a!.wind}",
                                      style: GoogleFonts.lato(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "km/h",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 50,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5,
                                          width: 5,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(children: [
                                  Text(
                                    'Clouds',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${a!.rain}',
                                    style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "%",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 50,
                                        color: Colors.white38,
                                      ),
                                      Container(
                                          height: 5,
                                          width: 5,
                                          color: Colors.redAccent)
                                    ],
                                  )
                                ]),
                                Column(children: [
                                  Text(
                                    'Humidity',
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "${a!.humidity}",
                                    style: GoogleFonts.lato(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "%",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 50,
                                        color: Colors.white38,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        color: Colors.redAccent,
                                      )
                                    ],
                                  )
                                ]),
                                Column(
                                  children: [
                                    Text(
                                      'Feels Like',
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      (a!.feel! - 273.15).toStringAsFixed(1),
                                      style: GoogleFonts.lato(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "\u00B0C",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 50,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5,
                                          width: 5,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ]))
                    ],
                  )
                ]);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
