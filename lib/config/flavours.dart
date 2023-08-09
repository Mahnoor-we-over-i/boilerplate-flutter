import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'global_variables.dart';

Future<void> initFlavor(BuildContext context) async {
  await PackageInfo.fromPlatform().then(
    (PackageInfo packageInfo) {
      switch (packageInfo.packageName) {
        case 'com.weoveri.boiler_plate.prod':
          // have colors to distinguish flavours
          GlobalVariables.appTheme = Colors.purple;
          break;
        case 'com.weoveri.boiler_plate.stg':
          // have colors to distinguish flavours
          GlobalVariables.appTheme = Colors.pink;
          break;
        default:
          //debug is default
          GlobalVariables.appTheme = Colors.blue;
      }
      // assign urls and initialize graphQl
      // apiGraphqlURL = "backend.neo4j.bridgelinxpk.com/graphql";
    },
  );
}
