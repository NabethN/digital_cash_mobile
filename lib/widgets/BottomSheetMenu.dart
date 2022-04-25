import 'package:flutter/material.dart';

class BottomSheetMenu extends StatelessWidget {
  const BottomSheetMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Container(

          // color: Colors.black12,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ExpansionPanelList(children: [
                ExpansionPanel(
                  headerBuilder: (context, isOpen) {
                    return Text("Hello");
                  },
                  body: Text("now open"),
                )
              ]),
// ElevatedButton(
//   child: const Text('Close BottomSheet'),
//   onPressed: () => Navigator.pop(context),
// )
            ],
          ))),
    );
  }
}
