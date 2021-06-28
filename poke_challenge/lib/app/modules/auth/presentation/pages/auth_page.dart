import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_challenge/app/core/utils/assets.dart';
import 'package:poke_challenge/app/core/utils/colors.dart';
import 'package:poke_challenge/app/core/utils/constants.dart';
import 'package:poke_challenge/app/core/utils/constrains.dart';
import 'package:poke_challenge/app/core/utils/routes.dart';
import 'package:poke_challenge/app/modules/auth/presentation/controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: ColorSystem.lightGray,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Container(
                      height: Constrains.fullHeight(context),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          AssetsSystem.BACKGROUND,
                        ),
                        fit: BoxFit.fitHeight,
                      ))),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: Constrains.fullWidth(context),
                        height: Constrains.layoutSpace(LayoutSpace.xxl) - 15,
                        decoration: BoxDecoration(
                          color: ColorSystem.lightGray,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                      ))
                ],
              )),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                        height: Constrains.layoutSpace(LayoutSpace.xxl) - 33),
                    Container(
                        height: 64,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            AssetsSystem.LOGO,
                          ),
                        ))),
                    SizedBox(height: Constrains.layoutSpace(LayoutSpace.xxl)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constrains.layoutSpace(LayoutSpace.l)),
                      child: Row(children: [
                        Expanded(
                            child: buttonAuth(
                                title: Constants.SIGN_UP_BUTTON, onTap: () {})),
                        SizedBox(width: Constrains.layoutSpace(LayoutSpace.s)),
                        Expanded(
                            child: buttonAuth(
                                title: Constants.LOGIN_BUTTON,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.POKEMONS);
                                })),
                      ]),
                    ),
                    SizedBox(height: Constrains.layoutSpace(LayoutSpace.m)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget buttonAuth({@required String? title, @required onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Constrains.layoutSpace(LayoutSpace.s)),
          decoration: BoxDecoration(
            color: ColorSystem.lightGray,
            border: Border.all(width: 2, color: ColorSystem.strokeFont),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          alignment: Alignment.center,
          child: Text(
            title!,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ));
  }
}
