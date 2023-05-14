import 'package:flutter/material.dart';

import '../../../../core/ui/style/text_styles.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({super.key});

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
              'xtudo',
              style: context.textStyle.textRegular,
            ),
          ),
          Text(
            '1',
            style: context.textStyle.textRegular,
          ),
          Expanded(
            child: Text(
              '100',
              style: context.textStyle.textRegular,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
