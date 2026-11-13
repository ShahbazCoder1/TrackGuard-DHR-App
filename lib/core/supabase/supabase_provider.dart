import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/app_env.dart';

final supabaseClientProvider = Provider<SupabaseClient?>((ref) {
  if (!AppEnv.hasValidSupabaseConfiguration) {
    return null;
  }

  try {
    return Supabase.instance.client;
  } catch (_) {
    return null;
  }
});
