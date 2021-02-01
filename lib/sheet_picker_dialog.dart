import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'manager_utils.dart';

typedef SheetPickerCallBack = void Function(int index, String text);

///用来显示底部弹出 可滚动视图的
class SheetPickerDialog extends StatefulWidget {
  final Text titleText;
  final Text cancelText;
  final Text sureText;

  final List<String> items;
  final SheetPickerCallBack callBack;
  final double height;
  final double itemHeight;
  final Color lineColor;

  SheetPickerDialog({
    @required this.items,
    this.callBack,
    this.titleText,
    this.height = 300,
    this.itemHeight = 44,
    this.cancelText = const Text(
      '取消',
      style: TextStyle(color: Color(0xFF999999), fontSize: 15),
    ),
    this.sureText = const Text(
      '确定',
      style: TextStyle(color: Color(0xFF333333), fontSize: 15),
    ),
    this.lineColor = const Color(0xFFE8E8E8),
  });

  @override
  _SheetPickerDialogState createState() => _SheetPickerDialogState();
}

class _SheetPickerDialogState extends State<SheetPickerDialog> {
  @override
  Widget build(BuildContext context) {
    var selectIndex;
    return Container(
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
              FlatButton(
                child: widget.sureText,
                highlightColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                  if (selectIndex == null && widget.items.length > 0) {
                    selectIndex = 0;
                  }
                  if (widget.callBack != null) {
                    widget.callBack(selectIndex, widget.items[selectIndex]);
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
            child: CupertinoPicker(
              children:
                  widget.items.map((e) => Center(child: Text(e))).toList(),
              onSelectedItemChanged: (index) {
                selectIndex = index;
              },
              itemExtent: widget.itemHeight,
            ),
          ),
        ],
      ),
    );
  }
}
