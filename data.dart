/// Ilovadagi barcha shaxsiy ma'lumotlar bitta joyda.
/// O'zgartirmoqchi bo'lsangiz, faqat shu faylni tahrirlang.
class Profile {
  static const name = 'Berdimurodov Nodirbek';
  static const role = 'Backend Developer';
  static const education = 'TATU SF';
  static const address = 'Qashqadaryo';

  static const phone = '+998 77 290 04 08';
  static const phoneRaw = '+998772900408';
  static const email = 'berdimurodovnodir@icloud.com';
  static const telegram = '@muslimm_04';
  static const instagram = '@muslimm_04_';

  static Uri get phoneUri => Uri.parse('tel:$phoneRaw');
  static Uri get emailUri => Uri.parse('mailto:$email');
  static Uri get telegramUri =>
      Uri.parse('https://t.me/${telegram.replaceFirst('@', '')}');
  static Uri get instagramUri =>
      Uri.parse('https://instagram.com/${instagram.replaceFirst('@', '')}');

  /// Galereyadagi rasmlar soni: assets/gallery/1.jpg ... 9.jpg
  static const galleryCount = 9;
}
