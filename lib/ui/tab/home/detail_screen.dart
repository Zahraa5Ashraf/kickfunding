import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../models/urgent.dart';
import '../../../../theme/app_color.dart';
import '../widgets/home/calculator_builder.dart';
import 'rate.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.urgent);

  final Urgent urgent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kForthColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        32.r,
                      ),
                      bottomRight: Radius.circular(
                        32.r,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                32.r,
                              ),
                              bottomRight: Radius.circular(
                                32.r,
                              ),
                            ),
                            color: AppColor.kPlaceholder1,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              urgent.assetName,
                              width: 100.w,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                32.r,
                              ),
                              bottomRight: Radius.circular(
                                32.r,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w,
                              vertical: 20.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ...List.generate(
                                      urgent.categories.length,
                                      (index) => Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(
                                              8.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColor.kPlaceholder2,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8.r,
                                              ),
                                            ),
                                            child: Text(
                                              urgent.categories[index],
                                              style: TextStyle(
                                                color: AppColor.kTextColor1,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${urgent.days} Days left',
                                      style: TextStyle(
                                        color: AppColor.kAccentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  urgent.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Spacer(),
                                Text(
                                  'By: ${urgent.organizer}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppColor.kTextColor1,
                                      ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                      width: (1.sw - 36.w) *
                                          double.parse(urgent.percent) /
                                          100,
                                      height: 6.h,
                                      decoration: ShapeDecoration(
                                        shape: const StadiumBorder(),
                                        color: AppColor.kAccentColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: (1.sw - 36.w) *
                                          (100 - double.parse(urgent.percent)) /
                                          100,
                                      height: 6.h,
                                      decoration: ShapeDecoration(
                                        shape: const StadiumBorder(),
                                        color: AppColor.kPlaceholder1,
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Target: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                color: AppColor.kTextColor1,
                                              ),
                                        ),
                                        Text(
                                          '\$${urgent.target}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Remaining: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                color: AppColor.kTextColor1,
                                              ),
                                        ),
                                        Text(
                                          '\$${urgent.remaining}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  urgent.desc,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: AppColor.kTextColor1,
                                        height: 2,
                                      ),
                                ),
                                Spacer(),
                                Container(
                                  child: Row(
                                    children: [
                                      Text('Rate Your Experience:'),
                                      RatingBar.builder(
                                        itemSize: 30,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 30.h,
                ),
                width: double.infinity,
                //  height: 120.h,
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                        ),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        AppColor.kPlaceholder2,
                      ),
                      minimumSize: MaterialStateProperty.all(
                        Size(
                          0,
                          48.h,
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        builder: (_) => CalculatorBuilder(),
                      );
                    },
                    child: Text(
                      'Donate',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top,
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/images/back.svg',
                      width: 24.w,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


/**
 * DRAFT CODE FORE DONATED BY AVATAR ICONS:
 *  child:   Expanded(
                      child: Container(
                          // child: RatingBar.builder(
                          //   initialRating: 3,
                          //   minRating: 1,
                          //   direction: Axis.horizontal,
                          //   allowHalfRating: false,
                          //   itemCount: 5,
                          //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          //   itemBuilder: (context, _) => Icon(
                          //     Icons.star,
                          //     color: Colors.amber,
                          //   ),
                          //   onRatingUpdate: (rating) {
                          //     print(rating);
                          //   },
                          // ),
                          // child: Stack(
                          //   children: [
                          //     Container(
                          //       width: 48.w,
                          //       height: 48.w,
                          //       decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           color: AppColor.kBlue,
                          //           border: Border.all(
                          //             color: AppColor.kForthColor,
                          //             width: 4.sp,
                          //           )),
                          //       child: Center(
                          //         child: SvgPicture.asset(
                          //           'assets/images/image_placeholder.svg',
                          //           width: 16.w,
                          //         ),
                          //       ),
                          //     ),
                          //     Positioned(
                          //       left: 24.w,
                          //       child: Container(
                          //         width: 48.w,
                          //         height: 48.w,
                          //         decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             color: AppColor.kThirdColor,
                          //             border: Border.all(
                          //               color: AppColor.kForthColor,
                          //               width: 4.sp,
                          //             )),
                          //         child: Center(
                          //           child: SvgPicture.asset(
                          //             'assets/images/image_placeholder.svg',
                          //             width: 16.w,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Positioned(
                          //       left: 48.w,
                          //       child: Container(
                          //         width: 48.w,
                          //         height: 48.w,
                          //         decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             color: Colors.white,
                          //             border: Border.all(
                          //               color: AppColor.kForthColor,
                          //               width: 4.sp,
                          //             )),
                          //         child: Center(
                          //           child: Text(
                          //             '99+',
                          //             style: TextStyle(
                          //               color: AppColor.kForthColor,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          ),
                    ),


              /**DRAFT CODE FOR SHARE BUTTON: */
               // GestureDetector(
                  //   onTap: () => showModalBottomSheet(
                  //     context: context,
                  //     isScrollControlled: true,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(32.r),
                  //     ),
                  //     builder: (_) => Padding(
                  //       padding: EdgeInsets.only(
                  //         bottom: MediaQuery.of(context).viewPadding.bottom,
                  //         top: 32.h,
                  //         left: 16.w,
                  //         right: 16.w,
                  //       ),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Text(
                  //             'Share this by...',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .headline6!
                  //                 .copyWith(
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //           ),
                  //           SizedBox(
                  //             height: 8.h,
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: List.generate(
                  //               3,
                  //               (index) => Row(
                  //                 children: [
                  //                   Container(
                  //                     width: 48.w,
                  //                     height: 48.w,
                  //                     decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       color: AppColor.kPlaceholder2,
                  //                     ),
                  //                     child: Center(
                  //                       child: SvgPicture.asset(
                  //                         'assets/images/image_placeholder.svg',
                  //                         width: 24.w,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 16.w,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   child: SvgPicture.asset(
                  //     'assets/images/share.svg',
                  //     width: 24.w,
                  //   ),
                  // )
 */