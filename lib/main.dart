import 'package:api_calling/views/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Api_Calling(),
  );
}

class Api_Calling extends StatefulWidget {
  const Api_Calling({Key? key}) : super(key: key);

  @override
  State<Api_Calling> createState() => _Api_CallingState();
}

class _Api_CallingState extends State<Api_Calling> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
