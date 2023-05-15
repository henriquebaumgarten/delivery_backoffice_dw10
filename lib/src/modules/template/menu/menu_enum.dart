enum Menu {
  paymentType(
    '/payment-types/',
    'payment_type_ico.png',
    'payment_type_ico_selected.png',
    'Administrar Forma de Pagamento',
  ),
  products(
    '/products/',
    'product_ico.png',
    'product_ico_selected.png',
    'Administrar Produto',
  ),
  orders(
    '/orders/',
    'order_ico.png',
    'order_ico_selected.png',
    'Pedidos do Dia',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(this.route, this.assetIcon, this.assetIconSelected, this.label);
}
