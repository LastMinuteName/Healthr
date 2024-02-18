import 'package:flutter/cupertino.dart';

class ProductAddModel with ChangeNotifier {
  final brandNameController = TextEditingController();
  final productNameController = TextEditingController();
  final bool organicValue = false;
}