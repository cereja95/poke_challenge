import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_challenge/app/modules/auth/presentation/controllers/auth_controller.dart';
import 'presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
  ];
}
