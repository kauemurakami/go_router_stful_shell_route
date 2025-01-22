import 'package:flutter/material.dart';
import 'package:stful_shell_go_router/routes/delegate/delegate.dart';
import 'package:stful_shell_go_router/utils/functions/setup_locator.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});
  //get id in current state of the router
  final int id = int.parse(getIt<MyGoRouterDelegate>().router.state!.pathParameters['id']!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [BackButton()],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Product view id via path params : $id'),
            ),
          ],
        ),
      ),
    );
  }
}
