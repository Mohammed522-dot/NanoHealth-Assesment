import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/Product.dart';


@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  ProductsLoaded({ required this.products,});
}
class ProductsError extends ProductsState {}