import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculateGrid extends StatefulWidget {
  const CalculateGrid({
    Key? key,
    this.items,
    this.callback,
    this.func,
  }) : super(key: key);

  final List? items;
  final VoidCallback? callback;
  final Function(String)? func;

  @override
  State<CalculateGrid> createState() => _CalculateGridState();
}

class _CalculateGridState extends State<CalculateGrid> {
  bool _isString = true;

  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(42),
          right: ScreenUtil().setWidth(42),
          bottom: ScreenUtil().setHeight(70)),
      child: GridView.builder(
        itemCount: widget.items!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          if (index == 11) {
            _isString = false;
          } else {
            _isString = true;
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(20)),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: _isString
                    ? MaterialStateProperty.all(
                        const Color.fromARGB(255, 245, 246, 250),
                      )
                    : MaterialStateProperty.all(Theme.of(context).primaryColor),
                fixedSize: MaterialStateProperty.all(
                  Size(
                    ScreenUtil().setHeight(89),
                    ScreenUtil().setWidth(70),
                  ),
                ),
              ),
              onPressed: index == 11
                  ? widget.callback
                  : () {
                      widget.func!(widget.items![index].toString());
                    },
              child: _isString
                  ? Text(
                      '${widget.items![index]}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Icon(
                      Icons.arrow_forward_outlined,
                      size: ScreenUtil().setHeight(24),
                      color: Colors.white,
                    ),
            ),
          );
        },
      ),
    );
  }
}
