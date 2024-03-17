import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/camera_capture_icon_button.dart';

class TakeProductPhotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TakeProductPhotoPageState();
}

class _TakeProductPhotoPageState extends State<TakeProductPhotoPage> {
  late List<CameraDescription> _cameras;
  CameraController? controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCamera();
      _showAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        children: [
          cameraView(),
          cameraOverlay(),
        ],
      ),
    );
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        controller!.setFlashMode(FlashMode.off);
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              print(e.code);
              break;
            default:
              print(e.code);
              break;
          }
        }
      });
    } on CameraException catch (e) {
      print('${e.code} ${e.description}');
    }
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.takePhotoDialogueTitle),
        content: Column(
          children: [
            Text(AppLocalizations.of(context)!.takePhotoDialogueMainText),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.takePhotoDialogueButton)),
          ],
        ),
      ),
    );
  }

  Widget cameraOverlay() {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: torchButton(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              AppLocalizations.of(context)!.takePhotoOverlayTitle,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CameraCaptureIconButton(
                size: MediaQuery.of(context).size.width * 0.2,
                callback: () {
                  controller?.takePicture().then((value) => {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        content: Image.file(File(value.path)),
                      ),
                    )
                  });

                  //Directory directory = await getApplicationDocumentsDirectory();
                }
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget torchButton() {
    if (controller != null) {
      return IconButton(
        color: Colors.white,
        icon: ValueListenableBuilder<FlashMode>(
          valueListenable: ValueNotifier<FlashMode>(controller!.value.flashMode),
          builder: (context, state, child) {
            switch (state) {
              case FlashMode.auto:
              case FlashMode.off:
                return const Icon(
                  Icons.flashlight_off,
                  color: Colors.white,
                );
              case FlashMode.torch:
                return const Icon(
                  Icons.flashlight_on,
                  color: Colors.yellow,
                );
              default:
                return const Icon(Icons.add);
            }
          },
        ),
        iconSize: 32.0,
        onPressed: () {
          toggleFlash();
        },
      );
    }

    return const SizedBox();
  }

  void toggleFlash() async {
    if(controller!.value.flashMode == FlashMode.off) {
      await controller?.setFlashMode(FlashMode.torch);
    }
    else {
      await controller?.setFlashMode(FlashMode.off);
    }
    setState(() {});
  }

  Widget cameraView() {
    if (controller != null) {
      if (controller!.value.isInitialized) {
        //Scaling implementation is from https://stackoverflow.com/questions/56735552/how-to-set-flutter-camerapreview-size-fullscreen
        //TODO: Understand how the CustomClipper class works before implementing
        final scale = 1 / (controller!.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
        return Transform.scale(
          scale: scale,
          alignment: Alignment.topCenter,
          child: CameraPreview(controller!),
        );
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}