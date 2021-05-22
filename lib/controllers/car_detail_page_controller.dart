import 'package:carss/models/best_car_dummy_data.dart';
import 'package:carss/models/best_cars.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class CarDetailPageController extends GetxController {
  //created list of BestCars object

  List carList = List<BestCar>.empty(growable: true).obs;

  List fevCarList = List<BestCar>.empty(growable: true).obs;

  //now adding data

  @override
  void onInit() {
    fetchCars();

    // fetfevCars();
    //print(fevCarList.length);

    super.onInit();
  }

  void toggleFevStatus(BestCar bestCar) {
    bestCar.isFev = !bestCar.isFev;

    update();
  }

 

  void fetchCars() {
    for (var a = 0; a < bestCars.length; a++) {
      carList.add(bestCars[a]);
    }
  }

//created and initialized set
// var _tempFevSet = <BestCar>{};
//  fevCarList.add(_tempFevSet.elementAt(index));

  // adding fev car into fav car list
  void addAndRemoveFevCars(String index) {
    final exisitingIndex =
        fevCarList.indexWhere((fevCar) => fevCar.id == index);

    if (exisitingIndex >= 0) {
      fevCarList.removeAt(exisitingIndex);
    } else {
      fevCarList.add(carList.firstWhere((fevC) => fevC.id ==index));
    }
  }

  

}
