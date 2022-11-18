import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class ImageCropper {
  ImageCropper._();
  static const MethodChannel _channel = MethodChannel('vn.ist.osin/native');

  static Future<String> cropper({
    required String source,
    required double ratio,
    required bool front,
  }) async {
    try {
      Map<String, dynamic> params;
      if (Platform.isIOS) {
        params = {
          'source': 'data:image/png;base64,$source',
          'ratio': ratio.toString(),
        };
      } else {
        params = {
          'source': source,
          'ratio': ratio,
          'front': front,
        };
      }

      final String result = await _channel.invokeMethod('cropImage', params);
      return result;
    } on PlatformException catch (e) {
      rethrow;
    }
  }

  static Future<String> cropFromFile({
    required List<String> source,
    required double ratio,
  }) async {
    try {
      Map<String, dynamic> params = {
        'ratio': ratio,
      };

      for (int i = 0; i < source.length; i++) {
        params.addEntries({'source${i+1}': source[i]}.entries);
      }

      final Uint8List result = await _channel.invokeMethod('cropImageFile', params);
      return base64Encode(result);
    } on PlatformException catch (e) {
      rethrow;
    }
  }

}