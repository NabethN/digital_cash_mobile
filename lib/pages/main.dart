import 'package:digital_cash_o/pages/CheckVoucher.dart';
import 'package:digital_cash_o/pages/homePage.dart';
import 'package:digital_cash_o/widgets/BottomSheetMenu.dart';
import 'package:digital_cash_o/widgets/DigitalButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/DigitalCard.dart';

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

        backgroundColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.red,
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.green,
        ),
        textTheme: GoogleFonts.heeboTextTheme(
          Theme.of(context).textTheme,

        ),
        // textTheme: const TextTheme(bodyText2: TextStyle( color: Colors.purple),),
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
      body: Column(
        children: [
          Expanded(
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              shape: const BeveledRectangleBorder(
                  // side: BorderSide(color: Colors.blue), // if you need

                  // side: BorderSide(color: Colors.blue), if you need
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(56))),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  // constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg_one.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Image(
                    image: AssetImage("assets/images/logo_dc_main.png"),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Row(children: [
              // DigitalCard(bottomLeft: true, text: "Add Funds", height: 214,),
              DigitalCard(
                  bottomLeft: true,
                  text: "Check Your Voucher",
                  height: 214,
                  width: MediaQuery.of(context).size.width / 2 - 16 - 7,
                  corner: 30,
                  borderRadius: 16,
                  imagePath: "assets/icons/voucher_circle.png",
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckVoucher()),
                );},
              ),
              const SizedBox(
                width: 14,
              ),
              DigitalCard(
                bottomLeft: true,
                text: "Add Funds",
                height: 214,
                width: MediaQuery.of(context).size.width / 2 - 16 - 7,
                corner: 30,
                borderRadius: 16,
                imagePath: "assets/icons/funds_circle.png",
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  colors: <Color>[Color(0xff1CC5D0), const Color(0xff7506A5)],
                ),
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckVoucher()),
                );},
              ),
              // DigitalCard(bottomLeft: true, topLeft: true, topRight: true, bottomRight: true, corner: 50, text: "Add Funds", ),
            ]),
          ),
          SizedBox(height: 24,),
          DigitalButton(text: "Let's Go", bottomRight: true, topLeft: true, onPressed: (){ Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );},),
          SizedBox(height: 24+20,)
        ],
      ),

      floatingActionButton: Container(
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              shape: const BeveledRectangleBorder(
                  // side: BorderSide(color: Colors.blue), // if you need
                  borderRadius: const BorderRadius.only(
                      topRight: const Radius.circular(20))),
              context: context,
              builder: (BuildContext context) {
                return const BottomSheetMenu();
              },
            );
          },
          child: Stack(children: [
            //ToDo add splash effect on button
            Image.asset("assets/icons/floating_action_btn.png"),
            // Positioned.fill(
            //   child: Material(
            //     color: Colors.transparent,
            //     child: InkWell(
            //       onTap: () { },
            //     ),
            //   ),
            // ),
          ]), //icon inside button
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 14,
        child: Container(height: 60.0),
        elevation: 5,
      ),
      // extendBody: true,
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
