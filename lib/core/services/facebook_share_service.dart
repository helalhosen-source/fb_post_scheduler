import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class FacebookShareService {
  static Future<void> shareToFacebook(String caption, {String? imagePath}) async {
    // 1. Text auto-copy to system clipboard
    await Clipboard.setData(ClipboardData(text: caption));

    // 2. Try launching Facebook App via URL Scheme or Share Intent
    if (imagePath != null && imagePath.isNotEmpty) {
      // Share image + caption via SharePlus
      await Share.shareXFiles(
        [XFile(imagePath)],
        text: caption,
      );
    } else {
      // Direct FB app URL scheme
      final Uri fbAppUri = Uri.parse("fb://composer");
      if (await canLaunchUrl(fbAppUri)) {
        await launchUrl(fbAppUri, mode: LaunchMode.externalApplication);
      } else {
        // Fallback to general share option
        await Share.share(caption);
      }
    }
  }
}
