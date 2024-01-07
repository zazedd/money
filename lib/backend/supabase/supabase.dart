import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _supabaseUrl = 'https://edhxculkccbyptgfhwds.supabase.co';
const _supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVkaHhjdWxrY2NieXB0Z2Zod2RzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDMxNzE2OTUsImV4cCI6MjAxODc0NzY5NX0.8bpGQmDkGykPwspDGuTNfXHWipVPV8ga0tU0kZ5SOKw';

class SupabaseBackend {
  SupabaseBackend._();

  static SupabaseBackend? _instance;
  static SupabaseBackend get instance => _instance ??= SupabaseBackend._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _supabaseUrl,
        anonKey: _supabaseAnonKey,
        debug: false,
      );
}
