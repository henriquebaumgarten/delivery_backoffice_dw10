import 'package:flutter/material.dart';

enum OrderStatus {
  pendente('Pendente', 'P', Colors.blue),
  confirmado('Confirmado', 'C', Colors.green),
  finalizado('Finalizado', 'F', Colors.black),
  cancelado('Cancelado', 'R', Colors.red),
  ;

  final String name;
  final String acroym;
  final Color color;

  const OrderStatus(this.name, this.acroym, this.color);

  static OrderStatus parse(String acroym) {
    return values.firstWhere((s) => s.acroym == acroym);
  }
}
