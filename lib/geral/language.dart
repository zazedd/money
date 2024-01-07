import 'dart:convert';

import '/backend/supabase/supabase.dart';
import '/geral/util.dart';

class Language {
  Map<String, String> linguagem = Map();

  Future<void> fetchData() async {
    try {
      var json =
          SupabaseBackend.client.storage.from('jsons').download('textos.json');
      var value = await json; // await the download

      setTextos(utf8.decode(value));
      print_("Fetched Language Data");
    } catch (e) {
      linguagem = {};
      print_(
          "textos.json could not be fetched, default strings will be used instead");
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

Language lang = Language();

Future<void> initializeLanguage() async {
  await lang.fetchData();
}
