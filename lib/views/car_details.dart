import 'package:carss/controllers/car_detail_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/best_cars.dart';

import 'package:flutter/rendering.dart';

class CarDetails extends StatefulWidget {
  final BestCar bestCar;
  final int index;

  // You can ask Get to find a Controller that is being used by another page and redirect you to it.

  CarDetails({this.bestCar, this.index});

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  final CarDetailPageController carDetailPageController = Get.find();
  ScrollController _hideButtonController;

  var _isVisible;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      // if (_hideButtonController.position.atEdge) {
      //   setState(() {
      //     _isVisible = true;
      //   });
      // }
      //  if (_hideButtonController.position.pixels == 0) {
      //   setState(() {
      //     _isVisible = false;
      //   });
      // }

      if (_hideButtonController.position.atEdge) 
      {
         if (_hideButtonController.position.pixels == 0)
         {
           //at top
           setState(() {
          _isVisible = false;
        });
         }

         else
         {
           setState(() {
          _isVisible = true;
        });
         }
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    var specsNameList = widget.bestCar.specifications.keys.toList();
    var specsList = widget.bestCar.specifications.values.toList();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isVisible ? 60.0 : 0.0,
        child: BuildGoToStore(
          bestCar: widget.bestCar,
          width: width,
        ),
      ),
      backgroundColor: HexColor('#FF7777'),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _hideButtonController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: [
                FittedBox(
                  alignment: Alignment.topCenter,
                  child: Hero(
                      tag: carDetailPageController.carList[widget.index],
                      child: Image.asset(
                        widget.bestCar.img,
                      )),
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 10,
                  left: 15,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.navigate_before_outlined,
                      size: 25,
                    ),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  child: GetBuilder<CarDetailPageController>(
                    init: CarDetailPageController(),
                    builder: (controller) {
                      return IconButton(
                          iconSize: 25,
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            controller.toggleFevStatus(widget.index);
                          },
                          color: (controller.carList[widget.index].isFev)
                              ? Colors.red
                              : Colors.white);
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                //company name
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildDetails("Company Name",
                              widget.bestCar.comapnyName, false, context),
                          buildDetails("Model Name", widget.bestCar.modelName,
                              false, context),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildDetails("Colors Available",
                              widget.bestCar.approxCost, true, context),
                          buildDetails("Approx. Cost",
                              widget.bestCar.approxCost, false, context),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildDetails(
                              specsNameList[0], specsList[0], false, context),
                          buildDetails(
                              specsNameList[1], specsList[1], false, context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildDetails(
      String title, String name, bool isColors, dynamic context) {
    var availableColors = [];
    if (isColors) {
      availableColors = widget.bestCar.availableColors.values.toList();
    }
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: HexColor('#FF6161'),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: HexColor('#FF3434'),
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 35,
            height: 5,
            color: HexColor('#FF3434'),
          ),
          SizedBox(
            height: 15,
          ),
          isColors
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var a = 0; a < availableColors.length; a++)
                      Container(
                        width: 30,
                        height: 30,
                        color: HexColor(availableColors[a]),
                      ),
                  ],
                )
              : Text(
                  name,
                  style: Theme.of(context).textTheme.headline4,
                ),
        ],
      ),
    );
  }
}

class BuildGoToStore extends StatelessWidget {
  const BuildGoToStore({
    this.bestCar,
    this.width,
  });

  final BestCar bestCar;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String url = bestCar.nearbyStore;
        await canLaunch(url)
            ? await launch(url)
            : throw 'Could not launch $url';
      },
      child: Container(
        width: width,
        height: 60,
        color: HexColor('#FFD1D1'),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Go to Store',
                style: TextStyle(
                  color: HexColor('#FF6161'),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.place,
                color: HexColor('#FF6161'),
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
