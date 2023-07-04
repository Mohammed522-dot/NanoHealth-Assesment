import 'package:bloc/bloc.dart';
import 'package:nano_health_assesment/domain/model/product.dart';
import 'package:nano_health_assesment/domain/repository/product_repository.dart';
import 'package:nano_health_assesment/presentation/blocs/product/ProductsState.dart';

import 'ProductsEvent.dart';

class ProductBloc extends Bloc<ProductsEvent, ProductsState> {
  late ProductRepository productRepository;
  late List<Product> product=[];
  ProductBloc() : super(ProductsInitial()) {
    on<ProductsEvent>(_fetchProducts);
  }
  Future<dynamic> _fetchProducts(ProductsEvent event, Emitter<ProductsState> emit) async {
    if(event is GetProducts) {
      emit(ProductsLoading());
      productRepository = ProductRepository();
      await productRepository.getProducts()
          .then((product) {
        emit(ProductsLoaded(products: product));
      });
    }
  }
}