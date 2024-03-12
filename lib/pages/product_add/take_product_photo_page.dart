import 'package:flutter/cupertino.dart';

class TakeProductPhotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TakeProductPhotoPageState();
}

class _TakeProductPhotoPageState extends State<TakeProductPhotoPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showAlertDialog(context);
    });
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Lorem Ipsum'),
        content: const Text('Proceed with destructive action?'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}