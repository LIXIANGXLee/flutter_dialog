import 'package:flutter/material.dart';

/// 弹窗工具类
class ManagerUtils {
  /// 显示中间弹窗
  static void showCenterDialog(BuildContext context, Widget widget) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return widget;
        });
  }

  ///显示底部弹窗
  static void showBottomDialog(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return widget;
      },
    );
  }

  ///返回上一页面
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  ///push跳到下一页面
  static Future push(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
