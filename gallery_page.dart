import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/gradient_background.dart';

/// Rasmlar: assets/gallery/1.jpg ... 9.jpg
/// Rasm topilmasa — o'rniga kulrang belgi ko'rsatiladi.
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  Widget _image(int n, {BoxFit fit = BoxFit.cover}) {
    return Image.asset(
      'assets/gallery/$n.jpg',
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        color: Colors.white24,
        child: const Icon(Icons.image, color: Colors.white54, size: 40),
      ),
    );
  }

  void _open(BuildContext context, int n) {
    showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(12),
        child: InteractiveViewer(child: _image(n, fit: BoxFit.contain)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Rasmlarim',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: Profile.galleryCount,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () => _open(context, i + 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _image(i + 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
