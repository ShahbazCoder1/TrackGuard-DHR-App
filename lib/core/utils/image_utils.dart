import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageUtils {
  static const _uuid = Uuid();

  /// Creates a durable local file copy in the app documents or cache directory
  static Future<File> persistCapturedImage(
    File sourceFile, {
    String prefix = 'img',
  }) async {
    final tempDir = await getTemporaryDirectory();
    final fileName = '${prefix}_${_uuid.v4()}.jpg';
    final targetPath = '${tempDir.path}/$fileName';
    return sourceFile.copy(targetPath);
  }

  /// Create a thumbnail file path or copy
  static Future<File> generateThumbnail(File sourceFile) async {
    return persistCapturedImage(sourceFile, prefix: 'thumb');
  }

  /// Prepares an optimized, downscaled image specifically for on-device VLM (LiteRT-LM) inference.
  /// Standardizes resolution to [maxDimension] (e.g. 1024) to prevent GPU/CPU VRAM OOM crashes.
  static Future<File> prepareOptimizedVisionImage(
    File sourceFile, {
    int maxDimension = 1024,
  }) async {
    try {
      final bytes = await sourceFile.readAsBytes();
      final descriptor = await ui.ImageDescriptor.encoded(
        await ui.ImmutableBuffer.fromUint8List(bytes),
      );

      final originalWidth = descriptor.width;
      final originalHeight = descriptor.height;

      int targetWidth;
      int targetHeight;

      if (originalWidth > originalHeight) {
        if (originalWidth > maxDimension) {
          targetWidth = maxDimension;
          targetHeight =
              (originalHeight * (maxDimension / originalWidth)).round();
        } else {
          targetWidth = originalWidth;
          targetHeight = originalHeight;
        }
      } else {
        if (originalHeight > maxDimension) {
          targetHeight = maxDimension;
          targetWidth =
              (originalWidth * (maxDimension / originalHeight)).round();
        } else {
          targetWidth = originalWidth;
          targetHeight = originalHeight;
        }
      }

      final codec = await descriptor.instantiateCodec(
        targetWidth: targetWidth,
        targetHeight: targetHeight,
      );
      final frame = await codec.getNextFrame();
      final image = frame.image;
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        return sourceFile;
      }

      final tempDir = await getTemporaryDirectory();
      final targetPath = '${tempDir.path}/vision_${_uuid.v4()}.png';
      final targetFile = File(targetPath);
      await targetFile.writeAsBytes(byteData.buffer.asUint8List());

      debugPrint(
        'Optimized vision image: ${originalWidth}x$originalHeight -> ${targetWidth}x$targetHeight (${targetFile.lengthSync()} bytes)',
      );
      return targetFile;
    } catch (e) {
      debugPrint(
        'Failed to optimize image for vision model: $e. Using original.',
      );
      return sourceFile;
    }
  }
}
