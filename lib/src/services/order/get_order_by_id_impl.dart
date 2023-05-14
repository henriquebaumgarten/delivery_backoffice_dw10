import '../../dto/order/order_dto.dart';
import '../../models/orders/order_model.dart';
import './get_order_by_id.dart';

class GetOrderByIdImpl implements GetOrderById {
  @override
  Future<OrderDto> call(OrderModel order) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
