import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';
import 'pages/todo_detail.dart';
import 'controllers/home_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => HomeController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => HomePage(homeController: Modular.get())),
        ChildRoute('/detail',
            child: (context, args) => TodoDetail(todo: args.data)),
      ];
}
