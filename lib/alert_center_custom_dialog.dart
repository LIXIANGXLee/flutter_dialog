import 'package:flutter/material.dart';
import 'alert_item.dart';

/// 中间弹出层UI界面 可以自定义
class AlertCenterCustomDialog extends StatefulWidget {
  final Widget child;
  final double alertItemTop;
  final List<AlertItem> alertItems;
  final double alertItemHeight;
  final Color alertItemLineColor;
  final Color bgColor;
  final double width;
  final double radius;

  AlertCenterCustomDialog(
      {@required this.child,
      this.alertItemTop = 20,
      @required this.alertItems,
      this.alertItemHeight = 44,
      this.alertItemLineColor = const Color(0xFFE8E8E8),
      this.radius = 10,
      this.bgColor = Colors.white,
      this.width = 260});

  @override
  _AlertCenterCustomDialogState createState() =>
      _AlertCenterCustomDialogState();
}

class _AlertCenterCustomDialogState extends State<AlertCenterCustomDialog> {
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
                widget.child,
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
                                  color: index == widget.alertItems.length - 1
                                      ? Colors.transparent
                                      : widget.alertItemLineColor,
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
