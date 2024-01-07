import 'dart:convert';

import '/backend/supabase/supabase.dart';
import 'package:flutter/material.dart';
import '/geral/util.dart';

class ColorMap {
  Map<String, Color> colors = Map();

  Future<void> fetchData() async {
    try {
      var json =
          SupabaseBackend.client.storage.from('jsons').download('cores.json');
      var value = await json;

      setCores(utf8.decode(value));
      print_("Fetched Language Data");
    } catch (e) {
      colors = {};
      print_(
          "cores.json could not be fetched, default color values will be used instead.");
      return;
    }
  }

  void setCores(String body) {
    Map<String, dynamic> r = jsonDecode(body);
    r.forEach((key, value) {
      var ss = value as String;
      print_(value);
      Color cor = Color(int.parse(ss, radix: 16));
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
