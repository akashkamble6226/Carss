import 'package:carss/models/best_car_dummy_data.dart';
import 'package:carss/models/best_cars.dart';

import 'package:get/get.dart';

class CarDetailPageController extends GetxController {

  
  //created list of BestCars object
  
  List carList = List<BestCar>.empty(growable: true).obs;

 
  //now adding data

  @override
  void onInit() {
    
    fetchCars();
    super.onInit();
  }

  

  void toggleFevStatus(int index) 
  {

    carList[index].isFev = ! carList[index].isFev;

    update();
    
  }

  // bool showCurrentStatus(index)
  // {
  //   return carList[index].isFev;
  // }

  void fetchCars() {
    for (var a = 0; a < bestCars.length; a++) {
      carList.add(bestCars[a]);
    }
  }
}
