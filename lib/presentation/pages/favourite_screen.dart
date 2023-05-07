import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/presentation/state_provider/get_home_data_provider.dart';
import 'package:mocs/presentation/widgets/btn_text.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';
import 'package:mocs/utils/constants/enums.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetHomeDataProvider>(
      builder: (context, favouriteProvider, child) {
        return favouriteProvider.loadingData == LoadingData.LOADING
            ? const CircularProgressIndicator(
                color: Colors.green,
              ).center
            : favouriteProvider.favoriteModel.data!.data!.isEmpty
                ? const Icon(
                    CupertinoIcons.archivebox_fill,
                    size: 100.0,
                  ).center
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(
                                    check: (favouriteProvider
                                        .favourites[
                                    favouriteProvider
                                        .favoriteModel
                                        .data!.data![index]!.product!.id!.toInt()])!,
                                    productModel: favouriteProvider
                                        .homeModel
                                        .data
                                        ?.products[index],
                                    function: () {
                                      favouriteProvider
                                          .addFavouriteProvider(
                                          productId:
                                          favouriteProvider
                                              .favoriteModel
                                              .data!
                                              .data![index]!
                                              .product!
                                              .id!
                                              .toInt());
                                    },
                                  //   check1: (favouriteProvider
                                  //     .favourites[
                                  // favouriteProvider.favoriteModel
                                  //     .data!
                                  //     .data![index]!
                                  //     .product!
                                  //     .id!
                                  //     .toInt()])!,
                                  //   function1:() {
                                  // favouriteProvider
                                  //     .addFavouriteProvider(
                                  // productId:
                                  // favouriteProvider
                                  //     .favoriteModel
                                  //     .data!
                                  //     .data![index]!
                                  //     .product!
                                  //     .id!
                                  //     .toInt());
                                  //   },

                                        // productModel: favouriteProvider
                                        //     .homeModel.data?.products[index],
                                        // check: (favouriteProvider.favourites[
                                        //     favouriteProvider.homeModel.data!
                                        //         .products[index].id])!,
                                        // function: () {
                                        //   favouriteProvider
                                        //       .addFavouriteProvider(
                                        //           productId: favouriteProvider
                                        //               .favoriteModel
                                        //               .data!
                                        //               .data![index]!
                                        //               .product!
                                        //               .id!
                                        //               .toInt());
                                        // },
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        // fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                      '${favouriteProvider.favoriteModel.data!.data![index]!.product!.image}',
                                    ))),
                                height: 100,
                                width: 100,
                              )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      TextWidget(
                                        txt:
                                            '${favouriteProvider.favoriteModel.data!.data![index]!.product?.name}',
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        notFontFamily: true,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 3,
                                      ),
                                      10.ph,
                                      BtnText(
                                          onPressed: () {
                                            favouriteProvider.addFavouriteProvider(productId: favouriteProvider.favoriteModel.data!.data![index]!.product!.id!.toInt());
                                          },
                                          txt: 'Remove',
                                          color: Colors.red)
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
                    itemCount:
                        favouriteProvider.favoriteModel.data!.data!.length,
                    // itemCount: 1
                  );
      },
    );
  }
}
