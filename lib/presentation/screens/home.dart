// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskk/logic/cubit/cubit/news_cubit.dart';
import 'package:taskk/logic/cubit/weather_cubit.dart';
import 'package:taskk/logic/models/weather.dart';
import 'package:taskk/presentation/router/router_animation.dart';
import 'package:taskk/presentation/screens/description.dart';
import 'package:taskk/presentation/screens/news_details.dart';

import '../../logic/cubit/cubit/location_cubit.dart';
import '../../logic/location.dart';
import '../../logic/models/remote_services.dart';

class Home extends StatefulWidget {
  final String title;
  final Color color;
  Home({super.key, required this.title, required this.color});

  @override
  State<Home> createState() => _HomeState();
}

// void details(BuildContext context) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           titlePadding: EdgeInsets.zero,
//           backgroundColor: Colors.black,
//           title: Container(
//               height: MediaQuery.of(context).size.height / 10,
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(
//                 'assets/desc.png',
//                 fit: BoxFit.cover,
//               )),
//           content: Container(
//             height: MediaQuery.of(context).size.height / 3,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 0.0, bottom: 5),
//                   child: Text(
//                     txt,
//                     style: GoogleFonts.exo2(
//                       textStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   desc,
//                   style: GoogleFonts.exo2(
//                     textStyle: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
var selec = 0;
String lat = "";
String long = "";

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, right: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage('assets/pfp.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Welcome,',
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 18,
                                    ),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Tesla',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.category,
                          color: Colors.green[600],
                          size: 25,
                        )
                      ]),
                ),
                //   Padding(
                //     padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
                //     child: Text(
                //       "Location found!",
                //       style: GoogleFonts.exo2(
                //         textStyle: TextStyle(
                //           color: Colors.white,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                //   BlocBuilder<LocationCubit, LocationState>(
                //     builder: (context, state) {
                //       lat = state.lat;
                //       long = state.long;
                //       return Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                //             child: Text(
                //               "Latitude: $lat",
                //               style: GoogleFonts.exo2(
                //                 textStyle: TextStyle(
                //                   color: Colors.grey[600],
                //                   fontSize: 15,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                //             child: Text(
                //               "Longitude: $long",
                //               style: GoogleFonts.exo2(
                //                 textStyle: TextStyle(
                //                   color: Colors.grey[600],
                //                   fontSize: 15,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                        String temp = "";
                        String desc = "";
                        String wind = "";
                        String humidity = "";
                        String clouds = "";
                        String cc = "";
                        if (state.isLoaded == true) {
                          temp = state.weather!.current.tempC.toString();
                          desc = state.weather!.current.condition.text;
                          wind = state.weather!.current.windKph.toString();
                          humidity = state.weather!.current.humidity.toString();
                          clouds = state.weather!.current.cloud.toString();
                        }
                        return Container(
                          height: MediaQuery.of(context).size.height / 5,
                          //color: Color.fromRGBO(186, 201, 255, 0.07),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    temp + "°",
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      desc,
                                      style: GoogleFonts.exo2(
                                        textStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.wind_power,
                                          color: Colors.green[600],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                wind + " km/h",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Wind",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.water_drop,
                                          color: Colors.green[600],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                humidity + "%",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Humidity",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.cloud,
                                          color: Colors.green[600],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                clouds + "%",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Clouds",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Text("Headlines",
                      style: GoogleFonts.exo2(
                        textStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18,
                        ),
                      )),
                ),
                BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  String title = "";
                                  String desc = "";
                                  String time = "";
                                  String day = "";
                                  String month = "";
                                  String year = "";
                                  String pubBy = "";
                                  String topic = "";
                                  if (state.isLoaded == true) {
                                    title = state.news!.feed[index].title;
                                    desc = state.news!.feed[index].summary;
                                    time =
                                        state.news!.feed[index].timePublished;
                                    day = time.substring(6, 8);
                                    month = time.substring(4, 6);
                                    if (month == "01") month = "Jan";
                                    if (month == "02") month = "Feb";
                                    if (month == "03") month = "Mar";
                                    if (month == "04") month = "Apr";
                                    if (month == "05") month = "May";
                                    if (month == "06") month = "Jun";
                                    if (month == "07") month = "Jul";
                                    if (month == "08") month = "Aug";
                                    if (month == "09") month = "Sep";
                                    if (month == "10") month = "Oct";
                                    if (month == "11") month = "Nov";
                                    if (month == "12") month = "Dec";
                                    year = time.substring(0, 4);
                                    pubBy = state
                                            .news!.feed[index].authors.isEmpty
                                        ? "Unknow Source"
                                        : state.news!.feed[index].authors[0];
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          AnimateRoute(
                                            widget: NewsDetails(
                                              news: state.news,
                                              idx: index,
                                            ),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20, top: 10),
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromRGBO(
                                              186, 201, 255, 0.07),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  7,
                                              child: Text(title,
                                                  overflow: TextOverflow.fade,
                                                  style: GoogleFonts.exo2(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  )),
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Icon(
                                                        Icons.article,
                                                        color:
                                                            Colors.green[600],
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      child: Text(pubBy,
                                                          style:
                                                              GoogleFonts.exo2(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .grey[600],
                                                              fontSize: 15,
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                Text(topic,
                                                    //day + "-" + month,
                                                    style: GoogleFonts.exo2(
                                                      textStyle: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 15,
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 30),
                          child: Text("More news",
                              style: GoogleFonts.exo2(
                                textStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 10),
                          child: Container(
                            // height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  String title = "";
                                  String desc = "";
                                  String time = "";
                                  String day = "";
                                  String month = "";
                                  String year = "";
                                  String pubBy = "";
                                  String topic = "";
                                  if (state.isLoaded == true) {
                                    title = state.news!.feed[index + 10].title;
                                    desc = state.news!.feed[index + 10].summary;
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          AnimateRoute(
                                            widget: NewsDetails(
                                              news: state.news,
                                              idx: index + 10,
                                            ),
                                          ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromRGBO(
                                              186, 201, 255, 0.07),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Text(
                                                  desc,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.fade,
                                                  style: GoogleFonts.exo2(
                                                    textStyle: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
