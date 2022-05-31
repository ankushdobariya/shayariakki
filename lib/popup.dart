import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class popup extends StatefulWidget {
  const popup({Key? key}) : super(key: key);

  @override
  _popupState createState() => _popupState();
}

class _popupState extends State<popup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hi"),),
    );
  }
}
