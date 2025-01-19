import 'package:flutter/material.dart';
import 'package:stful_shell_go_router/models/product_model.dart';
import 'package:stful_shell_go_router/routes/delegate.dart';
import 'package:stful_shell_go_router/routes/routes.dart';
import 'package:stful_shell_go_router/utils/setup_locator.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getIt<MyGoRouterDelegate>()
          .router
          .pushNamed(AppRoutes.productName, pathParameters: {'id': productModel.id.toString()}),
      child: Container(
        decoration:
            BoxDecoration(color: Colors.blue.shade100, borderRadius: const BorderRadius.all(Radius.circular(6.0))),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 16.0,
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * .13,
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'name: ${productModel.name}',
                style: ts,
              ),
              Text('value: ${productModel.value.toStringAsFixed(2)}', style: ts),
              Text('id: ${productModel.id}', style: ts),
            ],
          ),
        ),
      ),
    );
  }
}

const TextStyle ts = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
