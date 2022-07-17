import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard(
      {Key? key,
      this.child,
      this.backgroundColor,
      this.padding,
      this.onPress,
      this.borderRadius})
      : super(key: key);

  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: borderRadius ?? BorderRadius.circular(8)),
          child: child),
    );
  }
}
