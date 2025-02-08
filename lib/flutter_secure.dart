import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttersecure/core/const.dart';

class FlutterSecure extends StatefulWidget {
  const FlutterSecure({super.key});

  @override
  State<FlutterSecure> createState() => _FlutterSecureState();
}

class _FlutterSecureState extends State<FlutterSecure> {
  String pass = "";
  userSecureStorage () async{
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    await storage.write(key: "token", value: "Azz2544dddddddddddkseldjihfaadfuj");
    await storage.write(key: "API_KEY", value: Constance.ApiKey);
    await storage.write(key: "password", value: "Mohamed123");

    final data = await storage.read(key: "password");
    setState(() {
      pass = data!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mohamed123",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w200,
        ),),
      ),
    );
  }
}
