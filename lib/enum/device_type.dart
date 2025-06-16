import 'package:flutter/material.dart';

enum DeviceType { compact, medium, expanded }

extension DeviceTypeFromSize on BuildContext {
  DeviceType deviceTypeFromWidth() => MediaQuery.sizeOf(this).width <= 600
      ? DeviceType.compact
      : MediaQuery.sizeOf(this).width <= 840
          ? DeviceType.medium
          : DeviceType.expanded;

  DeviceType deviceTypeFromHeight() => MediaQuery.of(this).size.height <= 480
      ? DeviceType.compact
      : MediaQuery.of(this).size.width <= 900
          ? DeviceType.medium
          : DeviceType.expanded;
}
