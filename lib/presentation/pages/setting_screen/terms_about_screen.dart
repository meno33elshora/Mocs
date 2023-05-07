import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/utils/extensions/sized.dart';

import '../../../model/fqa_model.dart';
import '../../../model/notification_model.dart';
import '../../../model/term_about.dart';
import '../../widgets/animation_widget.dart';
import '../../widgets/text_widget.dart';

class TermsAndAboutScreen extends StatelessWidget {
  final TermAndAboutModel  termsAndAbout;
  const TermsAndAboutScreen({Key? key , required this.termsAndAbout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = ['Terms' , 'About'] ;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green,
        title: const TextWidget(
        txt: 'Frequency Questions',
        fontSize: 18.0,
        color: Colors.white,
        notFontFamily: true,
        fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AnimateWidgetItem(
                indexPositionItem: 1,
                verticalOffset: -100,
                item:Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  color: Colors.grey.shade200,
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    leading:  const Icon(CupertinoIcons.barcode_viewfinder , color: Colors.deepPurple, size: 40,),
                    title: const TextWidget(
                      txt:
                      'Terms',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black, notFontFamily: false,),
                    backgroundColor: Colors.green,
                    textColor: Colors.blue,
                    tilePadding: const EdgeInsets.all(10.0),
                    children: [
                      ListTile(
                          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          title: TextWidget(
                            txt:
                            '${termsAndAbout.data?.terms}',
                            fontSize: 16,
                            maxLines: hashCode,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,

                            notFontFamily: false,)),
                    ],
                  ),
                ),
            ),

            30.ph,
            AnimateWidgetItem(
                indexPositionItem: 1,
                verticalOffset: -100,
                item: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  color: Colors.grey.shade200,
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    leading:  const Icon(CupertinoIcons.barcode_viewfinder , color: Colors.deepPurple, size: 40,),
                    title: const TextWidget(
                      txt:
                      'About',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black, notFontFamily: false,),
                    backgroundColor: Colors.green,
                    textColor: Colors.blue,
                    tilePadding: const EdgeInsets.all(10.0),
                    children: [
                      ListTile(
                          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          title: TextWidget(
                            txt:
                            '${termsAndAbout.data?.about}',
                            fontSize: 16,
                            maxLines: hashCode,
                            fontWeight: FontWeight.normal,
                            color: Colors.white, notFontFamily: false,)),
                    ],
                  ),
                ),
            ),

          ],
        )
      ),
    );
  }
}
