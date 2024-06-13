import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskpro/constants/appsizes.dart';
import 'package:taskpro/constants/colors.dart';
import 'package:taskpro/constants/images.dart';
import 'package:taskpro/constants/strings.dart';

productui(context) {
  return Container(
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 1,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 120.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)), //
                image: DecorationImage(
                  image: AssetImage('assets/download.jpeg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Positioned(
                left: 10,
                right: 10,
                top: 10,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Open",
                            style: TextStyle(
                                fontFamily: AppStrings.fontname,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: const EdgeInsets.all(5),
                        //     decoration: BoxDecoration(
                        //         color: Colors.black26,
                        //         borderRadius: BorderRadius.circular(50)),
                        //     child: const Icon(
                        //       Icons.favorite_border_outlined,
                        //       color: Colors.white,
                        //       size: 20,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    gapH32,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                color: Colors.white),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rating) {
                            if (kDebugMode) {
                              print(rating);
                            }
                          },
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Paczka Shell Cafe VEGE",
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: AppStrings.fontname,
                      color: AppColors.blackn,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  "28 Liberty St Fl 60 New York, NY 10005 ",
                  maxLines: 2,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontFamily: AppStrings.fontname,
                      color: AppColors.blackn,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                gapH6,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "15Km",
                      style: TextStyle(
                          fontFamily: AppStrings.fontname,
                          color: AppColors.blackn,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    Text(
                      "PLN23.00",
                      style: TextStyle(
                          fontFamily: AppStrings.fontname,
                          color: AppColors.themecolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )
                  ],
                ),
                gapH12,
              ],
            ))
      ],
    ),
  );
}
