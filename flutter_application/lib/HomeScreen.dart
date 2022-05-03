import 'package:flutter/material.dart';
import 'package:flutter_application/DetailsScreen.dart';
import 'package:flutter_application/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/food.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Food foodService = Food();
  bool tag = false;
  String string = 'string';
  final letter = '%5C';
  final newLetter = '/';

  /*
  List freshList = [
    {"image": "assets/images/food1.png"},
    {"image": "assets/images/food2.png", "name": "Blueberry Muffins"},
    {"image": "assets/images/food1.png"},
    {"image": "assets/images/food2.png", "name": "Blueberry Muffins"},
  ];
  List recommendedList = [
    {"image": "assets/images/food3.png", "name": "Fresh Toast with Berries"},
    {"image": "assets/images/food4.png", "name": "Glazed Salmon"},
    {"image": "assets/images/food5.png", "name": "Cherry Clafoutis"},
    {"image": "assets/images/food3.png", "name": "Fresh Toast with Berries"},
    {"image": "assets/images/food4.png", "name": "Glazed Salmon"},
    {"image": "assets/images/food5.png", "name": "Cherry Clafoutis"},
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 64.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() => print("Menu")),
                    child: SvgPicture.asset(
                      "assets/icons/menu.svg",
                      height: 32.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (() => print("Notification")),
                    child: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      height: 32.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                "Bonjor",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "What would you like to cook today ?",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: "HellixBold",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextField(
                        cursorColor: kDarkColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 34.0,
                          ),
                          hintText: "Search for Recipes",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () => print("Filter"),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 18.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/settings.svg",
                        //color: kDarkColor,
                        height: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's fresh Recipies",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Fresh Recipes"),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                height: 240.0,
                child: FutureBuilder<List>(
                  future: foodService.getAllFood(),
                  builder: (context, snapshot) {
                    print("print food next line");
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            print(snapshot.data![index]['foodname']);
                            print(snapshot.data![index]['time']);
                            print(snapshot.data![index]['calories']);
                            print(snapshot.data![index]['duration']);
                            print(snapshot.data![index]['duration']);

                            var imageUrl =
                               "http://192.168.1.244:3000/uploads/2022-04-23T15-18-23.071Zfood2.png";
                             //"http://192.168.1.244:3000/" +
                            //snapshot.data![index]['foodImage'];

                            //tring = imageUrl.replaceAll(letter, newLetter);
                            //String image= snapshot.data![index]["foodImage"];
                            print(string);
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      index,
                                      snapshot.data![index]["foodname"],
                                      imageUrl,
                                      // Image.network(string) as String,
                                      tag = true),
                                ),
                              ),
                              child: Container(
                                height: 240.0,
                                width: 200.0,
                                margin: EdgeInsets.only(
                                  right: 32.0,
                                ),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 16.0,
                                      left: 16.0,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Positioned(
                                      top: 16.0,
                                      right: -32.0,
                                      child: Hero(
                                        tag: "fresh$index",
                                        child: Container(
                                          width: 120.0,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  imageUrl),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 100.0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index]['time'],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Container(
                                              width: 180.0,
                                              child: Text(
                                                snapshot.data![index]
                                                    ["foodname"],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontFamily: "HellixBold",
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: List.generate(
                                                5,
                                                (index) => Icon(
                                                  Icons.star,
                                                  color: kOrangeColor,
                                                  size: 16.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              snapshot.data![index]['calories'],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: kOrangeColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time,
                                                      color: Colors.grey,
                                                      size: 14.0,
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      snapshot.data![index]
                                                          ['duration'],
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 32.0),
                                                Row(
                                                  children: [
                                                    /*
                                                    SvgPicture.asset(
                                                      "assets/icons/bell.svg",//bell
                                                      height: 14.0,
                                                      color: Colors.grey,
                                                    ),*/
                                                    SizedBox(width: 8.0),
                                                    Text(
                                                      snapshot.data![index]
                                                          ['description'],
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
