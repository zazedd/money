import 'dart:convert';

import 'package:flutter/material.dart';

import '/backend/supabase/supabase.dart';
import '/geral/util.dart';

class Language {
  Language(String? loc);

  String? loc;

  Map<String, String> linguagem = Map();

  Future<void> fetchData() async {
    try {
      print_("language.dart loc ${loc.toString()}");
      String jsonName =
          (loc == null || loc == "pt") ? "textos.json" : "texts.json";
      var json =
          SupabaseBackend.client.storage.from('jsons').download(jsonName);
      var value = await json; // await the download

      setTextos(utf8.decode(value));
      print_("Fetched Language Data");
    } catch (e) {
      linguagem = {};
      print_("json could not be fetched, default strings will be used instead");
    }
  }

  void setTextos(String body) {
    Map<String, dynamic> r = jsonDecode(body);
    r.forEach((key, value) {
      var ss = value as String;
      linguagem[key] = ss;
    });
  }

  String get(String key, String def) {
    return linguagem[key] ?? def;
  }
}
