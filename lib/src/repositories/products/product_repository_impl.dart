import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product_model.dart';
import 'dart:typed_data';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await _dio.auth().put(
        '/products/$id',
        data: {
          'enabled': false,
        },
      );
    } on DioError catch (e, s) {
      log('Erro ao deletar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao deletar produto');
    }
  }

  @override
  Future<List<ProductModel>> findAll(String? name) async {
    try {
      final productResult = await _dio.auth().get(
        '/products',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return productResult.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao busar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao busar produtos');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final productResult = await _dio.auth().get(
            '/products/$id',
          );
      return ProductModel.fromMap(productResult.data);
    } on DioError catch (e, s) {
      log('Erro ao busar produto $id', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao busar produto $id');
    }
  }

  @override
  Future<void> save(ProductModel productModel) async {
    try {
      final client = _dio.auth();
      final data = productModel.toMap();
      if (productModel.id != null) {
        //salva
        client.put('/products/${productModel.id}', data: data);
      } else {
        //insere
        client.post('/products', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto ${productModel.id}', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao salvar produto ${productModel.id}',
      );
    }
  }

  @override
  Future<String> uploadImageProduct(Uint8List file, String filename) async {
    try {
      final formdata = FormData.fromMap(
          {'file': MultipartFile.fromBytes(file, filename: filename)});
      final response = await _dio.auth().post('/uploads', data: formdata);
      return response.data['url'];
    } on DioError catch (e, s) {
      log('Erro ao ao fazer o upload do arquivo', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao ao fazer o upload do arquivo',
      );
    }
  }
}
