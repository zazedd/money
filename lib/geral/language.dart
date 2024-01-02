import 'dart:convert';

import '/backend/supabase/supabase.dart';

class Language {
  Map<String, String> linguagem = Map();

  Future<void> fetchData() async {
    var json =
        SupabaseBackend.client.storage.from('jsons').download('textos.json');
    var value = await json; // await the download
    setTextos(utf8.decode(value));
    print("Fetched Language Data");
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
