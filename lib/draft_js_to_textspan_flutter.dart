library draft_js_to_textspan_flutter;

import 'package:draft_js_to_textspan_flutter/model.dart';
import 'package:flutter/material.dart';

class DraftJSFlutter extends StatelessWidget {
  final String draftJsJsonString;
  final Map<String, dynamic> map;

  DraftJSFlutter(this.draftJsJsonString, this.map);

  List<TextSpan> getTextSpans() {
    List<TextSpan> list = List();
    if (map != null) {
      DraftJsObject draftJsObject = DraftJsObject.fromJson(map);
      if (draftJsObject != null && draftJsObject.blocks != null) {
        for (int blockIndex = 0;
            blockIndex < draftJsObject.blocks.length;
            blockIndex++) {
          list.add(TextSpan(text: draftJsObject.blocks[blockIndex].text ?? ""));
        }
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children: []..addAll(getTextSpans())));
  }
}
