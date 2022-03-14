import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMakeSchedule extends StatefulWidget {
  const PaymentMakeSchedule({
    Key? key,
  }) : super(key: key);

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
              text: 'Your total balance',
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
              text: '\$ 6,290,000',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              leftPadding: ScreenUtil().setWidth(18),
              rightPadding: ScreenUtil().setWidth(100),
              fontColor: Theme.of(context).primaryColor,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PaymentButtons(
                  text: 'Make a payment',
                  leftPadding: ScreenUtil().setWidth(14),
                  rightPadding: ScreenUtil().setWidth(14),
                  topPadding: ScreenUtil().setHeight(16),
                  bottomPadding: ScreenUtil().setHeight(28),
                  callback: () => Navigator.pushNamed(context, '/Transfer'),
                ),
                PaymentButtons(
                  text: 'Payment Schedule',
                  rightPadding: ScreenUtil().setWidth(24),
                  topPadding: ScreenUtil().setHeight(16),
                  bottomPadding: ScreenUtil().setHeight(28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentButtons extends StatefulWidget {
  const PaymentButtons({
    Key? key,
    this.leftPadding,
    this.rightPadding,
    this.bottomPadding,
    this.topPadding,
    this.text,
    this.callback,
  }) : super(key: key);

  final double? leftPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final double? topPadding;
  final String? text;
  final VoidCallback? callback;

  @override
  State<PaymentButtons> createState() => _PaymentButtonsState();
}

class _PaymentButtonsState extends State<PaymentButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.leftPadding != null ? widget.leftPadding! : 0,
        right: widget.rightPadding != null ? widget.rightPadding! : 0,
        top: widget.topPadding != null ? widget.topPadding! : 0,
        bottom: widget.bottomPadding != null ? widget.bottomPadding! : 0,
      ),
      child: ElevatedButton(
        onPressed: widget.callback,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.only(
              left: ScreenUtil().setWidth(12),
              right: ScreenUtil().setWidth(10),
              top: ScreenUtil().setHeight(8),
              bottom: ScreenUtil().setHeight(8),
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().radius(20),
              ),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        child: Text(
          widget.text!,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: ScreenUtil().setSp(12),
            color: Colors.white,
          ),
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
