import 'package:carss/controllers/car_detail_page_controller.dart';
import 'package:carss/models/best_cars.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:auto_animated/auto_animated.dart';

import 'car_details.dart';

class FevouritCars extends StatefulWidget {
  @override
  _FevouritCarsState createState() => _FevouritCarsState();
}

class _FevouritCarsState extends State<FevouritCars> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  final CarDetailPageController carDetailPageController = Get.find();

  List fevCarList = List<BestCar>.empty(growable: true).obs;

  @override
  void initState() {
    // TODO: implement initState
    print(carDetailPageController.carList.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Fevourite Cars',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Obx(
        () {
          // if () {
          //   return
          // } else {
          return carDetailPageController.fevCarList.length == 0
              ? Center(
                  child: Text(
                    'No fevourite cars added yet!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )
              : LiveList(
                  scrollDirection: Axis.vertical,
                  itemCount: carDetailPageController.fevCarList.length,

                  // Like ListView.builder, but also includes animation property
                  itemBuilder: (context, index, animate) {
                    return FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(animate),
                      // And slide transition
                      child: SlideTransition(
                        position: animate.drive(_offset),
                        // Paste you Widget
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            
                            onTap: () {
                              Get.to(
                                () => CarDetails(
                                  id: carDetailPageController
                                      .fevCarList[index].id,
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).accentColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Image.asset(
                                        carDetailPageController
                                            .fevCarList[index].img,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,

                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        carDetailPageController
                                            .fevCarList[index].comapnyName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        carDetailPageController
                                            .fevCarList[index].modelName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        carDetailPageController
                                            .fevCarList[index].approxCost,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    ;
                  },
                );
        },
      ),
    );
  }

  // Build animated item (helper for all examples)
  // Widget buildAnimatedItem(
  //   BuildContext context,
  //   int index,
  //   Animation<double> animation,
  // ) =>
  // For example wrap with fade transition

// }

/*

  GestureDetector(
                onTap: () {
                  setState(() {
                    //size increment or decrement logic
                    size = size == 100 ? 250 : 100;
                  });
                },
                child:  AnimatedContainer(
                    curve: Curves.bounceOut,
                    // color: Colors.blue,
                    duration: Duration(milliseconds: 500),
                    child: 
                    AnimatedSize(
                      vsync: this,
                      duration: Duration(milliseconds: 0),
                      child:
                          Column(
                            children: [
                              Image.asset(carDetailPageController.fevCarList[0].img,width: size,height: size,),
                              Image.asset(carDetailPageController.fevCarList[1].img,width: size,height: size,),
                            ],
                          ),
                          // Text(carDetailPageController.fevCarList[index].comapnyName),
                        
                    //   ),
                    // ),
                ),
                  
                ),
              );
  
  */
}
