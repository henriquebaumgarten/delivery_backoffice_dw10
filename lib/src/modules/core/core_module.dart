import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storege/session_storage.dart';
import '../../core/storege/storage.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<Storage>((i) => SessionStorage(), export: true),
        Bind.lazySingleton((i) => CustomDio(i()), export: true),
        Bind.lazySingleton<PaymentTypeRepository>((i) => PaymentTypeRepositoryImpl(i()), export: true),
      ];
}