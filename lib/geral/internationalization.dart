import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language.dart';
import 'util.dart';

const _kLocaleStorageKey = '__locale_key__';

class CustomLocalizations {
  CustomLocalizations(this.locale);

  final Locale locale;

  static CustomLocalizations of(BuildContext context) =>
      Localizations.of<CustomLocalizations>(context, CustomLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late Language lang;

  static late SharedPreferences _prefs;
  static Future initialize() async {
    _prefs = await SharedPreferences.getInstance();
    print_("Stored locale ${getStoredLocale().toString()}");
    lang = Language(getStoredLocale().toString());
    await lang.fetchData();
  }

  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap =
    <Map<String, Map<String, String>>>[].reduce((a, b) => a..addAll(b));
