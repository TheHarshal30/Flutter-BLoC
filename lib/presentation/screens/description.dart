// ignore_for_file: unnecessary_new, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskk/presentation/router/router_animation.dart';

import 'home.dart';

class Description extends StatefulWidget {
  // final String txt;
  // final String desc;
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

final String txt = "";
final String desc = "";

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _txtController = TextEditingController(text: txt);
    TextEditingController _descController = TextEditingController(text: desc);
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Color.fromRGBO(186, 201, 255, 0.07),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
        child: Icon(Icons.done),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        title: Text("Description"),
        titleTextStyle: GoogleFonts.exo2(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/desc.png',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 0),
              child: TextField(
                style: GoogleFonts.exo2(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                controller: _txtController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
            //   child: Text(
            //     "Title",
            //     style: GoogleFonts.exo2(
            //       textStyle: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 20.0, top: 5, right: 20, bottom: 10),
            //   child: Text(
            //     desc,
            //     style: GoogleFonts.exo2(
            //       textStyle: TextStyle(
            //         color: Colors.grey[600],
            //         fontSize: 15,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 0, bottom: 10),
              child: TextField(
                minLines: 1,
                maxLines: 10000,
                style: GoogleFonts.exo2(
                  textStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                controller: _descController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
