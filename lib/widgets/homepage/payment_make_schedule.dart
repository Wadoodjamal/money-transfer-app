import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMakeSchedule extends StatefulWidget {
  const PaymentMakeSchedule({
    Key? key,
    this.transactions,
  }) : super(key: key);

  final int? transactions;

  @override
  State<PaymentMakeSchedule> createState() => _PaymentMakeScheduleState();
}

class _PaymentMakeScheduleState extends State<PaymentMakeSchedule> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenUtil().setHeight(180),
      left: ScreenUtil().setWidth(32),
      right: ScreenUtil().setWidth(28),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: ScreenUtil().radius(3),
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(-6, 6),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            ScreenUtil().radius(34),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithPadding(
              text: 'Total Transactions Balance',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              leftPadding: ScreenUtil().setWidth(18),
              rightPadding: ScreenUtil().setWidth(100),
              topPadding: ScreenUtil().setHeight(24),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(263),
                right: ScreenUtil().setWidth(36),
              ),
              child: const Icon(
                Icons.more_horiz,
              ),
            ),
            TextWithPadding(
              text: '\$ ${widget.transactions}',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              leftPadding: ScreenUtil().setWidth(18),
              rightPadding: ScreenUtil().setWidth(100),
              bottomPadding: ScreenUtil().setHeight(30),
              fontColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class TextWithPadding extends StatelessWidget {
  const TextWithPadding({
    Key? key,
    this.leftPadding,
    this.rightPadding,
    this.bottomPadding,
    this.topPadding,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    this.fontColor,
  }) : super(key: key);

  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final double? topPadding;
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding != null ? leftPadding! : 0,
        right: rightPadding != null ? rightPadding! : 0,
        top: topPadding != null ? topPadding! : 0,
        bottom: bottomPadding != null ? bottomPadding! : 0,
      ),
      child: Text(
        text!,
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.button!.fontFamily,
          fontSize: ScreenUtil().setSp(fontSize!),
          fontWeight: fontWeight!,
          fontStyle: FontStyle.normal,
          color:
              fontColor != null ? Theme.of(context).primaryColor : Colors.black,
        ),
      ),
    );
  }
}
