
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../color.dart';
import '../blocs/ProductBloc.dart';
import '../blocs/ProductsEvent.dart';
import '../blocs/ProductsState.dart';
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
  void getProducts() async{
    BlocProvider.of<ProductBloc>(context)
        .add(GetProducts());
  }
  Widget build(BuildContext context) {
    Widget star(int active) {
      final children = <Widget>[];
      for (var i = 1; i <= 5; i++) {
        if (active <= 5 && active >= 0) {
          children.add(
            new Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Image.asset(
                i <= active
                    ? 'assets/icons/star_active.png'
                    : 'assets/icons/star.png',
                width: 12,
              ),
            ),
          );
        }
      }
      return new Row(
        children: children,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All Products",style: TextStyle(color: textColor),),),
        backgroundColor: Colors.white70,
        automaticallyImplyLeading: false,


        ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 600,
                child: BlocBuilder<ProductBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoaded) {
                      return ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: state.products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetailsPage(
                                          product: state.products[index],
                                        ),
                                  ),
                                ),
                            child: Container(

                              margin: EdgeInsets.only(right: 0,),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                shadowColor: Colors.grey.withOpacity(0.3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0)),
                                      child: Image.network(

                                              state.products[index].image,
                                          height: 200,
                                          width: 400,
                                          fit: BoxFit.cover),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        state.products[index].title,
                                        style: TextStyle(fontSize: 14,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 5, bottom: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Positioned(
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .end,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 4,
                                              ),
                                              star(state.products[index].rating.rate.toInt()),
                                            ],
                                          ),
                                          //),
                                        ],
                                      ),
                                    ),

                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}