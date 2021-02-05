import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'manager_utils.dart';

typedef SheetDatePickerCallBack = void Function(DateTime dateTime);

enum DatePickerType {
  date,
  time,
  dateAndTime,
}

///用来显示底部弹出 可滚动视图的
class SheetDatePickerDialog extends StatefulWidget {
  final Text titleText;
  final Text cancelText;
  final Text sureText;

  final SheetDatePickerCallBack callBack;
  final double height;
  final double itemHeight;
  final Color lineColor;
  final double radius;
  final DatePickerType type;
  final int minimumYear;
  final int maximumYear;

  SheetDatePickerDialog({
    this.callBack,
    this.titleText,
    this.height = 300,
    this.itemHeight = 44,
    this.radius = 0.0,
    this.cancelText = const Text(
      '取消',
      style: TextStyle(color: Color(0xFF999999), fontSize: 15),
    ),
    this.sureText = const Text(
      '确定',
      style: TextStyle(color: Color(0xFF333333), fontSize: 15),
    ),
    this.lineColor = const Color(0xFFE8E8E8),
    this.type = DatePickerType.dateAndTime,
    this.minimumYear = 2000,
    this.maximumYear = 3000,
  });

  @override
  _SheetDatePickerDialogState createState() => _SheetDatePickerDialogState();
}

class _SheetDatePickerDialogState extends State<SheetDatePickerDialog> {
  DateTime _dateTime;

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(widget.radius),
        topRight: Radius.circular(widget.radius),
      ),
      child: Container(
        height: widget.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: widget.cancelText,
                  onPressed: () {
                    ManagerUtils.pop(context);
                  },
                ),
                widget.titleText == null
                    ? Container()
                    : Expanded(child: Center(child: widget.titleText)),
                FlatButton(
                  child: widget.sureText,
                  highlightColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    if (widget.callBack != null) {
                      widget.callBack(_dateTime);
                    }
                  },
                ),
              ],
            ),
            Divider(
              height: 1,
              color: widget.lineColor,
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                minimumYear: widget.minimumYear,
                maximumYear: widget.maximumYear,
                use24hFormat: true,
                mode: _model(widget.type),
                onDateTimeChanged: (DateTime dateTime) {
                  _dateTime = dateTime;
                },
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  CupertinoDatePickerMode _model(DatePickerType type) {
    if (type == DatePickerType.date) {
      return CupertinoDatePickerMode.dateAndTime;
    } else if (type == DatePickerType.time) {
      return CupertinoDatePickerMode.time;
    } else {
      return CupertinoDatePickerMode.dateAndTime;
    }
  }
}
