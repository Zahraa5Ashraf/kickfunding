import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../bloc/swap/swap_bloc.dart';
import '../../../../models/result.dart';
import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import 'percentage_indicator.dart';

class CharityCard extends StatefulWidget {
  const CharityCard(this.result);

  final Result result;

  @override
  State<CharityCard> createState() => _CharityCardState();
}

class _CharityCardState extends State<CharityCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<SwapBloc>(context).add(SetDetail(true));
      },
      child: Container(
        height: 340.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.kPlaceholder1,
                offset: Offset(0, 4),
                blurRadius: 15,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.kPlaceholder1,
                        image: DecorationImage(
                            image: NetworkImage(widget.result.assetName),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        bottom: 8.w,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColor.kForthColor,
                          ),
                          child: Text(
                            '${widget.result.category}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                bottom: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                    ),
                    child: Text(
                      '${widget.result.title}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: AppColor.kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '\$${widget.result.remaining}',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColor.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            'Remaining',
                            style: TextStyle(
                              color: AppColor.kTextColor1,
                            ),
                          ),
                        ],
                      ),
                      PercentageIndicatior(
                        percentage: '${widget.result.percent}',
                      ),
                      Column(
                        children: [
                          Text(
                            '\$${widget.result.target}',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: AppColor.kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Text(
                            'Target',
                            style: TextStyle(
                              color: AppColor.kTextColor1,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
