"""url_launcher Android 11+ da ishlashi uchun AndroidManifest.xml ga <queries> qo'shadi."""
p = "android/app/src/main/AndroidManifest.xml"
s = open(p, encoding="utf-8").read()
if "<queries>" not in s:
    block = (
        "    <queries>\n"
        '        <intent><action android:name="android.intent.action.VIEW"/><data android:scheme="https"/></intent>\n'
        '        <intent><action android:name="android.intent.action.VIEW"/><data android:scheme="tel"/></intent>\n'
        '        <intent><action android:name="android.intent.action.VIEW"/><data android:scheme="mailto"/></intent>\n'
        "    </queries>\n"
    )
    s = s.replace("    <application", block + "    <application", 1)
    open(p, "w", encoding="utf-8").write(s)
    print("queries qo'shildi")
else:
    print("queries allaqachon bor")
