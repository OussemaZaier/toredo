import 'dart:convert';
import 'dart:io';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toredo/api/api.dart';
import 'package:toredo/models/customer.dart';
import 'package:toredo/pages/navigation.dart';
import 'package:toredo/pages/shop.dart';
import 'package:toredo/components/signUpComponent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.isItLoginPage}) : super(key: key);
  bool isItLoginPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // static late APIService apiService;
  // static late CustomerModel customer;

  _tapFunLogin() {
    print('tapped login');
    APIService api = APIService();
    api.loginCustomer(
      userController.text,
      passwordController.text,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Navigation(),
      ),
    );
  }

  _tapFunSignUp() {
    //wapiService.createCustomer(customer);
    print('tapped signup');
    CustomerModel cm = new CustomerModel(
      email: emailController.text,
      password: passwordController.text,
      username: userController.text,
    );

    APIService api = APIService();
    //progress indicator
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        title: "working on your request",
        customColumns: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
    api.createCustomer(cm).then(
      ((value) {
        Navigator.pop(context);

        print('here1');
        if (value.response == null) {
          print(value.statusCode);
          print(value.data);
          ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: "done working on your request",
            ),
          );
        } else {
          print(value.response.runtimeType);
          Map<String, dynamic> jsonMap = json.decode(value.response.toString());
          ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              title: "done working on your request",
              text: jsonMap['data'],
            ),
          );
        }
      }),
    ).onError(
      ((error, stackTrace) {
        print('here2');
        print(error);

        ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            title: "error while working on your request",
          ),
        );
      }),
    );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Navigation(),
    //   ),
    // );
  }

  bool visible = false;
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    // apiService = new APIService();
    // customer = new CustomerModel(
    //     email: 'testfromflutter@gmail.com',
    //     password: 'password',
    //     username: 'username');
  }

  @override
  Widget build(BuildContext context) {
    // timeDilation = 5.0; // 1.0 means normal animation speed.

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'appLogo',
                        child: Image(
                          image: AssetImage('assets/images/leaf.png'),
                          height: MediaQuery.of(context).size.height / 7,
                          width: MediaQuery.of(context).size.width / 7,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Toredo',
                        style: TextStyle(
                          fontFamily: 'Falling',
                          fontSize: 60,
                          letterSpacing: -4,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.helloMsg,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //username field
                    Text(
                      AppLocalizations.of(context)!.username,
                      style: TextStyle(
                        fontFamily: 'Falling',
                        fontSize: 15,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'can\'t be empty';
                        }
                      },
                      controller: userController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 75, 185, 28)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        hintText: AppLocalizations.of(context)!.username,
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black26,
                        ),
                        suffixIcon: userController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                onPressed: () {
                                  userController.clear();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.black26,
                                ),
                              ),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    //email
                    Visibility(
                      visible: !widget.isItLoginPage,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.yourEmail,
                            style: TextStyle(
                              fontFamily: 'Falling',
                              fontSize: 15,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'can\'t be empty';
                              }
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 75, 185, 28)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              hintText: 'emailEXAMPLE@email.com',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black26,
                              ),
                              suffixIcon: emailController.text.isEmpty
                                  ? Container(
                                      width: 0,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        emailController.clear();
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black26,
                                      ),
                                    ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.yourPwd,
                      style: TextStyle(
                        fontFamily: 'Falling',
                        fontSize: 15,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'can\'t be null';
                        }
                        if (value.length < 6) {
                          return 'at least 6 caracters';
                        }
                      },
                      controller: passwordController,
                      obscureText: !visible,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 75, 185, 28)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                        hintText: '***********',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black26,
                        ),
                        suffixIcon: visible
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility,
                                  color: Colors.black26,
                                ))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Colors.black26,
                                )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: widget.isItLoginPage ? _tapFunLogin : _tapFunSignUp,
                child: Container(
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    color: (emailController.text.isEmpty ||
                            passwordController.text.isEmpty)
                        ? Color.fromARGB(15, 0, 0, 0)
                        : Color(0xFFA5FB81),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.advanced,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            letterSpacing: -2,
                            fontWeight: FontWeight.w100,
                            color: (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty)
                                ? Color.fromARGB(40, 0, 0, 0)
                                : Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty)
                              ? Color.fromARGB(40, 0, 0, 0)
                              : Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(isItLoginPage: false),
                    ),
                  );
                }),
                child: widget.isItLoginPage
                    ? Text(
                        AppLocalizations.of(context)!.alreadyHave,
                        style: TextStyle(
                            fontFamily: 'Falling',
                            fontSize: 15,
                            color: Colors.black26),
                      )
                    : SizedBox(
                        height: 0.0,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 50.0,
                  left: 50.0,
                  top: 10.0,
                ),
                child: Divider(
                  thickness: 1,
                ),
              ),
              SignUpComponent(
                image: const AssetImage('assets/images/google.png'),
                name: widget.isItLoginPage
                    ? '${AppLocalizations.of(context)!.signIn} Google'
                    : '${AppLocalizations.of(context)!.signUp} Google',
              ),
              SignUpComponent(
                image: const AssetImage('assets/images/apple.png'),
                name: widget.isItLoginPage
                    ? '${AppLocalizations.of(context)!.signIn} Apple'
                    : '${AppLocalizations.of(context)!.signUp} Apple',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
