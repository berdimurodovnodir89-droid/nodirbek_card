# Nodirbek Card

Backend dasturchining raqamli vizitka ilovasi (Flutter).

## Imkoniyatlar
- Pastki navigatsiya paneli: **Bosh sahifa**, **Men haqimda**, **Rasmlarim**
- Bosh sahifada rasm, ism, kasb va 4 ta aloqa kartasi (telefon, email, Telegram, Instagram)
- Tungi rejim (yuqori o'ngdagi tugma)
- «Men haqimda»da qiymatni nusxalash, aloqa havolalarini tashqi ilovada ochish
- Rasmlar galereyasi (9 ta), bosilganda kattalashadi

## Ishga tushirish
```bash
flutter create --platforms=android --org uz.nodirbek .   # faqat bir marta
python3 tool/patch_manifest.py                           # url_launcher uchun
flutter pub get
flutter run
```

## Ma'lumotlarni o'zgartirish
Barcha matnlar `lib/data.dart` faylida. Profil rasmi: `assets/images/profile.png`.
Galereya rasmlarini `assets/gallery/1.jpg … 9.jpg` nomi bilan qo'ying.

## GitHub'da APK yig'ish
`main` branchga push qilsangiz, **Actions → Build APK** ishga tushadi va tugagach
`nodirbek-card-apk` artefaktidan `app-release.apk` ni yuklab olasiz.
