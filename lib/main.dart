import 'package:digital_cash_o/widgets/BottomSheetMenu.dart';
import 'package:digital_cash_o/widgets/DigitalButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Heebo',
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Color(0x1d4987ff),
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:
            // ExpansionPanelList(children: [
            //   ExpansionPanel(
            //     headerBuilder: (context, isOpen) {
            //       return Text("Hello");
            //     },
            //     body: Text("now open"),
            //   ),
            //   ExpansionPanel(
            //     headerBuilder: (context, isOpen) {
            //       return Text("Hello");
            //     },
            //     body: Text("now open"),
            //     // isExpanded: true,
            //   ),ExpansionPanel(
            //     headerBuilder: (context, isOpen) {
            //       return Text("Hello");
            //     },
            //     body: Text("now open"),
            //     // isExpanded: true,
            //
            //   ),
            // ]),

            // const Material(
            //   clipBehavior: Clip.antiAlias,
            //   shape: BeveledRectangleBorder(
            //       // side: BorderSide(color: Colors.blue), if you need
            //       borderRadius: BorderRadius.only(
            //     topRight: Radius.elliptical(20, 20),
            //   )),
            //   borderOnForeground: true,
            //   child: TextField(
            //     obscureText: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(20),
            //       )),
            //       labelText: 'Password',
            //     ),
            //   ),
            // )
            Center(
          child: Column(
            children: [
              ElevatedButton(
                  child: const Text('showModalBottomSheet'),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
              DigitalButton(
                topLeft: true,
              ),
              _timeLine(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            shape: BeveledRectangleBorder(
                // side: BorderSide(color: Colors.blue), // if you need
                borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              return BottomSheetMenu();
            },
          );
        },
        child: const Icon(Icons.send), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 56.0),
        elevation: 5,
      ),
      extendBody: true,
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _timeLine() {
    return Stack(

      alignment: Alignment.topCenter,
      children: [
        ClipOval(
            child: Container(
          width: 15,
          height: 15,
          color: Colors.black,
        )),
        Container(height: 50, width: 2, color: Colors.black,)
      ],
    );
  }
}
