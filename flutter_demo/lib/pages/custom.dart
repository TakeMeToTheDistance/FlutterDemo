import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  CustomWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CustomWidgetState createState() => CustomWidgetState();
}

class CustomWidgetState extends State<CustomWidget> {
  // Default placeholder text
  String textToShow = "I Like Flutter";
  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Widget"),
      ),
      body: CustomButton('呵呵哒', 'ddd'),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final String custom;

  CustomButton(this.label, this.custom);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () {}, child: Text(label + custom));
  }
}
