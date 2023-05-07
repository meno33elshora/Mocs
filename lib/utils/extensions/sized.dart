import 'package:flutter/cupertino.dart';

extension SizedX on num{
  SizedBox get ph => SizedBox(height: toDouble(),);
  SizedBox get pw => SizedBox(width: toDouble(),);
}