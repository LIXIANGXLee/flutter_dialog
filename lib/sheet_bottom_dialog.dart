import 'package:flutter/material.dart';
import 'package:flutter_dialog/flutter_dialog.dart';

import 'alert_item.dart';

class SheetBottomDialog extends StatefulWidget {
  final List<AlertItem> items;
  final Text titleText;
  final double titleHeight;
  final double itemHeight;
  final AlertItem cancelItem;
  final Color bgColor;
  final double cancelTop;
  final Color cancelItemColor;
  final Color lineColor;
  final double radius;

  SheetBottomDialog({
    @required this.items,
    this.cancelItem,
    this.titleText,
    this.titleHeight = 50,
    this.itemHeight = 50,
    this.bgColor = Colors.white,
    this.lineColor = const Color(0xFFE8E8E8),
    this.cancelTop = 8,
    this.cancelItemColor = Colors.white,
    this.radius = 0.0,
  });

  @override
  _SheetBottomDialogState createState() => _SheetBottomDialogState();
}

class _SheetBottomDialogState extends State<SheetBottomDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.radius),
          topRight: Radius.circular(widget.radius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          (widget.titleText != null)
              ? Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: widget.titleHeight,
              child: widget.titleText,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: widget.lineColor,
                  ),
                ),
              ))
              : Container(),
          Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.items.map((item) {
                int index = widget.items.indexOf(item);
                return GestureDetector(
                  onTap: () {
                    ManagerUtils.pop(context);
                    if (item.callBack != null) {
                      item.callBack();
                    }
                  },
                  child: Container(
                    height: widget.itemHeight,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: item.text,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(color: widget.lineColor, width: 1)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          widget.cancelItem == null
              ? Container()
              : GestureDetector(
            child:Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                    top:
                    BorderSide(color: widget.lineColor, width: widget.cancelTop)),
              ),
              height: widget.itemHeight,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: widget.cancelItem.text,
              ),
            ),
            onTap: () {
              ManagerUtils.pop(context);
              if (widget.cancelItem.callBack != null) {
                widget.cancelItem.callBack();
              }
            },
          ),
          Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
