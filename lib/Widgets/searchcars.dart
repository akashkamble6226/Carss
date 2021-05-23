import 'package:carss/models/best_cars.dart';
import 'package:carss/views/car_details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCar extends SearchDelegate {
  final List<BestCar> cars;

  SearchCar({
    this.cars,
  });

  final List<BestCar> previusSearched = [
    BestCar(
      id: 'car1',
      comapnyName: "Lamborghini",
      modelName: 'Aventedor',
      availableColors: {'1': '#7777ee', '2': '#00FF00', '3': '#FF0000'},
      approxCost: '\u{20B9} 7,18,13,280 /-',
      specifications: {'Top speed': '>350 km/h', 'Acceleration': '2.8 s'},
      isFev: false,
      img: 'assets/images/fullwidth/lambAv.png',
      nearbyStore:
          "https://www.google.com/maps?q=lamborghini&rlz=1C1CHBD_enIN944IN944&um=1&ie=UTF-8&sa=X&ved=2ahUKEwiKyf6176LwAhXDbCsKHS43Bp8Q_AUoAHoECAEQCg",
    ),
  ];

  // final cars  = carDetailPageController.carList;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // return Image.asset(bestCar.img);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? previusSearched
        : cars.where((cr) {
            var compName = cr.comapnyName;

            return compName.startsWith(query);
          }).toList();

    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            final suggestion = suggestionList[index].comapnyName;
            return ListTile(
              onTap: () {
                query = suggestion;

                goToDetailsOfCar(query);

                //showResults(context);
              },
              leading: Icon(Icons.car_repair, color: Colors.white),
              title: Text(
                suggestionList[index].comapnyName,
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }

  @override
  String get searchFieldLabel => 'Search Car....';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: Theme.of(context).appBarTheme,
      primaryColor: Theme.of(context).primaryColor,
      accentColor: Theme.of(context).accentColor,
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  void goToDetailsOfCar(String comapnyName) {
    BestCar bestCar;

    //BELOW FOR LOOP FOR GETTING CAR ID
    for (int a = 0; a < cars.length; a++) {
      if (cars[a].comapnyName == query) {
        bestCar = cars[a];
      }
    }

    Get.to(() => CarDetails(id: bestCar.id));
  }
}
