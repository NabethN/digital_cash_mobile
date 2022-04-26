import 'package:digital_cash_o/widgets/EmptyDigitalCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomSheetMenu.dart';
import '../widgets/DigitalCard.dart';
import 'CheckVoucher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F5FF),
        body: Column(
          children: [
            Image.asset("assets/images/logo_dc_main_black.png"),
            EmptyDigitalCard(
              width: MediaQuery.of(context).size.width - 32,
              topRight: true,
              height: 290,
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xffffffff),
                  Color(0xffffffff),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 28, 0, 5),
                    child: Text(
                      "Your balance",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Text("5,854.23 €", style: TextStyle(fontSize: 42)),
                  _timeLine()
                ],
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
                  );},),
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
                  onPressed: () {},
                ),
                // DigitalCard(bottomLeft: true, topLeft: true, topRight: true, bottomRight: true, corner: 50, text: "Add Funds", ),
              ]),
            ),
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
            ]),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 14,
          child: Container(height: 60.0),
          elevation: 5,
        ),
      ),
    );
  }

  Widget _timeLine() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (var i = 0; i < 5; i++)
              ClipOval(
                  child: Container(
                width: 15,
                height: 15,
                color: Colors.black,
              )),

            Container(
              height: 50,
              width: 2,
              color: Colors.black,
            )
          ],
        ),
      ],
    );
  }
}
