import 'dart:convert';

import 'package:flutter/material.dart';
import '/backend/supabase/supabase.dart';

class ColorMap extends InheritedWidget {
  Map<String, Color> colors = Map();

  void setTextos(String body) {
    // Map<String, dynamic> r = JsonDecoder().convert(body);
    Map<String, dynamic> r = jsonDecode(body);
    r.forEach((key, value) {
      var ss = value as String;
      colors[key] = Color(int.parse(ss, radix: 16));
    });
  }

  ColorMap({
    required Widget child,
  }) : super(child: child) {
    return;
  }

  Future<String> fetchData() async {
    try {
      var json =
          await SupabaseBackend.client.storage.from('jsons').download('textos.json');
      setTextos(utf8.decode(json));
    } catch (e) {
      var ee = e.toString();
      print("Error : $ee");
    }

    return "Fetched Data";
  }

  static ColorMap? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorMap>();
  }

  Color get(String key, Color def) {
    return colors[key] ?? def;
  }

  @override
  bool updateShouldNotify(ColorMap oldWidget) {
    return oldWidget.colors != colors;
  }
}
