import 'package:flutter/material.dart';

import 'alert_item.dart';

class SheetBottomDialog extends StatefulWidget {
  final List<AlertItem> items;
  final Text titleText;
  final double titleHeight;
  final double itemHeight;
  final AlertItem cancelItem;
  final Color bgColor;
  final Color itemColor;
  final double cancelTop;
  final Color cancelItemColor;
  final Color lineColor;

  SheetBottomDialog({
    @required this.items,
    this.cancelItem,
    this.titleText,
    this.titleHeight = 50,
    this.itemHeight = 50,
    this.bgColor = const Color(0xFFE8E8E8),
    this.lineColor = const Color(0xFFE8E8E8),
    this.itemColor = Colors.white,
    this.cancelTop = 8,
    this.cancelItemColor = Colors.white,
  });

  @override
  _SheetBottomDialogState createState() => _SheetBottomDialogState();
}

class _SheetBottomDialogState extends State<SheetBottomDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
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
                    color: widget.itemColor,
                    border: Border(
                      bottom: BorderSide(
                        color: widget.lineColor,
                      ),
                    ),
                  ))
              : Container(),
          Container(
            color: widget.itemColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.items.map((item) {
                int index = widget.items.indexOf(item);
                return GestureDetector(
                  onTap: () {
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
                  child: Padding(
                    padding: EdgeInsets.only(top: widget.cancelTop),
                    child: Container(
                      color: widget.itemColor,
                      height: widget.itemHeight,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: widget.cancelItem.text,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (widget.cancelItem.callBack != null) {
                      widget.cancelItem.callBack();
                    }
                  },
                ),
          Container(
            color: widget.itemColor,
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}
