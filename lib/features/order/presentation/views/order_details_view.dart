import 'package:flutter/material.dart';

import '../../data/models/order_model.dart';
import '../widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView(
      {super.key, required this.orderData, this.isNotify = false});
  final OrderModel orderData;
  final bool isNotify;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderDetailsViewBody(orderData: orderData, isNotify: isNotify),
    );
  }
}
