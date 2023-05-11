import 'package:flutter/material.dart';

import '../style/text_styles.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChange;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool addButton;
  final Widget? filterWidget;

  const BaseHeader({
    super.key,
    required this.title,
    this.searchChange,
    required this.buttonLabel,
    this.buttonPressed,
    this.addButton = true,
    this.filterWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Wrap(
          children: [
            Visibility(
              visible: filterWidget == null,
              replacement: filterWidget ?? const SizedBox.shrink(),
              child: SizedBox(
                width: constrains.maxWidth * .15,
                child: TextFormField(
                  onChanged: searchChange,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(
                      Icons.search,
                      size: constrains.maxWidth * .02,
                    ),
                    label: Text(
                      'Buscar',
                      style: context.textStyle.textRegular.copyWith(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: constrains.maxWidth * .65,
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: context.textStyle.texTitle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
              ),
            ),
            Visibility(
              visible: addButton,
              child: SizedBox(
                width: constrains.maxWidth * .15,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: buttonPressed,
                  icon: Icon(
                    Icons.add,
                    size: constrains.maxWidth * .02,
                  ),
                  label: Text(buttonLabel),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
