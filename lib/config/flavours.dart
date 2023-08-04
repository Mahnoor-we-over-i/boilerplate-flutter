import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'global_variables.dart';

Future<void> initFlavor(BuildContext context) async {
  await PackageInfo.fromPlatform().then(
    (PackageInfo packageInfo) {
      print(packageInfo.packageName);
      switch (packageInfo.packageName) {
        case 'com.example.boiler_plate.prod':
          // have colors to distinguish flavours
          print('inside production');
          GlobalVariables.appTheme = Colors.purple;
          break;
        default:
          print('inside debug');
          GlobalVariables.appTheme = Colors.pink;
      }
      // assign urls and initialize graphQl
      // apiGraphqlURL = "backend.neo4j.bridgelinxpk.com/graphql";
    },
  );
}
