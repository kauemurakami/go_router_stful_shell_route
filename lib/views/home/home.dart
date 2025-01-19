import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stful_shell_go_router/models/product_model.dart';
import 'package:stful_shell_go_router/views/home/widgets/product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ProductWidget(
            productModel: ProductModel(id: index, name: 'Product $index', value: Random().nextDouble() * 15),
          ),
        ),
      ),
    );
  }
}
