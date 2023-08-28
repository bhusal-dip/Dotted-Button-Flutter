import 'package:dotted_button/dotted_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = 'none';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dotted Button'),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                // crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: <Widget>[
                  displayMessage,
                  const SizedBox(height: 100),
                  rectBorderWidget,
                  // const SizedBox(height: 20),
                  circleBorderWidget,
                  // const SizedBox(height: 20),
                  rRectBorderWidget,
                  const SizedBox(height: 20),
                  ovalBorderWidget,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get displayMessage {
    return DottedButton(child: Text("The clicked button is $msg"));
  }

  Widget get rectBorderWidget {
    return DottedButton(
      onTap: () {
        setState(() {
          msg = 'Rectangle Border';
        });
      },
      // color: Colors.transparent,
      child: const Text("Rectangle Border"),
    );
  }

  Widget get circleBorderWidget {
    return DottedButton(
      onTap: () {
        setState(() {
          msg = 'Circle Border';
        });
      },
      height: 230,
      width: 100,
      margin: const EdgeInsets.all(20),
      borderType: BorderType.Oval,
      color: Colors.red,
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10,
        ),
      ],
      child: const Text("Circle Border"),
    );
  }

  Widget get rRectBorderWidget {
    return DottedButton(
      onTap: () {
        setState(() {
          msg = 'RRect Border';
        });
      },
      borderType: BorderType.RRect,
      // margin: EdgeInsets.all(10),

      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 10,
        ),
      ],
      // color: Colors.transparent,
      borderRadius: 30,
      child: const Text("RRect Border"),
    );
  }

  Widget get ovalBorderWidget {
    return DottedButton(
      onTap: () {
        setState(() {
          msg = 'Oval Border';
        });
      },
      height: 130,
      width: 50,
      // color: Colors.transparent,
      borderType: BorderType.Oval,
      child: const Text("Oval Border"),
    );
  }
}
