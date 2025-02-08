import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class SecureScreenShot extends StatefulWidget {
  const SecureScreenShot({super.key});

  @override
  State<SecureScreenShot> createState() => _SecureScreenShotState();
}

class _SecureScreenShotState extends State<SecureScreenShot> {
  bool _secureMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Secure Mode: ${_secureMode.toString()}\n'),
            ElevatedButton(
                onPressed: () async {
                  final secureModeToggle = !_secureMode;

                  if (secureModeToggle == true) {
                    await FlutterWindowManager.addFlags(
                        FlutterWindowManager.FLAG_SECURE);
                  } else {
                    await FlutterWindowManager.clearFlags(
                        FlutterWindowManager.FLAG_SECURE);
                  }

                  setState(() {
                    _secureMode = !_secureMode;
                  });
                },
                child: const Text("Toggle Secure Mode")),
          ],
        ),
      ),
    );
  }
}
