import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/data/data_source/local/shared_Pref_Helper.dart';
import 'package:mocs/presentation/pages/login.dart';
import 'package:mocs/presentation/pages/profile_screen.dart';
import 'package:mocs/presentation/pages/setting_screen/terms_about_screen.dart';
import 'package:mocs/presentation/widgets/btn_widget.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/enums.dart';
import '../../state_provider/setting_provider.dart';
import '../../widgets/animation_widget.dart';
import '../../widgets/text_widget.dart';
import 'fqs_screen.dart';
import 'notifications_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(
      builder: (context, setting, child) {
        // todo : lists
        List<Widget> screens = [
          ProfileScreen(
            profileDataModel: setting.profileData,
            obt: setting.obt,
          ),
          NotificationScreen(
            notificationModel: setting.notificationModel,
          ),
          TermsAndAboutScreen(termsAndAbout: setting.termAndAboutModel),
          FrequencyScreen(fqaModel: setting.fqaModel),
        ];

        List<String> strings = [
          'Profile Info',
          'Notification',
          'Terms And About',
          'Frequency Questions'
        ];

        List<IconData> icons = [
          Icons.person,
          Icons.notifications,
          CupertinoIcons.book,
          Icons.question_answer
        ];
        // todo : body
        return setting.stautsMessage == StautsMessage.LOADING
            ? const CircularProgressIndicator(
                color: Colors.green,
              ).center
            :
        Scaffold(
          drawerScrimColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.ph,
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: TextWidget(txt: 'Menu', fontSize: 18.0, color: Colors.black, notFontFamily: true,fontWeight: FontWeight.bold,letterSpace: 2,),
                ),
            SingleChildScrollView(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                  AnimateWidgetItem(
                    indexPositionItem: index,
                    verticalOffset: -100,
                    item: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        title: TextWidget(txt: strings[index], fontSize: 16.0, color: Colors.black, notFontFamily: true,fontWeight: FontWeight.bold,),
                        leading: Icon(icons[index]),
                        subtitle: null,
                        iconColor: Colors.primaries[
                        Random().nextInt(Colors.primaries.length)],
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => screens[index]));
                        },
                      ),
                    ),
                  ),

                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
                  itemCount: screens.length),
            ),
            SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  ListView.separated(
                    itemCount: setting.contactModel.data!.data.length,
                      shrinkWrap: true,
                       padding: const EdgeInsets.all(5.0),
                       scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index){
                    return Image.network('${setting.contactModel.data!.data[index].image}',color: Colors.green,height: 30.0,width: 30.0,);
                  }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10.0,),)
                ],
              ),
            ),
            AnimateWidgetItem(
              indexPositionItem: 1,
              horizontalOffset: -100,
              item:  SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BtnWidget(
                      onPressed: (){
                        showDialog(context: context, builder: (_){
                          return  AlertDialog(
                            elevation: 0.0,
                            // content: TextWidget(txt: 'Are You Sure !? ', fontSize: 16.0, color: Colors.green, notFontFamily: true , fontWeight: FontWeight.bold,),
                            title: const TextWidget(txt: 'Logout From App', fontSize: 16.0, color: Colors.red, notFontFamily: true , fontWeight: FontWeight.bold,),
                            icon: const Icon(Icons.warning_amber),
                            iconColor: Colors.amber,
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const TextWidget(txt: 'Cancel', fontSize: 14.0, color: Colors.red, notFontFamily: true , fontWeight: FontWeight.bold,)),
                              TextButton(
                                  onPressed: ()async {
                                    await CacheHelper.removeData(key: 'tokenDb').then((value){
                                      if(mounted == value){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => const Login()));
                                      }
                                    });
                                  }, child: const TextWidget(txt: 'Ok', fontSize: 14.0, color: Colors.green, notFontFamily: true , fontWeight: FontWeight.bold,)),
                            ],
                          );
                        });
                      }, txt: 'LOGOUT', color: Colors.green, iconData: Icons.exit_to_app),
                ),
              ),
            ),

          ]),
        );
      },
    );
  }
}
