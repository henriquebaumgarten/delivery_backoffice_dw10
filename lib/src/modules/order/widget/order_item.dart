import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/style/text_styles.dart';
import '../../../models/orders/order_model.dart';
import '../order_controller.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<OrderController>().showDetailModal(order);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('Pedido Nº ', style: context.textStyle.textExtraBold),
                    Text('${order.id}', style: context.textStyle.textExtraBold),
                    Expanded(
                      child: Text(
                        order.status.name,
                        textAlign: TextAlign.end,
                        style: context.textStyle.textExtraBold
                            .copyWith(color: order.status.color, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                      height: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
