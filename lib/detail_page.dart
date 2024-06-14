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
  var data;
  DetailPage(this.data, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _launchCaller() async {
    final Uri url = Uri.parse('tel:${widget.data["phone"]}');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

  _launchURL() async {
    final Uri url = Uri.parse(widget.data["url"]);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    List address = widget.data["location"]["display_address"];
    String fulladdress = "";
    fulladdress = address.join(", ");
    String distance = widget.data["distance"].toStringAsFixed(2);
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
                child: Image.network(
                  widget.data["image_url"],
                  fit: BoxFit.cover,
                )),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                     Expanded(child:    Text(
                          widget.data["name"],
                          maxLines: 1,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),),
                        gapW4,
                        Text(
                          widget.data["price"],
                          maxLines: 1,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    gapH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
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
                          "${distance}KM",
                          maxLines: 1,
                          style: const TextStyle(
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
                          child: Text(
                            widget.data["phone"],
                            style: const TextStyle(
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
                        gapW4,
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            _launchURL();
                          },
                          child: Text(
                            widget.data["url"],
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                fontFamily: AppStrings.fontname,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ))
                      ],
                    ),
                  ],
                )),
            gapH12,
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 17,
                  ),
                  gapW6,
                  Expanded(
                      child: Text(
                    fulladdress,
                    style: const TextStyle(
                        fontFamily: AppStrings.fontname,
                        color: AppColors.blackn,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  )),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rating",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: AppStrings.fontname,
                              color: AppColors.blackn,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        Text(
                          "Total Review: ${widget.data["review_count"].toString()}",
                          style: const TextStyle(
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
                      initialRating: widget.data["rating"],
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
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
            widget.data["transactions"].isNotEmpty
                ? Container(
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
                  )
                : Container(),
            widget.data["transactions"].isNotEmpty
                ? Container(
                    height: 40,
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data["categories"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40))),
                              child: Center(
                                child: Text(
                                  widget.data["categories"][index]["title"],
                                  style: const TextStyle(
                                      fontFamily: AppStrings.fontname,
                                      color: AppColors.blackn,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ));
                        }))
                : Container(),
            widget.data["transactions"].isNotEmpty
                ? Container(
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
                  )
                : Container(),
            widget.data["transactions"].isNotEmpty
                ? Container(
                    height: 40,
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data["transactions"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40))),
                              child: Center(
                                child: Text(
                                  widget.data["transactions"][index],
                                  style: const TextStyle(
                                      fontFamily: AppStrings.fontname,
                                      color: AppColors.blackn,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ));
                        }))
                : Container(),
            gapH12,
          ],
        ),
      ),
    );
  }
}
