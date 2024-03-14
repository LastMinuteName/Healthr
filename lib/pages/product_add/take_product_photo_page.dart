import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:camera/camera.dart';

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

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller?.initialize().then((_) {
        if (!mounted) {
          return;
        }
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          cameraView(),
        ],
      ),
    );
  }

  Widget cameraView() {
    if (controller != null) {
      if (controller!.value.isInitialized) {
        final scale = 1 / (controller!.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
        return Transform.scale(
          scale: scale,
          alignment: Alignment.topCenter,
          child: CameraPreview(controller!),
        );
        //return CameraPreview(controller!);
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}