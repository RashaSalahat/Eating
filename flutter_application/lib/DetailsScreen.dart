//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final String name;

  final bool tags;

  var image;
  DetailsScreen(this.index, this.name, this.image, this.tags);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var imageUrl =
      "http://192.168.1.244:3000/uploads/2022-04-23T15-18-23.071Zfood2.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 58.0,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 32.0),
          decoration: BoxDecoration(
            color: kOrangeColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: "HellixBold",
              color: kLightColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 64.0, left: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 28.0),
                  decoration: BoxDecoration(
                    color: kOrangeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.star,
                      color: kLightColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 36.0, fontFamily: "HellixBold"),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\$",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    ),
                    TextSpan(
                      text: " 250.25",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontFamily: "HellixBold",
                        color: kOrangeColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "120 Calories",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 36.0),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "10 mins",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 36.0),
                          Text(
                            "Total Serve",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: "HellixBold",
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "1 Serving",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HellixBold",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Hero(
                      tag: widget.tags
                          ? "fresh${widget.index}"
                          : "recommended${widget.index}",
                      child: Container(
                        height: 250.0,
                        width:300.0 ,
                        child: Image.network(widget.image,
                        fit:BoxFit.contain ,
                        
                        ),
                        
/*
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            //child: Image.asset("assets/images/food1.png")
                            image: CachedNetworkImageProvider(
                                "http://192.168.1.244:3000/uploads/2022-04-23T15-18-23.071Zfood2.png"),
                          ),
                        ),*/
                      ),
                      /*
                      child: Image.asset(
                        "http://192.168.1.244:3000/uploads/2022-04-23T15-18-23.071Zfood2.png",
                            height: 250.0,
                            fit: BoxFit.contain,

                      ),*/
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Description",
                style: TextStyle(fontSize: 24.0, fontFamily: "HellixBold"),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(right: 28.0, bottom: 28.0),
                child: Text(
                  "Some Text",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontFamily: "HellixBold",
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
