import 'dart:convert';

import '/backend/supabase/supabase.dart';
import 'package:flutter/material.dart';

class ColorMap {
  Map<String, Color> colors = Map();

  Future<void> fetchData() async {
    var json =
        SupabaseBackend.client.storage.from('jsons').download('cores.json');
    var value = await json;
    setCores(utf8.decode(value));
    print("Fetched Language Data");
  }

  void setCores(String body) {
    Map<String, dynamic> r = jsonDecode(body);
    r.forEach((key, value) {
      var ss = value as String;
      Color cor = Color(int.parse(ss, radix: 16));
      print(ss);
      colors[key] = cor;
    });
  }

  Color get(String key, Color def) {
    return colors[key] ?? def;
  }
}

ColorMap colors = ColorMap();

Future<void> initializeColors() async {
  await colors.fetchData();
}
