import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskpro/components/widgets.dart';
import 'package:taskpro/constants/colors.dart';
import 'package:taskpro/constants/strings.dart';
import 'package:provider/provider.dart';
import 'package:taskpro/detail_page.dart';
import 'package:taskpro/home_repository/home_api_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loginAPi();
  }

  List buisnesslist = [];

  loginAPi() async {
    var provider = Provider.of<HomeApiProvider>(context, listen: false);
    await provider.homeApi(AppStrings.businessapi);
    if (!provider.isLoading) {
      var response = provider.home_response;
      if (response != []) {
        var jsonResponse = response as Map<String, dynamic>;
        buisnesslist = jsonResponse["businesses"];
        setState(() {});
        print(buisnesslist);
        print(response);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundcolor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55.0),
            child: AppBar(
              scrolledUnderElevation: 0.0,
              automaticallyImplyLeading: false,
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.backgroundcolor,
              title: const Text(
                "Businesses",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackn,
                    fontFamily: AppStrings.fontname),
              ),
            )),
        body: Consumer<HomeApiProvider>(builder: (context, data, child) {
          return !data.isLoading
              ? Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: buisnesslist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(buisnesslist[index])),
                              );
                            },
                            child: productui(context, buisnesslist[index]));
                      }))
              : Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.purple,
                  size: 100,
                ));
        }));
  }
}
