import 'package:flutter/material.dart';

import '../../../../core/ui/style/text_styles.dart';

class OrderBottomBar extends StatelessWidget {
  const OrderBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OrderBottomBarButton(
          buttonLabel: 'Finalizar',
          image: 'assets/images/icons/finish_order_white_ico.png',
          buttonColor: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        OrderBottomBarButton(
          buttonLabel: 'Confirmar',
          image: 'assets/images/icons/confirm_order_white_icon.png',
          buttonColor: Colors.green,
          borderRadius: BorderRadius.zero,
        ),
        OrderBottomBarButton(
          buttonLabel: 'Cancelar',
          image: 'assets/images/icons/cancel_order_white_icon.png',
          buttonColor: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}

class OrderBottomBarButton extends StatelessWidget {
  final BorderRadius borderRadius;
  final Color buttonColor;
  final String image;
  final String buttonLabel;

  const OrderBottomBarButton({
    super.key,
    required this.borderRadius,
    required this.buttonColor,
    required this.image,
    required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            side: BorderSide(
              color: buttonColor,
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image),
              const SizedBox(
                width: 5,
              ),
              Text(
                buttonLabel,
                style: context.textStyle.textBold.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
