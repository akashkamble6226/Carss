// const bestCars = const [
//   "assets/images/bs1.png",
//   "assets/images/bs2.png",
//   "assets/images/bs3.png",
//   "assets/images/bs4.png",
//   "assets/images/bs5.png",
//   "assets/images/bs6.png",
//   "assets/images/bs7.png",
//   "assets/images/bs8.png",
// ];

import 'package:flutter/foundation.dart';

class BestCar with ChangeNotifier{
  final String comapnyName;
  final String modelName;
  final Map<String, String> availableColors;
  final String approxCost;
  final Map<String, String> specifications;
  bool isFev;
  final String img;
  final String nearbyStore;

  BestCar({
    this.approxCost,
    this.availableColors,
    this.comapnyName,
    this.isFev,
    this.modelName,
    this.specifications,
    this.img,
    this.nearbyStore,
  });

 


}
