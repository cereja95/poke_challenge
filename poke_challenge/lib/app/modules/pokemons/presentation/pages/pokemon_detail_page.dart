import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_challenge/app/app_controller.dart';
import 'package:poke_challenge/app/core/utils/colors.dart';
import 'package:poke_challenge/app/core/utils/constants.dart';
import 'package:poke_challenge/app/core/utils/constrains.dart';
import 'package:poke_challenge/app/core/utils/fonts.dart';
import 'package:poke_challenge/app/modules/pokemons/presentation/controllers/pokemon_detail_controller.dart';
import "package:poke_challenge/app/core/utils/string_extension.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState
    extends ModularState<PokemonDetailPage, PokemonDetailController> {
  @override
  void initState() {
    AppController appController = Modular.get();
    controller.name = appController.payload;
    controller.getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: ColorSystem.white,
      body: Observer(builder: (_) {
        return SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: Constrains.layoutSpace(LayoutSpace.m),
              ),
              appBar(),
              controller.isError
                  ? Expanded(
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                controller.getPokemon();
                              },
                              child: Text(
                                Constants.RETRY,
                                style: TextStyle(color: ColorSystem.primary),
                              ))))
                  : controller.isLoading
                      ? Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Constrains.layoutSpace(LayoutSpace.xl),
                              ),
                              Container(
                                color: ColorSystem.white,
                                child: Container(
                                    width: 96,
                                    height: 96,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          Constants.IMAGE_URL +
                                              "${controller.pokemon?.id}.png"),
                                      backgroundColor: Colors.transparent,
                                    )),
                              ),
                              SizedBox(
                                height: Constrains.layoutSpace(LayoutSpace.s),
                              ),
                              sectionType(),
                              SizedBox(
                                height: Constrains.layoutSpace(LayoutSpace.s),
                              ),
                              Expanded(
                                  child: Container(
                                      color: ColorSystem.lightGray,
                                      child: bodyInfo()))
                            ],
                          ),
                        )
            ],
          ),
        );
      }),
    );
  }

  Widget appBar() {
    return Column(
      children: [
        Container(
            child: Row(
          children: [
            SizedBox(
              width: Constrains.layoutSpace(LayoutSpace.l),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: ColorSystem.gray,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorSystem.darkGray,
                    size: 15,
                  )),
            ),
            SizedBox(
              width: Constrains.layoutSpace(LayoutSpace.xs),
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      (controller.name ?? "").capitalize(),
                      style: TextStyle(
                          fontSize: Fonts.fontSize(FontsSize.title),
                          fontWeight: FontWeight.w700,
                          color: ColorSystem.darkGray),
                    ))),
            SizedBox(
              width: Constrains.layoutSpace(LayoutSpace.xs),
            ),
            SizedBox(
              width: Constrains.layoutSpace(LayoutSpace.l),
            ),
            SizedBox(
              width: Constrains.layoutSpace(LayoutSpace.l),
            ),
          ],
        )),
        SizedBox(
          height: Constrains.layoutSpace(LayoutSpace.s),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: ColorSystem.lightGray,
        )
      ],
    );
  }

  Widget sectionType() {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Constrains.layoutSpace(LayoutSpace.l)),
        child: (controller.pokemon?.types?.length ?? 0) < 2
            ? Row(
                children: [
                  Expanded(
                      child: badgeType(
                          type: controller.pokemon?.types?.first.type?.name ??
                              "")),
                ],
              )
            : Row(
                children: [
                  Expanded(
                      child: badgeType(
                          type: controller.pokemon?.types?.first.type?.name ??
                              "")),
                  SizedBox(width: Constrains.layoutSpace(LayoutSpace.s)),
                  Expanded(
                      child: badgeType(
                          type: controller.pokemon?.types?.last.type?.name ??
                              "")),
                ],
              ));
  }

  Widget badgeType({String? type}) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: colorBadge(type ?? ""),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Constrains.layoutSpace(LayoutSpace.s),
        ),
        alignment: Alignment.center,
        child: Text(
          (type ?? "").capitalize(),
          style:
              TextStyle(color: ColorSystem.white, fontWeight: FontWeight.w800),
        ));
  }

  Widget bodyInfo() {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Constrains.layoutSpace(LayoutSpace.l)),
        child: ListView(
          children: [
            SizedBox(height: Constrains.layoutSpace(LayoutSpace.l)),
            Row(
              children: [
                Expanded(
                    child: infoItem(
                        label: Constants.HP,
                        description: controller.getStatItem("hp"))),
                SizedBox(width: Constrains.layoutSpace(LayoutSpace.s)),
                Expanded(
                    child: infoItem(
                        label: Constants.HEIGHT,
                        description: "${controller.pokemon?.height ?? 0}cm")),
              ],
            ),
            SizedBox(height: Constrains.layoutSpace(LayoutSpace.s)),
            Row(
              children: [
                Expanded(
                    child: infoItem(
                        label: Constants.ATTACK,
                        description: controller.getStatItem("attack"))),
                SizedBox(width: Constrains.layoutSpace(LayoutSpace.s)),
                Expanded(
                    child: infoItem(
                        label: Constants.WEIGHT,
                        description: "${controller.pokemon?.weight ?? 0}kg")),
              ],
            ),
            SizedBox(height: Constrains.layoutSpace(LayoutSpace.s)),
            Row(
              children: [
                Expanded(
                    child: infoItem(
                        label: Constants.DEFENSE,
                        description: controller.getStatItem("defense"))),
                SizedBox(width: Constrains.layoutSpace(LayoutSpace.s)),
                Expanded(
                    child: infoItem(
                        label: Constants.SPECIAL_ATTACK,
                        description: controller.getStatItem("special-attack"))),
              ],
            ),
            SizedBox(height: Constrains.layoutSpace(LayoutSpace.s)),
            Row(
              children: [
                Expanded(
                    child: infoItem(
                        label: Constants.SPECIAL_DEFENSE,
                        description:
                            controller.getStatItem("special-defense"))),
                SizedBox(width: Constrains.layoutSpace(LayoutSpace.s)),
                Expanded(
                    child: infoItem(
                        label: Constants.SPEEED,
                        description: controller.getStatItem("speed"))),
              ],
            ),
            SizedBox(height: Constrains.layoutSpace(LayoutSpace.l)),
          ],
        ));
  }

  Widget infoItem({String? label, String? description}) {
    return Container(
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Constrains.layoutSpace(LayoutSpace.s),
        ),
        child: Column(
          children: [
            Text(
              label ?? "",
              style: TextStyle(
                  color: ColorSystem.labelColor,
                  fontWeight: FontWeight.w700,
                  fontSize: Fonts.fontSize(FontsSize.label)),
            ),
            SizedBox(height: Constrains.layoutSpace(LayoutSpace.xxxs)),
            Text(
              description ?? "",
              style: TextStyle(
                color: ColorSystem.defaultType,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ));
  }

  Color colorBadge(String type) {
    switch (type) {
      case Constants.GRASS_TYPE:
        return ColorSystem.grassType;
      case Constants.POISON_TYPE:
        return ColorSystem.poisonType;
      case Constants.FIRE_TYPE:
        return ColorSystem.fireType;
      case Constants.FLYING_TYPE:
        return ColorSystem.flyingType;
      case Constants.WATER_TYPE:
        return ColorSystem.waterType;
      case Constants.BUG_TYPE:
        return ColorSystem.bugType;
      case Constants.NORMAL_TYPE:
        return ColorSystem.normalType;
    }
    return ColorSystem.defaultType;
  }
}
