import 'package:nano_health_assesment/data/remote/api_service.dart';
import 'package:nano_health_assesment/domain/model/product.dart';

class ProductRepository {
   late ApiService apiService;

  Future<List<Product>> getProducts() async {
      apiService = ApiService();
      final product = await apiService.getProducts();
      return product.map((product) => Product.fromJson(product)).toList();
    }
}