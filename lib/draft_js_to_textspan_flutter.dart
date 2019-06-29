library draft_js_to_textspan_flutter;
import 'package:flutter/material.dart';
class DraftJSFlutter extends StatelessWidget{
  final String draftJsJsonString;

  DraftJSFlutter(this.draftJsJsonString);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Hello ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' world!'),
        ],
      ),
    );
  }

}
