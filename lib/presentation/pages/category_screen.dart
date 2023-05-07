import 'package:flutter/material.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/enums.dart';
import '../state_provider/categories_provider.dart';
import '../widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context , categoriesProvider , child){
        return  categoriesProvider.loadingData == LoadingData.LOADING
            ? const CircularProgressIndicator(
          color: Colors.green,
          backgroundColor: Colors.deepPurple,
        ).center
            : GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                // color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage("${categoriesProvider.categoriesModel.data?.data![index].image}")
                  ),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        //   color: Colors.amber,
                        borderRadius:
                        BorderRadius.circular(5.0),
                        border: Border.all(
                            color: Colors.grey.shade300)),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                        txt:
                        "${categoriesProvider.categoriesModel.data?.data![index].name}",
                        fontSize: 14,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, notFontFamily: true,),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: categoriesProvider.categoriesModel.data!.data!.length,
        );
      },
    );
  }
}
