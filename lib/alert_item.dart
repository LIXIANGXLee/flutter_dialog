
import 'package:flutter/material.dart';

class AlertItem {
  /// 文本
  final Text text;

  /// 回调
  final Function callBack;

  AlertItem({@required this.text, this.callBack});
}
