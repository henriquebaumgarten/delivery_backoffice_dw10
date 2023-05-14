import 'package:flutter/material.dart';

import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/style/text_styles.dart';
import 'widget/order_bottom_bar.dart';
import 'widget/order_info_tile.dart';
import 'widget/order_product_item.dart';

class OrderDetailModal extends StatefulWidget {
  const OrderDetailModal({super.key});

  @override
  State<OrderDetailModal> createState() => _OrderDetailModalState();
}

class _OrderDetailModalState extends State<OrderDetailModal> {
  void _closeModal() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidht = context.screenWidth;
    return Material(
      color: Colors.black26,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        child: Container(
          width: screenWidht * (screenWidht > 1200 ? .5 : .7),
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Detalhe do Pedido',
                        style: context.textStyle.texTitle,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: _closeModal,
                        icon: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Nome do cliente',
                      style: context.textStyle.textBold,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Henrique',
                      style: context.textStyle.textRegular,
                    )
                  ],
                ),
                const Divider(),
                ...List.generate(3, (index) => index)
                    .map((e) => const OrderProductItem())
                    .toList(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do Pedido',
                        style: context.textStyle.textExtraBold,
                      ),
                      Text(
                        200.0.currencyPTBR,
                        style: context.textStyle.textExtraBold,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const OrderInfoTile(label: 'Endereço', info: 'Paraju'),
                const Divider(),
                const OrderInfoTile(label: 'Forma de pagamento', info: 'Fiado'),
                const SizedBox(
                  height: 10,
                ),
                const OrderBottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
