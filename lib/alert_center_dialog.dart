import 'package:flutter/material.dart';

import 'alert_item.dart';

/// 中间弹出层UI界面
class AlertCenterDialog extends StatefulWidget {
  final double titleTop;
  final Text titleText;
  final double contentTop;
  final Text contentText;
  final EdgeInsets contentEdgeInsets;
  final double alertItemTop;
  final List<AlertItem> alertItems;
  final double alertItemHeight;
  final Color alertItemLineColor;
  final Color bgColor;
  final double width;
  final double radius;

  AlertCenterDialog(
      {this.titleTop = 30,
      this.titleText,
      this.contentTop = 20,
      this.contentText,
      this.contentEdgeInsets,
      this.alertItemTop = 20,
      this.alertItems,
      this.alertItemHeight = 44,
      this.alertItemLineColor = const Color(0xFFE8E8E8),
      this.radius = 10,
      this.bgColor = Colors.white,
      this.width = 260});

  @override
  _AlertCenterDialogState createState() => _AlertCenterDialogState();
}

class _AlertCenterDialogState extends State<AlertCenterDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            color: widget.bgColor,
            width: widget.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: widget.titleTop),
                (widget.titleText == null)
                    ? Container()
                    : Container(
                        child: widget.titleText,
                      ),
                SizedBox(height: widget.contentTop),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: widget.contentText,
                ),
                SizedBox(height: widget.alertItemTop),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: widget.alertItemLineColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: widget.alertItems.map((res) {
                      int index = widget.alertItems.indexOf(res);
                      return Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (res.callBack != null) {
                              res.callBack();
                            }
                          },
                          child: Container(
                            height: widget.alertItemHeight,
                            alignment: Alignment.center,
                            child: res.text,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color:index == widget.alertItems.length - 1 ? Colors.transparent : widget.alertItemLineColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
