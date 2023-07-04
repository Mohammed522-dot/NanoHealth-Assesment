import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_assesment/domain/model/product.dart';


import '../../constant/color.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}
class _DetailsPageState extends State<DetailsPage> {


  Widget buildSliverAppBar() {
    return SliverAppBar(
      systemOverlayStyle:
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 275.0,
      backgroundColor: Colors.white,
      elevation: 0.0,

      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          widget.product.image,
          fit: BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: 40.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),

      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(child: Icon(Icons.arrow_back_rounded,color: Colors.black,)),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: appBgColor,
                    elevation: 20),
              ),
            ),
          ),
          SizedBox(width: 350),
          Spacer(),
          SizedBox(
            height: 40,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
              },
              child: const Center(child: Icon(Icons.more_vert,color: Colors.black,)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: appBgColor,
                  elevation: 20),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          Container(
            child: SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    child: Column(
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.keyboard_arrow_up_outlined,color: primary,)
                            //image: Icon(Icons.arrow_drop_down_circle),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 60,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                    'assets/icons/upload.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: appBgColor,
                                      elevation: 20),
                                ),
                              ),

                              Spacer(),
                              Container(
                                width: 250,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Order Now'),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: primary,
                                      padding: const EdgeInsets.fromLTRB(10, 0, 15, 0)),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.black38, fontStyle: FontStyle.italic),
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                widget.product.description,
                                style: const TextStyle(
                                    color: Colors.black38, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey[400],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Reviews (${widget.product.rating.count})'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${widget.product.rating.rate}',
                                        style: const TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      RatingBar.builder(
                                        initialRating: widget.product.rating.rate,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemSize: 40,
                                        itemCount: 5,
                                        itemPadding:
                                        const EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  )
                ])),
          )
        ],
      ),
    );
  }
}