import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../../../core/assets/my_cons.dart';

class Weather extends StatefulWidget {
  @override
  _Weather createState() => _Weather();
}

class _Weather extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.calendar,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Tuesday",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("23 April 2022"),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: DigitalClock(
                      areaWidth: 70,
                      areaDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      hourMinuteDigitDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      secondDigitDecoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      hourMinuteDigitTextStyle: TextStyle(
                        color: MyCons.darkModeEnabled
                            ? Colors.black38
                            : Colors.blueGrey,
                        fontSize: 15,
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("Precipitation",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                          child: Text(
                            "1%",
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text("Wind",
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                            child: Text(
                              "2 km/h",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text("Humidity",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                          child: Text(
                            "92%",
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Text("Visibility",
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                            child: Text(
                              "5 km/h",
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
