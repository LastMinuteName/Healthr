import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraCaptureIconButton extends StatelessWidget {
  CameraCaptureIconButton ({
    super.key,
    this.size = 128.0,
    this.callback,
  });

  double size;
  VoidCallback? callback;

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            CupertinoIcons.circle_filled,
            color: Colors.white,
            size: size * 0.7,
          ),
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: size,
            color: Colors.white,
            icon: const Icon(CupertinoIcons.circle),
            onPressed: callback,
          ),
        ],
      ),
    );
  }
}