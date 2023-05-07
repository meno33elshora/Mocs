import 'package:flutter/material.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../model/home_data_model.dart';
import '../../utils/constants/enums.dart';
import '../state_provider/get_home_data_provider.dart';
import '../widgets/animation_widget.dart';
import '../widgets/text_field_widget.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController control = CarouselController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<GetHomeDataProvider>(
        builder: (context, getHomeDataProvider, child) {
      return getHomeDataProvider.loadingData == LoadingData.LOADING
          ? const CircularProgressIndicator(color: Colors.green).center
          : SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    txt: 'Popular Product',
                    fontSize: 18.0,
                    color: Colors.black,
                    notFontFamily: true,
                    fontWeight: FontWeight.w600,
                  ),
                  10.ph,
                  AnimateWidgetItem(
                    indexPositionItem: 1,
                    horizontalOffset: -100,
                    item: CarouselSlider(
                        carouselController: control,
                        items: getHomeDataProvider.homeModel.data?.banners
                            .map((e) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage('${e.image}'),
                                  fit: BoxFit.cover,
                                )),
                          );
                        }).toList(),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.2,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 0.9,
                            scrollPhysics: const BouncingScrollPhysics(),
                            enlargeCenterPage: true,
                            onPageChanged: (index, _) {
                              getHomeDataProvider.activeChange(active: index);
                            })),
                  ),
                  20.ph,
                  const TextWidget(
                    txt: 'Search Product',
                    fontSize: 18.0,
                    color: Colors.black,
                    notFontFamily: true,
                    fontWeight: FontWeight.w600,
                  ),
                  10.ph,
                  SizedBox(
                    height: 50.0,
                    child: TextFieldWidget(
                        validator: (value) {},
                        controller: controller,
                        hintText: 'Search Any Product Found .....',
                        obscureText: false,
                        change: (input) {
                          getHomeDataProvider.filterProducts(input: input!);
                        }),
                  ),
                  20.ph,
                  const TextWidget(
                    txt: 'Our Product',
                    fontSize: 18.0,
                    color: Colors.black,
                    notFontFamily: true,
                    fontWeight: FontWeight.w600,
                  ),
                  10.ph,
                  GridView.count(
                      childAspectRatio: 1 / 1.4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: List.generate(
                        getHomeDataProvider.filteredProducts.isNotEmpty
                            ? getHomeDataProvider.filteredProducts.length
                            : getHomeDataProvider
                                .homeModel.data!.products.length,
                        (index) => AnimateWidgetItem(
                            indexPositionItem: index,
                            verticalOffset: -100,
                            item: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                              check: (getHomeDataProvider
                                                      .favourites[
                                                  getHomeDataProvider
                                                      .homeModel
                                                      .data!
                                                      .products[index]
                                                      .id])!,
                                              productModel: getHomeDataProvider
                                                  .homeModel
                                                  .data
                                                  ?.products[index],
                                              function: () {
                                                getHomeDataProvider
                                                    .addFavouriteProvider(
                                                        productId: getHomeDataProvider
                                                                .homeModel
                                                                .data!
                                                                .products[index]
                                                                .id!
                                                                .toInt());
                                              },
                                          // check1: (getHomeDataProvider.carts[getHomeDataProvider.homeModel.data!.products[index].id])!,
                                        )
                                    ));
                              },
                              child: buildItemProduct(
                                  getHomeDataProvider
                                      .homeModel.data!.products[index],
                                  context),
                            )),
                      )),
                ],
              ),
            );
    });
  }

  Widget buildItemProduct(ProductModel model, context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  image: NetworkImage(model.image.toString()),
                  height: 150.0,
                  width: double.infinity,
                ),
                if (model.discount != 0)
                  Container(
                    alignment: Alignment.center,
                    width: 52,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3),
                            bottomRight: Radius.circular(3))),
                    child: const Text(
                      'Discount',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: (Provider.of<GetHomeDataProvider>(context, listen: false).favourites[model.id])!
                              ? Colors.red
                              : Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                          splashRadius: 3,
                          onPressed: () {
                            Provider.of<GetHomeDataProvider>(context,
                                    listen: false)
                                .addFavouriteProvider(
                              productId: model.id!.toInt(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('${Provider.of<GetHomeDataProvider>(context, listen: false).addOrRemoveFavourite.message}'),
                              backgroundColor:  (Provider.of<GetHomeDataProvider>(context, listen: false).favourites[model.id])! ? Colors.red :  Colors.green,
                               behavior: SnackBarBehavior.floating,
                            ));
                          },
                          padding: const EdgeInsets.only(bottom: 15),
                          icon: Icon(
                            (Provider.of<GetHomeDataProvider>(context,
                                        listen: false)
                                    .favourites[model.id])!
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 20,
                            color: Colors.white,
                          )),
                    )),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 45,
            padding: const EdgeInsets.only(left: 3),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '${model.name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  height: 1.5,
                  wordSpacing: 1.1,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${model.price.round()} EG',
                style: const TextStyle(
                    height: 1.5,
                    wordSpacing: 1.1,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              if (model.discount != 0)
                Text(
                  '${model.oldPrice.round()} EG',
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black87,
                      decorationThickness: 2,
                      height: 1.5,
                      wordSpacing: 1.1,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

//  Container(
//    height: 30.0,
//    color: Colors.red,
//    alignment: Alignment.center,
//    child: SmoothIndicator(
//     offset: getHomeDataProvider.activeIndex.toDouble(),
//     count: (getHomeDataProvider.homeModel.data?.banners.length)!,
//     effect: const WormEffect(
//       activeDotColor: Colors.green,
//       dotColor: Colors.green,
//       type: WormType.thin,
//       spacing: 10,
//       dotWidth: 10,
//       dotHeight: 10,
//       paintStyle: PaintingStyle.stroke,
//     ),
//     size: const Size.square(0),
// ).center,
//  ),
