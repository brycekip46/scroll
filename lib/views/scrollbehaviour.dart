import 'package:flutter/material.dart';

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails detail) =>
      child;

  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.linux;

  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
