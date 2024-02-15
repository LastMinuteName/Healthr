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
  });

  String title;
  String? subtitle;
  IconData? icon;
  double? height;
  double? width;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: radius != null ? BorderRadius.all(Radius.circular(radius!)) : BorderRadius.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoListTile(
              title: Text(title),
              subtitle: Text(subtitle!),
              leading: Icon(icon!),
            ),
          ]
        ),
      ),
    );
  }
}