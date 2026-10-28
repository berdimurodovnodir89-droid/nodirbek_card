import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

/// Oq yumaloq karta: ikonka/label + qiymat + o'ng tomonda amal belgisi.
/// [uri] berilsa — tashqi ilovada ochadi, aks holda qiymatni nusxalaydi.
class InfoTile extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final String value;
  final Uri? uri;

  const InfoTile({
    super.key,
    this.icon,
    this.label,
    required this.value,
    this.uri,
  });

  static const _teal = Color(0xFF009688);

  Future<void> _onTap(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    if (uri != null) {
      final ok = await launchUrl(uri!, mode: LaunchMode.externalApplication);
      if (!ok) {
        messenger.showSnackBar(
          const SnackBar(content: Text("Ilovani ochib bo'lmadi")),
        );
      }
    } else {
      await Clipboard.setData(ClipboardData(text: value));
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Nusxalandi'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black45,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => _onTap(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: _teal),
                  const SizedBox(width: 16),
                ],
                if (label != null)
                  SizedBox(
                    width: 84,
                    child: Text(
                      label!,
                      style: const TextStyle(
                        color: _teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 15,
                    ),
                  ),
                ),
                Icon(
                  uri != null ? Icons.open_in_new : Icons.copy,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
