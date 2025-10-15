import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import 'package:travelv/models/travel_models.dart.dart';

void main() {
  runApp(TravelV());
}

class TravelV extends StatefulWidget {
  const TravelV({super.key});

  @override
  State<TravelV> createState() => _TravelVState();
}

class _TravelVState extends State<TravelV> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool SelectedLike = false;
  int SelectedIndex = 0;
  double ImageSize = 55;

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: Size.height / 2.3,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: Size.height / 2.58,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(travelList[SelectedIndex].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(CupertinoIcons.arrow_left),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white38,
                          ),
                          child: IconButton(
                            icon: Icon(
                              SelectedLike
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border,
                              color: SelectedLike ? Colors.red : Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                SelectedLike = !SelectedLike;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -8,
                    top: 80,
                    child: SizedBox(
                      width: 100,
                      height: double.maxFinite,
                      child: ListView.builder(
                        itemCount: travelList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      SelectedIndex = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          travelList[index].image,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: SelectedIndex == index
                                            ? Colors.yellow
                                            : Colors.white,
                                        width: 3,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    width: SelectedIndex == index
                                        ? ImageSize + 25
                                        : ImageSize,
                                    height: SelectedIndex == index
                                        ? ImageSize + 25
                                        : ImageSize,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Size.height / 11,
                    left: Size.width / 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          travelList[SelectedIndex].name,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),

                        Row(
                          children: [
                            Icon(Icons.location_on_sharp, color: Colors.white),
                            Text(
                              travelList[SelectedIndex].location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            child: Container(
                              width: 115,
                              height: 115,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Distance',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    travelList[SelectedIndex].distance + ' km',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                              side: BorderSide(
                                width: 1,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                            elevation: 2,
                            child: Container(
                              width: 115,
                              height: 115,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Temp', style: TextStyle(fontSize: 25)),
                                  Text(
                                    travelList[SelectedIndex].temp.toString() +
                                        '° c',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                              side: BorderSide(
                                width: 1,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Container(
                              width: 115,
                              height: 115,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Rate', style: TextStyle(fontSize: 25)),
                                  Text(
                                    travelList[SelectedIndex].rate.toString(),
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            ExpandableText(
                              travelList[SelectedIndex].description,
                              expanded: true,
                              expandText: 'show more',
                              collapseText: 'show less',
                              maxLines: 1,
                              animation: true,
                              animationCurve: Curves.easeInOutBack,
                              animationDuration: Duration(milliseconds: 500),
                              linkColor: Colors.blue,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Price',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(
                                        '\$' +
                                            travelList[SelectedIndex].price
                                                .toString(),
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
