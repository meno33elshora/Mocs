import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/presentation/state_provider/get_home_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/home_data_model.dart';
import '../widgets/text_widget.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel? productModel;
  late bool check;
  // late bool check1;

  Function() function;
  // Function() ?  function1;

  DetailsScreen(
      {Key? key,
      required this.productModel,
      required this.check,
      // required this.check1,
      required this.function,
       // this.function1,
      })
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var control = CarouselController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const TextWidget(
          txt: 'Details Product',
          fontSize: 18.0,
          color: Colors.white,
          notFontFamily: true,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child:
                      // Image.network('${productModel?.image}')
                      CarouselSlider(
                          carouselController: CarouselController(),
                          items: List.generate(
                              widget.productModel!.images.length, (index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                // color: Colors.grey.shade300,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.productModel!.images[index]),
                                    fit: BoxFit.contain),
                              ),
                              // child: Image(image: NetworkImage("${e.image}") ,),
                            );
                          }),
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 4,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.9,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          )),
                ),
              ),
              (widget.productModel?.discount != 0)
                  ? ClipRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 30.0,
                        child: Text(
                          "Discount ${widget.productModel?.discount}%",
                          style: const TextStyle(
                              // backgroundColor: MyColor.red,
                              color: Colors.white,
                              fontSize: 19.0),
                        ),
                      ),
                    )
                  : const Text(''),
            ],
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: TextWidget(
                              txt: "${widget.productModel?.description}",
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              maxLines: hashCode,
                              notFontFamily: true,
                            ),
                          ),
                        ),
                      ),
                      // const Spacer(),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            //   color: Colors.amber,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              txt: "${widget.productModel?.price} EG",
                              fontSize: 20,
                              maxLines: 2,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              notFontFamily: true,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            if (widget.productModel?.oldPrice !=
                                widget.productModel?.price)
                              TextWidget(
                                txt: "${widget.productModel?.oldPrice} EG",
                                fontSize: 18,
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                                textDecoration: TextDecoration.lineThrough,
                                color: Colors.red,
                                notFontFamily: true,
                              )
                            else
                              const Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
              ],
            ),
          )),
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              // borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(10.0),
              //     topRight: Radius.circular(10.0)),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: IconButton(
                        onPressed: () {
                          widget.function();
                          widget.check = !widget.check;

                          setState(() {});
                        },
                        icon: Icon(
                          widget.check
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: Colors.white,
                        ))),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Provider.of<GetHomeDataProvider>(context, listen: false).addCartProvider(productId: widget.productModel!.id!.toInt());
                    // widget.function();
                    // widget.check = !widget.check;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(Provider.of<GetHomeDataProvider>(context, listen: false).addCartModel!.message),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor:Provider.of<GetHomeDataProvider>(context, listen: false).carts[widget.productModel!.id]! ?  Colors.red: Colors.green,
                      dismissDirection: DismissDirection.horizontal,
                    ));
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Provider.of<GetHomeDataProvider>(context, listen: false).carts[widget.productModel!.id]! ?  Colors.red :  Colors.green,
                      // color:  widget.check1 ?  Colors.red :  Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            CupertinoIcons.cart,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        TextWidget(
                          txt: "Add Card",
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                          notFontFamily: true,
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
