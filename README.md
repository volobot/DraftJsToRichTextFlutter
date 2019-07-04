# Draft Js to RichText Flutter

This is draft JS to TextSpan Rich text flutter.

## Getting Started

This project takes draft js json (flutter Map) object and return Rich Text widget.
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be used to show Rich Text in flutter application

## Dependency

```
draft_js_to_textspan_flutter: <version>
```
## Usage

```dart
@override
   Widget build(BuildContext context) {
     Map<String,dynamic> map=json.decode(draftJson);
     return DraftJSFlutter(map);
   }
```
