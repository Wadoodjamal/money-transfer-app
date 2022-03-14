import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsButton extends StatelessWidget {
  const TransactionsButton({
    Key? key,
    this.callback,
  }) : super(key: key);

  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(26),
        right: ScreenUtil().setWidth(24),
        bottom: ScreenUtil().setHeight(32),
      ),
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(6),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().radius(35),
                ),
              )),
              padding: MaterialStateProperty.all(
                EdgeInsets.only(
                  left: ScreenUtil().setWidth(39),
                  right: ScreenUtil().setWidth(33),
                  top: ScreenUtil().setHeight(17),
                  bottom: ScreenUtil().setHeight(17),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: Theme.of(context).textTheme.button!.fontFamily,
                  fontSize: ScreenUtil().setSp(25),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil().setHeight(18),
              )
            ],
          )),
    );
  }
}
