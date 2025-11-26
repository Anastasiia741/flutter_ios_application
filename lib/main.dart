import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel('demo/channel');
  int counter = 0;
  String fileText = "";

  Future<void> onTap() async {
    counter++;
    final text = await platform.invokeMethod("writeToFile", {"n": counter});
    setState(() => fileText = text ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: onTap, child: const Text("Tap me")),
              const SizedBox(height: 20),
              Text(fileText, style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
