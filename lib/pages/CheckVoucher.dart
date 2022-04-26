import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/EmptyDigitalCard.dart';

class CheckVoucher extends StatelessWidget {
  const CheckVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF4F5FF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Center(child: Image.asset("assets/images/logo_dc_main_black.png")),
            EmptyDigitalCard(
              width: MediaQuery.of(context).size.width - 32,
              height: 252,
              borderRadius: 16,
              bottomLeft: true,
              gradient: LinearGradient(
                colors: const <Color>[
                  Color(0xffffffff),
                  Color(0xffffffff),
                ],
              ),
              child: Column(
                children: [
                  Text("Check Voucher"),
                  Material(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.transparent,
                    shape: BeveledRectangleBorder(
                        side: BorderSide(color: Color(0xff250055)), // if you need

                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(18))),
                    child: TextField(
                      clipBehavior: Clip.antiAlias,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
