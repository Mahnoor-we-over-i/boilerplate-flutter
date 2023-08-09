import 'package:boiler_plate/config/flavours.dart';
import 'package:boiler_plate/config/global_variables.dart';
import 'package:boiler_plate/count/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_kit/responsive_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // TODO
    // Future Builder creates a widget that builds itself based on the latest snapshot of interaction with a future
    // We're using it here with initFlavor to get the flavor when the app is building
    //
    return FutureBuilder(
      future: initFlavor(context),
      builder: ((context, snapshot) {
        // We're using BloC in this app and MultiBlocProvider merges multople Bloc Providers at one place in the start of app
        // to read more about BloC follow this link: https://medium.com/flutter-community/flutter-bloc-for-beginners-839e22adb9f5

        return MultiBlocProvider(
          providers: [
            BlocProvider<CountBloc>(
              create: (BuildContext context) =>
                  CountBloc()..add(ChangeCountEvent(0)),
              child: Container(),
            )
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: GlobalVariables.appTheme,
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    context.read<CountBloc>().add(ChangeCountEvent(_counter));
    // usually we would use setState((){}) here to update out UI as the counter is incremented
    // but it updated the whole UI
    // but we have added ChangeCountEvent(_counter) which updates the UI without updating the whole screen

    /* setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    }); */
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init is a method in Responsive Kit
    // it is a flutter package that helps us make responsive UI
    // to read more about it please refer to: https://pub.dev/packages/responsive_kit
    SizeConfig().init(context, 616, 375);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocBuilder<CountBloc, CountState>(
      builder: (context, countState) {
        return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),
          ),
          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                SizedBox(
                  height: SizeConfig.getMyDynamicHeight(50),
                ),
                Container(
                  height: SizeConfig.getMyDynamicHeight(50),
                  width: SizeConfig.getMyDynamicWidth(120),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        200,
                      ),
                      border: Border.all(
                          width: 2, color: Theme.of(context).backgroundColor)),
                  child: Text(
                    countState is IncreaseCountState
                        ? '${countState.count}'
                        : '0',
                    // '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
