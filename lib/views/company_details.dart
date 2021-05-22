import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../models/comapany_data_model.dart';
import 'package:expandable/expandable.dart';

class ComapnyDetailsPage extends StatelessWidget {
  final CompanyInfo companyInfo;

  ComapnyDetailsPage({this.companyInfo});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Stack(
                  children: [
                    buildCompanyLogo(),

                    // buildTitleName(context, "Details -"),
                  ],
                ),
                buildCompanyDetails(context),
                buildModelImage(deviceWidth, deviceHeight, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCompanyLogo() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            companyInfo.companyLogo,
            width: 149,
            height: 149,
          ),
        ),
      ],
    );
  }

  Widget buildModelImage(double width, double height, dynamic context) {
    return Column(
      children: [
        SizedBox(height: 25),
        buildTitleName(context, "Models -"),
        Image.asset(
          companyInfo.modelImage,
          width: width,
          height: 250,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildCompanyDetails(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        ExpandableTheme(
          data: ExpandableThemeData(
            iconColor: Colors.white,
            useInkWell: true,
          ),
          child: ExpandablePanel(
            header: buildTitleName(context, "Details -"),
            collapsed: Text(
              companyInfo.details,
              style: Theme.of(context).textTheme.headline5,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              companyInfo.details,
              style: Theme.of(context).textTheme.headline5,
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Align buildTitleName(BuildContext context, String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 50,
            height: 5,
            color: HexColor('#FF3434'),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
    color: Colors.white, //change your color here
  ),
      
      backgroundColor: Theme.of(context).accentColor,
      // leading: Icon(
      //   Icons.menu,
      //   size: 22,
      //   color: Colors.white,
      // ),
      title: Text(
        companyInfo.companyName,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
