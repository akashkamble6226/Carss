import 'package:carss/controllers/car_detail_page_controller.dart';
import 'package:carss/models/best_car_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/company_dummy_data.dart';

import '../views/company_details.dart';
import 'car_details.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawer(context, deviceHeight, deviceWidth),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionName(context, "Legendary Companies", true, false),
              BuildLegendaryCompanies(),
              buildSectionName(context, "Best Cars", false, true),
              BuildBestCars(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).accentColor,
      leading: GestureDetector(
        onTap: () => scaffoldKey.currentState.openDrawer(),
        child: Icon(
          Icons.menu,
          size: 22,
          color: Colors.white,
        ),
      ),
      title: Text('Carss', style: Theme.of(context).textTheme.headline1),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 22,
          ),
        ),
      ],
    );
  }

  Drawer buildDrawer(
      BuildContext context, double deviceHeight, double deviceWidth) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              height: 150,
              width: deviceWidth,
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.login,
                size: 25,
                color: Colors.white,
              ),
              title: Text(
                'Login',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                Get.to(LoginPage());
                // Get.snackbar(
                //   'Login',
                //   'you can login',
                //   snackPosition: SnackPosition.BOTTOM,
                //   colorText: Colors.white,
                //   backgroundColor: Theme.of(context).accentColor,
                // );
              },
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).accentColor,
            ),
            ListTile(
              trailing: Icon(
                Icons.favorite_border,
                size: 25,
                color: Colors.white,
              ),
              title: Text(
                'Favorites',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                // Get.snackbar(
                //   'Login',
                //   'you can login',
                //   snackPosition: SnackPosition.BOTTOM,
                //   colorText: Colors.white,
                //   backgroundColor: Theme.of(context).accentColor,
                // );
              },
            ),

            Divider(
              thickness: 1,
              color: Theme.of(context).accentColor,
            ),
            ListTile(
              trailing: Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              ),
              title: Text(
                'Logout',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                // Get.snackbar(
                //   'Login',
                //   'you can login',
                //   snackPosition: SnackPosition.BOTTOM,
                //   colorText: Colors.white,
                //   backgroundColor: Theme.of(context).accentColor,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionName(
      BuildContext context, String title, bool fromTop, bool toBottom) {
    return Column(
      children: [
        fromTop
            ? Padding(
                padding: EdgeInsets.only(top: 10),
              )
            : Padding(
                padding: EdgeInsets.only(top: 0),
              ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        toBottom
            ? Padding(
                padding: EdgeInsets.only(bottom: 15),
              )
            : Padding(
                padding: EdgeInsets.only(bottom: 0),
              ),
      ],
    );
  }
}

class BuildBestCars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CarDetailPageController carListController =
        Get.put(CarDetailPageController());

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: Obx(() {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: carListController.carList.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => CarDetails(
                        bestCar: carListController.carList[index],
                        index: index,
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Hero(
                      tag: carListController.carList[index],
                      child: Image.asset(
                        bestCars[index].img,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class BuildLegendaryCompanies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  // height of card
                  height: 120,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: companies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            SizedBox(width: 25),
                            buildSingleCompanyCard(
                                index, width, height, context),
                            SizedBox(width: 10),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSingleCompanyCard(
      int ind, dynamic width, dynamic height, dynamic context) {
    var company = companies[ind];

    return GestureDetector(
      onTap: () {
        Get.to(() => ComapnyDetailsPage(
              companyInfo: company,
            ));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width * 0.8,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      company.companyName,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Founder: " + company.founderName,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 50,
                      height: 3,
                      color: HexColor('#FF3434'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              company.companyHeadquart,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: () async {
                            String url = company.nearbyStore;
                            await canLaunch(url)
                                ? await launch(url)
                                : throw 'Could not launch $url';
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Store",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: -25,
            top: 20,
            bottom: 20,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  company.companyLogo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
