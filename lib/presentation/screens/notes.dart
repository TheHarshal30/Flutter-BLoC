// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskk/presentation/screens/description.dart';

import '../../logic/location.dart';
import '../router/router_animation.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    super.initState();
  }

  var selec = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, right: 25),
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Notes",
                      style: GoogleFonts.exo2(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, AnimateRoute(widget: Description()));
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green.shade900,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selec = index;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, top: 20, right: 5),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 5.5,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: (index == selec)
                                        ? Colors.green.shade900
                                        : Colors.white24,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "#Cat${index + 1}",
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )),
                        );
                      }),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 13,
                    itemBuilder: (context, index) {
                      String txt = "Note #";
                      String desc =
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl ultricies nunc, vitae luctus nisl nunc eu nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl ultricies nunc, vitae luctus nisl nunc eu nislLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl ultricies nunc, vitae luctus nisl nunc eu nisl";
                      String time = "10:00 AM";
                      String date = "Today";
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, AnimateRoute(widget: Description()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 20, bottom: 10),
                          child: Container(
                            height: 110,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(186, 201, 255, 0.07),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.green.shade900,
                                            width: 2,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green.shade900,
                                          size: 0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, bottom: 5),
                                        child: Text(
                                          txt,
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    desc,
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.grey[600],
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        date,
                                        style: GoogleFonts.exo2(
                                          textStyle: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        time,
                                        style: GoogleFonts.exo2(
                                          textStyle: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
