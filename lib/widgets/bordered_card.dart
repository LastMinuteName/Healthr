import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderedCard extends StatelessWidget {
  BorderedCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.height,
    this.width,
    this.radius,
    this.onTap,
    this.trailing,
    this.borderColor,
  });

  String title;
  String? subtitle;
  IconData? icon;
  double? height;
  double? width;
  double? radius;
  Widget? trailing;
  VoidCallback? onTap;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = radius != null ? BorderRadius.all(Radius.circular(radius!)) : BorderRadius.zero;

    borderColor ??= Theme.of(context).colorScheme.outlineVariant;

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor!,
          ),
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoListTile(
                title: Text(title),
                subtitle: subtitle != null ? Text(subtitle!) : null,
                leading: icon != null ? Icon(icon!) : null,
                trailing: trailing,
              ),
            ]
          ),
        ),
      ),
    );
  }
}