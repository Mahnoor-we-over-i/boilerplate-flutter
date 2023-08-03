/* import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:test_skeleton/utils/globals.dart';

Future<void> initFlavor(BuildContext context) async {
  await PackageInfo.fromPlatform().then(
    (PackageInfo packageInfo) {
      print(packageInfo.packageName);
      switch (packageInfo.packageName) {
        case 'com.example.test_skeleton':s
        // have colors to distinguish flavours
          print('inside production');
          break;
        default:
          print('inside debug');
      }
      // assign urls and initialize graphQl
      apiGraphqlURL = "backend.neo4j.bridgelinxpk.com/graphql";
    },
  );
}
 */