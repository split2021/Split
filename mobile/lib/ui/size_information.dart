import 'package:flutter/material.dart';
import '../enums/device_screen_type.dart';

class SizeInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizeInformation(this.orientation, this.deviceScreenType, this.screenSize, this.localWidgetSize);
}