library draft_js_to_textspan_flutter;

import 'package:draft_js_to_textspan_flutter/model.dart';
import 'package:flutter/material.dart';

class DraftJSFlutter extends StatelessWidget {
  final Map<String, dynamic> map;

  DraftJSFlutter(this.map);

  List<TextSpan> getTextSpans() {
    List<TextSpan> list = List();
    if (map != null) {
      DraftJsObject draftJsObject = DraftJsObject.fromJson(map);
      if (draftJsObject != null && draftJsObject.blocks != null) {
        for (int blockIndex = 0;
            blockIndex < draftJsObject.blocks.length;
            blockIndex++) {
          int textLength = (draftJsObject.blocks[blockIndex].text ?? "").length;
          for (int textIndex = 0; textIndex < textLength; textIndex++) {
            Color textColor = Colors.black;
            FontWeight textFontWeight = FontWeight.w400;
            FontStyle textFontStyle = FontStyle.normal;
            TextDecoration decoration = TextDecoration.none;

            for (int inlineStyleIndex = 0;
                inlineStyleIndex <
                    draftJsObject.blocks[blockIndex].inlineStyleRanges.length;
                inlineStyleIndex++) {
              if (draftJsObject
                  .blocks[blockIndex].inlineStyleRanges[inlineStyleIndex]
                  .contains(textIndex)) {
                print(draftJsObject.blocks[blockIndex]
                    .inlineStyleRanges[inlineStyleIndex].style);
                switch (draftJsObject.blocks[blockIndex]
                    .inlineStyleRanges[inlineStyleIndex].style) {
                  case "BOLD":
                    textFontWeight = FontWeight.w700;
                    break;
                  case "ITALIC":
                    textFontStyle = FontStyle.italic;
                    break;
                  case "UNDERLINE":
                    decoration = TextDecoration.underline;
                    break;
                  case "STRIKETHROUGH":
                    decoration = TextDecoration.lineThrough;
                    break;
                }
              }
            }
            list.add(TextSpan(
                text: draftJsObject.blocks[blockIndex].text[textIndex]
                    .substring(0, textIndex),
                style: TextStyle(
                    color: textColor,
                    fontStyle: textFontStyle,
                    fontWeight: textFontWeight,
                    decoration: decoration)));
          }

          list.add(TextSpan(
            text: " \n",
          ));
        }
      }
    }
    print(list.length);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children: []..addAll(getTextSpans())));
  }
}
