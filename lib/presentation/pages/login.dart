import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocs/presentation/pages/layout/layout.dart';
import 'package:mocs/presentation/pages/sign_up.dart';
import 'package:mocs/presentation/widgets/btn_text.dart';
import 'package:mocs/presentation/widgets/text_widget.dart';
import 'package:mocs/utils/extensions/center.dart';
import 'package:mocs/utils/extensions/sized.dart';
import 'package:provider/provider.dart';
import '../../data/data_source/local/shared_Pref_Helper.dart';
import '../../utils/constants/constants.dart';
import '../../utils/constants/enums.dart';
import '../state_provider/auth_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: const TextWidget(
              txt: 'LOGIN',
              fontSize: 22,
              color: Colors.green,
              notFontFamily: true,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Padding(
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
                  txt: 'Login In Now ...! ',
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
                authProvider.stautsMessage == StautsMessage.LOADING
                    ? const CircularProgressIndicator(
                        color: Colors.green,
                      ).center
                    : BtnText(
                        onPressed: ()  {
                          if (emailController.text.isEmpty) {
                            return ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Email is Empty'),
                              backgroundColor: Colors.red,
                            ));
                          } else if (passwordGlobalController.text.isEmpty) {
                            return ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Password is Empty'),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            authProvider
                                .loginProvider(
                                    email: emailController.text,
                                    password: passwordGlobalController.text)
                                .then((value)async {
                              authProvider.stautsMessage == StautsMessage.SUCCES
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              '${authProvider.userModel.message}'),
                                          backgroundColor:
                                              authProvider.userModel.status ==
                                                      false
                                                  ? Colors.red
                                                  : Colors.green))
                                  : '';
                              authProvider.userModel.status == true
                                  ? Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Layout()),
                                      (route) => false)
                                  : null;
                              await CacheHelper.saveData(
                                  key: 'tokenDb', value: authProvider.userModel.data?.token);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      txt: 'Sign Up Now !',
                      fontSize: 18.0,
                      color: Colors.green,
                      notFontFamily: true,
                      fontWeight: FontWeight.bold,
                    ),
                    10.pw,
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const SignUp()),
                              (route) => false);
                        },
                        child: const TextWidget(
                          txt: 'Sign Up ',
                          fontSize: 16.0,
                          color: Colors.deepPurple,
                          notFontFamily: true,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ],
            ).center,
          ),
        );
      },
    );
  }
}
