import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health_assesment/data/model/Product.dart';
import 'package:nano_health_assesment/presentation/widgets/custom_button.dart';
import 'package:nano_health_assesment/presentation/widgets/details_appbar.dart';
import 'package:nano_health_assesment/presentation/widgets/order_button.dart';

import '../../color.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}
class _DetailsPageState extends State<DetailsPage> {
@override
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
      body: CustomScrollView(
        slivers: <Widget>[
           DetailAppBar(product: widget.product,),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 8.0),
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                    child: Row(
                      children: [
                        const SizedBox(width: 8.0),

                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 32.0,
                            width: 10.0,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/icons/Vector1.svg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 4.0,
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 32.0,
                            width: 5.0,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                            ),

                          ),
                          OrderButton(innerText: "Order Now", onPressed: (){}, )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: Colors.white, height: 1.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(widget.product.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black45),
                  ),
                  const SizedBox(height: 8.0),
                 Card(
                   color: Colors.grey,
                   child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Review',
                           style: Theme.of(context).textTheme.titleMedium,
                         ),
                         Text(
                           '(${widget.product.rating.count})',
                           style: Theme.of(context).textTheme.titleMedium,
                         ),
                       ]
                   ),
                 ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .end,
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      star(widget.product.rating.rate.toInt()),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24.0,
                        width: 24.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,

                        ),
                        child: Text(
                          '1',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}