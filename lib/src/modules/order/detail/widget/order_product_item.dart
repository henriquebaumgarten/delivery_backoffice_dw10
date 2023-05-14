import 'package:flutter/material.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/style/text_styles.dart';
import '../../../../dto/order/order_product_dto.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductDto orderproduct;
  const OrderProductItem({super.key, required this.orderproduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              orderproduct.product.name,
              style: context.textStyle.textRegular,
            ),
          ),
          Text(
            '${orderproduct.amount}',
            style: context.textStyle.textRegular,
          ),
          Expanded(
            child: Text(
              orderproduct.totalprice.currencyPTBR,
              style: context.textStyle.textRegular,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
