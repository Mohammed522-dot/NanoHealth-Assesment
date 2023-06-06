import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nano_health_assesment/data/model/Products.dart';


@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Products> products;
  ProductsLoaded({ required this.products,});
}
class ProductsError extends ProductsState {}