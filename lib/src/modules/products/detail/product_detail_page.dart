import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/env/env.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/style/text_styles.dart';

class ProductDetailPage extends StatefulWidget {
  final int? productId;

  const ProductDetailPage({super.key, this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final widthButtonAction = context.percentWidht(.4);
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.productId != null ? 'Alterar' : 'Adicionar'} produto',
                      textAlign: TextAlign.center,
                      style: context.textStyle.texTitle.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          '${Env.instance.get('backend_base_url')}/storage/mclumygt_jrs_1682022574279.jpg',
                          width: 200,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(.9)),
                          onPressed: () {},
                          child: Text('Adicionar'),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(label: Text('Nome')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Preço'),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter(moeda: true)
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: null,
                decoration: InputDecoration(
                  label: Text('Descrição'),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: widthButtonAction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: widthButtonAction / 2,
                        height: 60,
                        padding: EdgeInsets.all(5),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red)),
                          onPressed: () {},
                          child: Text(
                            'Deletar',
                            style: context.textStyle.textBold
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                        width: widthButtonAction / 2,
                        height: 60,
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Salvar',
                            style: context.textStyle.textBold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
