import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nano_health_assesment/domain/model/product.dart';



@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded({ required this.products,});
}
class ProductsError extends ProductsState {}