import 'package:flutter/material.dart';

import '../../data/models/arguments/hadith_args.dart';
import '../../data/models/arguments/hadith_model_args.dart';
import '../../presentation/pages/add_hadith_page.dart';
import '../../presentation/pages/change_hadith_page.dart';
import '../../presentation/pages/hadith_detail.dart';
import 'route_names.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.hadithDetailPage:
        final HadithArgs hadithArgs = routeSettings.arguments as HadithArgs;
        return MaterialPageRoute(
          builder: (_) => HadithDetail(hadithId: hadithArgs.hadithId),
        );
      case RouteNames.addHadithPage:
        return MaterialPageRoute(
          builder: (_) => const AddHadithPage(),
        );
      case RouteNames.changeHadithPage:
        final HadithModelArgs hadithModelArgs = routeSettings.arguments as HadithModelArgs;
        return MaterialPageRoute(
          builder: (_) => ChangeHadithPage(hadithModel: hadithModelArgs.hadithModel),
        );
      default:
        throw Exception('Invalid route\n${routeSettings.name}');
    }
  }
}
