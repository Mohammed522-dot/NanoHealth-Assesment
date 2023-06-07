import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:nano_health_assesment/presentation/blocs/ProductsState.dart';
import '../../data/model/Product.dart';
import 'ProductsEvent.dart';

class ProductBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProducts) {
          emit(ProductsLoading());
          Response response = await get(
              Uri.parse('https://fakestoreapi.com/products'),

          );
          if(response.statusCode == 200){
            final json = jsonDecode(response.body);
            // final parsed = jsonDecode(response.body).cast<String, dynamic>();
            var data = List<Product>.from(json.map((x) => Product.fromJson(x)));
            print(data);
            emit(ProductsLoaded(products: data));
          }
          else {
            final error = jsonDecode(response.body);
            await error['errors']['en'];
            emit(ProductsError());
            print(error);
          }
        }
    });
  }
}