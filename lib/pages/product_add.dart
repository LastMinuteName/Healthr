import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _ProductAddModel with ChangeNotifier {
  final productNameController = TextEditingController();
}

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a category"),
      ),
      body: ChooseCategory(),
    );
  }
}

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("test"),
    );
  }
}