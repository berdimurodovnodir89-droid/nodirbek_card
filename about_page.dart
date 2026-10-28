import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/gradient_background.dart';
import '../widgets/info_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Men haqimda',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      const InfoTile(label: 'Ism', value: Profile.name),
                      const InfoTile(label: 'Lavozim', value: Profile.role),
                      const InfoTile(label: "Ta'lim", value: Profile.education),
                      const InfoTile(label: 'Manzil', value: Profile.address),
                      InfoTile(
                        label: 'Telefon',
                        value: Profile.phone,
                        uri: Profile.phoneUri,
                      ),
                      InfoTile(
                        label: 'Email',
                        value: Profile.email,
                        uri: Profile.emailUri,
                      ),
                      InfoTile(
                        label: 'Telegram',
                        value: Profile.telegram,
                        uri: Profile.telegramUri,
                      ),
                      InfoTile(
                        label: 'Instagram',
                        value: Profile.instagram,
                        uri: Profile.instagramUri,
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
