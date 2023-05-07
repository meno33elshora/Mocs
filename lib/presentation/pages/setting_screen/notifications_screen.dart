import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/notification_model.dart';
import '../../widgets/animation_widget.dart';
import '../../widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationScreen({Key? key , required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.green,
        title: const TextWidget(
        txt: 'Notification',
        fontSize: 18.0,
        color: Colors.white,
        notFontFamily: true,
        fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      body: SingleChildScrollView(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                AnimateWidgetItem(
                    indexPositionItem: index,
                    verticalOffset: -100,
                    item: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        color: Colors.grey.shade200,
                        clipBehavior: Clip.antiAlias,
                        child: ExpansionTile(
                          leading:  const Icon(CupertinoIcons.barcode_viewfinder , color: Colors.deepPurple, size: 40,),
                          title: TextWidget(
                            txt:
                            "${notificationModel.data?.data[index].title}",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            maxLines: hashCode,
                            color: Colors.black, notFontFamily: false,),
                          backgroundColor: Colors.green,
                          textColor: Colors.blue,
                          tilePadding: const EdgeInsets.all(10.0),
                          children: [
                            ListTile(
                                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                title: TextWidget(
                                  txt:
                                  "${notificationModel.data?.data[index].message}",
                                  maxLines: hashCode,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white, notFontFamily: false,)),
                          ],
                        ),
                      ),
                    ),
                ),

            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: notificationModel.data!.data.length),
      ),
    );
  }
}
