import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health_assesment/presentation/blocs/product/ProductsEvent.dart';
import 'package:nano_health_assesment/presentation/blocs/product/ProductsState.dart';
import 'package:nano_health_assesment/presentation/widgets/products_item.dart';

import '../../constant/color.dart';
import '../blocs/product/ProductBloc.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


  @override

class _HomePageState extends State<HomePage> {
    void initState() {
      super.initState();
      getProducts();
    }

    void getProducts() async {
      BlocProvider.of<ProductBloc>(context).add(GetProducts());
    }

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: new Center(
            child: new Text(
              'All Prodects',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor),
            ),
          ),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
         body:buildProductList()
      );
    }

    Widget buildProductList() {
      return BlocBuilder<ProductBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: state.products[index],
                  );
                },
              );
            }
            return const Center(
            child: CircularProgressIndicator());
          });
    }
  }