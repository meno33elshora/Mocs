import 'package:flutter/material.dart';
import 'package:mocs/data/data_source/local/shared_Pref_Helper.dart';
import 'package:mocs/presentation/pages/login.dart';
import 'package:mocs/presentation/state_provider/auth_provider.dart';
import 'package:mocs/presentation/widgets/btn_text.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/constants.dart';
import '../../utils/constants/enums.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, signUpProvider, child) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: const TextWidget(
              txt: 'SIGN UP',
              fontSize: 22,
              color: Colors.green,
              notFontFamily: true,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: SingleChildScrollView(
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
                    txt: 'Sign Up In Now ...! ',
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
                    controller: passwordGlobalController,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
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
                  signUpProvider.stautsMessage == StautsMessage.LOADING
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
                            } else if (passwordGlobalController.text.isEmpty) {
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
                            } else if (phoneController.text.isEmpty) {
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Phone is Empty ....'),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              signUpProvider
                                  .registerProvider(
                                      email: emailController.text,
                                      password: passwordGlobalController.text,
                                      name: nameController.text,
                                      phone: phoneController.text)
                                  .then((value) async {
                                //  CacheHelper.removeData(key: 'token',);
                                signUpProvider.stautsMessage ==
                                        StautsMessage.SUCCES
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                                '${signUpProvider.userModel.message}'),
                                            backgroundColor: signUpProvider
                                                        .userModel.status ==
                                                    false
                                                ? Colors.red
                                                : Colors.green))
                                    : '';
                                signUpProvider.userModel.status == true
                                    ? Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const Login()),
                                        (route) => false)
                                    : null;
                                await CacheHelper.saveData(
                                    key: 'tokenDb', value: signUpProvider.userModel.data?.token);

                                await CacheHelper.saveData(
                                    key: 'password',
                                    value: passwordGlobalController.text.toString());
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
          ),
        );
      },
    );
  }
}
