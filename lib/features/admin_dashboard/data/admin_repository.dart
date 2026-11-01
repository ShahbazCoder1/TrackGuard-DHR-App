import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/models/app_user.dart';
import '../../../shared/models/hazard_report.dart';
import '../../../shared/models/inspection_status.dart';
import '../../../shared/models/user_role.dart';
import '../../reports/data/supabase_report_mapper.dart';

/// Remote data access for the admin portal.
/// Supabase RLS remains the real authorization boundary.
class AdminRepository {
  AdminRepository(this._client);
  final SupabaseClient _client;

  Future<List<HazardReport>> fetchReports() async {
    final rows = await _client
        .from('reports')
        .select()
        .order('created_at', ascending: false)
        .limit(100);
    return rows
        .map<HazardReport>(
          (row) => SupabaseReportMapper.fromRemoteRow(
            Map<String, dynamic>.from(row),
          ),
        )
        .toList();
  }

  Future<HazardReport?> fetchReport(String id) async {
    final row = await _client
        .from('reports')
        .select()
        .eq('id', id)
        .maybeSingle();
    if (row == null) return null;
    return SupabaseReportMapper.fromRemoteRow(Map<String, dynamic>.from(row));
  }

  /// Fetches the remote media URL from the report_media table and Supabase storage.
  Future<String?> fetchReportMediaUrl(String reportId) async {
    try {
      final row = await _client
          .from('report_media')
          .select('original_path, thumbnail_path')
          .eq('report_id', reportId)
          .maybeSingle();

      if (row == null) return null;
      final path = (row['original_path'] ?? row['thumbnail_path']) as String?;
      if (path == null || path.isEmpty) return null;

      try {
        final signedUrl = await _client.storage
            .from('report-media')
            .createSignedUrl(path, 60 * 60);
        if (signedUrl.isNotEmpty) return signedUrl;
      } catch (_) {
        // Fall back to getPublicUrl if signed URL generation fails
      }
      return _client.storage.from('report-media').getPublicUrl(path);
    } catch (e) {
      debugPrint('Error fetching report media url: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> fetchHistory(String reportId) async {
    final rows = await _client
        .from('report_status_history')
        .select(
          'id, report_id, changed_by, from_status, to_status, comment, created_at',
        )
        .eq('report_id', reportId)
        .order('created_at', ascending: false);
    return rows
        .map<Map<String, dynamic>>((row) => Map<String, dynamic>.from(row))
        .toList();
  }

  Future<List<AppUser>> fetchProfiles() async {
    final rows = await _client
        .from('profiles')
        .select()
        .order('created_at', ascending: false)
        .limit(200);
    return rows
        .map<AppUser>((row) => AppUser.fromJson(Map<String, dynamic>.from(row)))
        .toList();
  }

  Future<void> updateStatus(String reportId, InspectionStatus status) async {
    await _client
        .from('reports')
        .update({
          'inspection_status': status.toJson(),
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', reportId);
  }

  Future<void> updateProfile({
    required String id,
    required bool isActive,
    required UserRole role,
    required String? assignedSection,
  }) async {
    await _client
        .from('profiles')
        .update({
          'is_active': isActive,
          'role': role.name,
          'assigned_section': assignedSection,
          'updated_at': DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', id);
  }
}
