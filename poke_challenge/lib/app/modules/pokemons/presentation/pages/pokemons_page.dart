import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_challenge/app/app_controller.dart';
import 'package:poke_challenge/app/core/utils/assets.dart';
import 'package:poke_challenge/app/core/utils/colors.dart';
import 'package:poke_challenge/app/core/utils/constants.dart';
import 'package:poke_challenge/app/core/utils/constrains.dart';
import 'package:poke_challenge/app/core/utils/routes.dart';
import 'package:poke_challenge/app/modules/pokemons/presentation/controllers/pokemons_controller.dart';
import "package:poke_challenge/app/core/utils/string_extension.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState
    extends ModularState<PokemonsPage, PokemonsController> {
  @override
  void initState() {
    controller.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: ColorSystem.lightGray,
      body: Observer(builder: (_) {
        return controller.isError
            ? Center(
                child: GestureDetector(
                    onTap: () {
                      controller.getPokemons();
                    },
                    child: Text(
                      Constants.RETRY,
                      style: TextStyle(color: ColorSystem.primary),
                    )))
            : controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : SafeArea(
                    bottom: false,
                    child: Column(children: [
                      SizedBox(
                        height: Constrains.layoutSpace(LayoutSpace.m),
                      ),
                      Container(
                          height: 64,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              AssetsSystem.LOGO,
                            ),
                          ))),
                      SizedBox(
                        height: Constrains.layoutSpace(LayoutSpace.xl),
                      ),
                      Expanded(
                          child: GridView.count(
                              mainAxisSpacing:
                                  Constrains.layoutSpace(LayoutSpace.s),
                              crossAxisSpacing:
                                  Constrains.layoutSpace(LayoutSpace.s),
                              crossAxisCount: 2,
                              padding: EdgeInsets.only(
                                  left: Constrains.layoutSpace(LayoutSpace.l),
                                  right: Constrains.layoutSpace(LayoutSpace.l),
                                  bottom:
                                      Constrains.layoutSpace(LayoutSpace.xl)),
                              children: List.generate(
                                  controller.pokemons.length, (index) {
                                return pokemonItem(
                                    name: controller.pokemons[index].name!
                                        .capitalize(),
                                    photo: Constants.IMAGE_URL +
                                        "${index + 1}.png",
                                    onTap: () {
                                      AppController appController =
                                          Modular.get();
                                      appController.payload =
                                          controller.pokemons[index].name;
                                      Navigator.pushNamed(
                                          context, Routes.POKEMON_DETAIL);
                                    });
                              })))
                    ]),
                  );
      }),
    );
  }

  Widget pokemonItem({String? name, String? photo, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: ColorSystem.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: ColorSystem.white,
                margin: EdgeInsets.symmetric(
                    vertical: Constrains.layoutSpace(LayoutSpace.s)),
                child: Container(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(photo!),
                      backgroundColor: Colors.transparent,
                    )),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        vertical: Constrains.layoutSpace(LayoutSpace.xxs)),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorSystem.primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    child: Text(
                      name!,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: ColorSystem.white),
                    )),
              )
            ],
          )),
    );
  }
}
