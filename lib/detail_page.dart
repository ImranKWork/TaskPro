import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskpro/constants/appsizes.dart';
import 'package:taskpro/constants/colors.dart';
import 'package:taskpro/constants/images.dart';
import 'package:taskpro/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _launchCaller() async {
    final Uri url = Uri.parse('tel:1234567');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        toolbarHeight: 50.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          "Businesses Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.asset(
                                  "assets/download.jpeg",
                                  fit: BoxFit.cover,
                                )),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paczka Shell Cafe VEGE",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                        Text(
                          "\$234",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    gapH12,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Distance",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        Text(
                          "65.7 KM",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Phone Number",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            _launchCaller();
                          },
                          child: const Text(
                            "+91 8754342365",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                fontFamily: AppStrings.fontname,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Website",
                          maxLines: 1,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            _launchURL();
                          },
                          child: const Text(
                            "www.google.com",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                fontFamily: AppStrings.fontname,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            gapH12,
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              color: Colors.white,
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 17,
                  ),
                  gapW6,
                  Text(
                    "26 Rajwada Market Indore",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: AppStrings.fontname,
                        color: AppColors.blackn,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            gapH12,
            Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rating",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          "Total Review: 154",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    gapH12,
                    RatingBar(
                      initialRating: 2,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      ignoreGestures: true,
                      itemSize: 25,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: SvgPicture.asset(
                          AppImages.ratingstar,
                        ),
                        half: SvgPicture.asset(
                          AppImages.starrating,
                          color: Colors.yellow,
                        ),
                        empty: SvgPicture.asset(AppImages.starrating,
                            color: Colors.black),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        if (kDebugMode) {
                          print(rating);
                        }
                      },
                    ),
                    gapH12,
                  ],
                )),
            gapH12,
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: const Text(
                "Category",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: AppStrings.fontname,
                    color: AppColors.blackn,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
            Container(
                height: 40,
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: const Center(
                            child: Text(
                              "Tamatto",
                              style: TextStyle(
                                  fontFamily: AppStrings.fontname,
                                  color: AppColors.blackn,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ));
                    })),
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: const Text(
                "Transaction",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: AppStrings.fontname,
                    color: AppColors.blackn,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
            Container(
                height: 40,
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: const Center(
                            child: Text(
                              "Tamatto",
                              style: TextStyle(
                                  fontFamily: AppStrings.fontname,
                                  color: AppColors.blackn,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ));
                    })),
            gapH12,
          ],
        ),
      ),
    );
  }
}
