import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/gradient_background.dart';
import '../widgets/info_tile.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final VoidCallback onOpenAbout;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.onOpenAbout,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return GradientBackground(
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                tooltip: 'Mavzuni almashtirish',
                onPressed: onToggleTheme,
                icon: Icon(
                  dark ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(blurRadius: 14, color: Colors.black38),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        Profile.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        Profile.role,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 28),
                      InfoTile(
                        icon: Icons.phone,
                        value: Profile.phone,
                        uri: Profile.phoneUri,
                      ),
                      InfoTile(
                        icon: Icons.email,
                        value: Profile.email,
                        uri: Profile.emailUri,
                      ),
                      InfoTile(
                        icon: Icons.send,
                        value: Profile.telegram,
                        uri: Profile.telegramUri,
                      ),
                      InfoTile(
                        icon: Icons.photo_camera,
                        value: Profile.instagram,
                        uri: Profile.instagramUri,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton.tonalIcon(
                          onPressed: onOpenAbout,
                          icon: const Icon(Icons.person),
                          label: const Text('Men haqimda'),
                        ),
                      ),
                    ],
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
