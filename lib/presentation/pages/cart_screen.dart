import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/enums.dart';
import '../state_provider/get_home_data_provider.dart';
import '../widgets/btn_text.dart';
import '../widgets/text_widget.dart';
import 'details_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetHomeDataProvider>(
      builder: (context, cartProvider, child) {
        return cartProvider.loadingData == LoadingData.LOADING
            ? const CircularProgressIndicator(
                color: Colors.green,
              ).center
            : cartProvider.getCartModel!.data.cartItems.isEmpty
                ? const Icon(
                    CupertinoIcons.cart,
                    size: 100.0,
                  ).center
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                              check: (cartProvider.carts[
                                                  cartProvider
                                                      .getCartModel
                                                      !.data
                                                      .cartItems[index]
                                                      .product
                                                      .id.toInt()])!,
                                              productModel: cartProvider
                                                  .homeModel
                                                  .data
                                                  ?.products[index],
                                              function: () {
                                                cartProvider
                                                    .addFavouriteProvider(
                                                        productId: cartProvider
                                                            .getCartModel
                                                            !.data
                                                            .cartItems[index]
                                                            .product
                                                            .id
                                                            .toInt());
                                              },
                                          // check1: (cartProvider.cartscartProvider.getCartModel!.data.cartItems[index].product.id.toInt()])!,
                                            )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.green.shade100,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: const EdgeInsets.only(left: 5.0),
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              // fit: BoxFit.fitHeight,
                                              image: NetworkImage(
                                            cartProvider.getCartModel!.data.cartItems[index].product.image,
                                          ))),
                                      height: 100,
                                      width: 100,
                                      child: Card(
                                          color: Colors.green,
                                          margin: const EdgeInsets.all(5.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextWidget(
                                              txt:
                                                  '${cartProvider.getCartModel!.data.cartItems[index].product.price} EG',
                                              fontSize: 12.0,
                                              color: Colors.white,
                                              notFontFamily: true,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    )),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextWidget(
                                              txt:
                                                  cartProvider.getCartModel!.data.cartItems[index].product.name,
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              notFontFamily: true,
                                              fontWeight: FontWeight.bold,
                                              maxLines: 3,
                                            ),
                                            10.ph,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                // IconButton(
                                                //     onPressed: () {},
                                                //     icon: const Icon(
                                                //       Icons.add_circle,
                                                //       color: Colors.green,
                                                //     )),
                                                // const Text('21'),
                                                // IconButton(
                                                //     onPressed: () {},
                                                //     icon: const Icon(
                                                //         Icons.remove_circle,
                                                //         color: Colors.red)),
                                                BtnText(
                                                    onPressed: () {
                                                      cartProvider.addCartProvider(productId: cartProvider.getCartModel!.data.cartItems[index].product.id.toInt());
                                                    },
                                                    txt: 'Remove',
                                                    color: Colors.red)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            // 'test');
                          },
                          itemCount: cartProvider.getCartModel!.data.cartItems.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 15.0,
                          ),
                          // itemCount: 1
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: double.infinity,
                        child: Card(
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  txt:
                                      'Total : ${cartProvider.getCartModel!.data.total} EG',
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  notFontFamily: true,
                                  fontWeight: FontWeight.bold,
                                ),
                                BtnText(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Coming Soon !.....'),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        dismissDirection:
                                            DismissDirection.horizontal,
                                      ));
                                    },
                                    txt: 'Pay',
                                    color: Colors.red)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}
