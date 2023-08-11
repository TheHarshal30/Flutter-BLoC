// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskk/logic/cubit/cubit/news_cubit.dart';
import 'package:taskk/logic/models/news.dart';

class NewsDetails extends StatefulWidget {
  final News? news;
  final int idx;
  const NewsDetails({super.key, required this.news, required this.idx});

  @override
  State<NewsDetails> createState() => NewsDetailsState();
}

class NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    String title = widget.news!.feed[widget.idx].title;
    String description = widget.news!.feed[widget.idx].summary;
    String image = widget.news!.feed[widget.idx].bannerImage == null
        ? "https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"
        : widget.news!.feed[widget.idx].bannerImage!;
    String pubBy = widget.news!.feed[widget.idx].authors.isEmpty
        ? "Unknow Source"
        : widget.news!.feed[widget.idx].authors[0];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text('Details',
            style: GoogleFonts.roboto(
              textStyle: GoogleFonts.exo2(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 10, bottom: 20),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    title,
                    style: GoogleFonts.exo2(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
                child: Text(
                  description,
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 10, bottom: 8),
                child: Container(
                  child: Text(
                    "~By " + pubBy,
                    style: GoogleFonts.exo2(
                      textStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
