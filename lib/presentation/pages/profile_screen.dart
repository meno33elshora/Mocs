import 'package:flutter/material.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';

import '../../model/profile_dataModel.dart';
import '../../utils/constants/constants.dart';
import '../../utils/constants/enums.dart';
import '../state_provider/setting_provider.dart';
import '../widgets/btn_text.dart';
import '../widgets/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileData profileDataModel;
   bool obt = false;
   // StautsMessage  stautsMessage;

   ProfileScreen({Key? key , required this.profileDataModel , required this.obt ,}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
   emailController.text =  widget.profileDataModel.data!.email.toString();
   passwordController.text = passwordGlobalController.text  ;
   nameController.text = widget.profileDataModel.data!.name.toString();
   phoneController.text = widget.profileDataModel.data!.phone.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const TextWidget(
          txt: 'Profile Info',
          fontSize: 18.0,
          color: Colors.white,
          notFontFamily: true,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<SettingProvider>(
        builder: (context , profile , child){
          return   SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextWidget(
                    txt: 'Hello, ',
                    fontSize: 24,
                    color: Colors.green,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  10.ph,
                  const TextWidget(
                    txt: 'Can you Update Profile Now ...! ',
                    fontSize: 24,
                    color: Colors.black,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  30.ph,
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  20.ph,
                  TextField(
                    controller: passwordController,
                    obscureText: widget.obt,
                    // obscureText: true,
                    decoration:  InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (){
                              widget.obt = ! widget.obt;
                              setState(() {

                              });
                        }, icon: const Icon(Icons.remove_red_eye)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder:const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  20.ph,
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  20.ph,
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                        hintText: 'Phone',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  20.ph,
                  profile.stautsMessage == StautsMessage.LOADING
                      ? const CircularProgressIndicator(
                    color: Colors.green,
                  ).center
                      : BtnText(
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        return ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Email is Empty ....'),
                          backgroundColor: Colors.red,
                        ));
                      }
                      else if (passwordController.text.isEmpty) {
                        return ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Password is Empty ....'),
                          backgroundColor: Colors.red,
                        ));
                      } else if (nameController.text.isEmpty) {
                        return ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Name is Empty ....'),
                          backgroundColor: Colors.red,
                        ));
                      } else if (passwordController.text.isEmpty) {
                        return ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Phone is Empty ....'),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        profile
                            .putProfileProvider(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text)
                            .then((value) async {
                          //  CacheHelper.removeData(key: 'token',);
                          profile.stautsMessage ==
                              StautsMessage.SUCCES
                              ? ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                              content: const Text(
                                  'Profile is Update'),
                              backgroundColor: profile
                                  .profileData.status ==
                                  false
                                  ? Colors.red
                                  : Colors.green))
                              : '';
                          profile.profileData.status == true
                              ? Navigator.pop(context)
                              : null;
                        });
                      }
                    },
                    txt: 'Send',
                    color: Colors.green,
                  ).center,
                  30.ph,
                ],
              ).center,
            ),
          );
        },
      ),
    );
  }
}
