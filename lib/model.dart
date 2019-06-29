class _Block {
  String key;
  String text;
  String type;
  int depth;
  List<_InlineStyleRange> inlineStyleRanges;
  List<_EntityRange> entityRanges;

  _Block(
      {this.key,
      this.text,
      this.type,
      this.depth,
      this.inlineStyleRanges,
      this.entityRanges});

  static List<_Block> getList(map) {
    List<_Block> blocks = List();
    for (int i = 0; i < map.lenght; i++) {
      blocks.add(_Block.fromJson(map[i]));
    }
    return blocks;
  }

  factory _Block.fromJson(Map<String, dynamic> map) => _Block(
      key: map["key"],
      text: map["text"],
      type: map["type"],
      depth: map["depth"] ?? 0,
      inlineStyleRanges: map["inlineStyleRanges"] == null
          ? null
          : _InlineStyleRange.getList(map["inlineStyleRanges"]),
      entityRanges: map["entityRanges"] == null
          ? null
          : _EntityRange.getList(map["entityRanges"]));
}

class _InlineStyleRange {
  int offset;
  int length;
  String style;

  _InlineStyleRange({this.offset, this.length, this.style});

  static List<_InlineStyleRange> getList(List<dynamic> map) {
    List<_InlineStyleRange> inlineStyleList = List();
    for (int i = 0; i < map.length; i++) {
      inlineStyleList.add(_InlineStyleRange.fromJson(map[i]));
    }
    return inlineStyleList;
  }

  factory _InlineStyleRange.fromJson(Map<String, dynamic> map) =>
      _InlineStyleRange(
          offset: map["offset"] ?? 0,
          length: map["lenght"] ?? 0,
          style: map["style"]);
}

class _EntityRange {
  int offset;
  int length;
  int key;

  _EntityRange({this.offset, this.length, this.key});

  factory _EntityRange.fromJson(Map<String, dynamic> map) => _EntityRange(
      offset: map["offset"] ?? 0,
      length: map["length"] ?? 0,
      key: map["key"] ?? 0);

  static List<_EntityRange> getList(List<dynamic> map) {
    List<_EntityRange> list = List();
    for (int i = 0; i < map.length; i++) {
      map.add(_EntityRange.fromJson(map[i]));
    }
    return list;
  }
}

class _EntityMapData {
  String url;
  String targetOption;

  _EntityMapData({this.url, this.targetOption});

  factory _EntityMapData.fromJson(Map<String, dynamic> map) =>
      _EntityMapData(url: map["url"], targetOption: map["targetOption"]);
}

class EntityMap {
  String type;
  String mutability;
  _EntityMapData data;

  EntityMap({this.type, this.mutability, this.data});

  static Map<String, EntityMap> getEntityMap(Map<String, dynamic> map) {
    Map<String, EntityMap> _map = Map();
    if (map != null) {
      map.forEach((key, value) =>
          _map.putIfAbsent(key, () => EntityMap.fromJson(value)));
    }
    return _map;
  }

  factory EntityMap.fromJson(Map<String, dynamic> map) => EntityMap(
        type: map["type"],
        mutability: map["mutability"],
        data: _EntityMapData.fromJson(map["data"]),
      );
}

class DraftJsObject {
  List<_Block> blocks;
  Map<String, EntityMap> entityMap;

  DraftJsObject({this.blocks, this.entityMap});

  factory DraftJsObject.fromJson(Map<String, dynamic> map) => DraftJsObject(
      blocks: map["blocks"] == null ? null : _Block.getList(map["blocks"]),
      entityMap: map["entityMap"] == null
          ? null
          : EntityMap.getEntityMap(map["entityMap"]));
}
