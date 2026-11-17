# 🌏 Galeri Wisata

Mini-Proyek — Pemrograman Mobile (INF23531)
**Kelompok 8** - Tema: Galeri Wisata / Destinasi

## Tentang Aplikasi

Galeri Wisata adalah aplikasi katalog destinasi wisata sederhana yang dibuat dengan **Flutter** dan **Material 3**. Aplikasi menampilkan 10 destinasi populer di Indonesia (Gunung Bromo, Pantai Pulau Merah, Kawah Ijen, Candi Borobudur, Pantai Kuta, Raja Ampat, Danau Toba, Taman Nasional Komodo, Malioboro, dan Kebun Raya Bogor).

### Fitur

- **Katalog destinasi** dengan dua mode tampilan: `ListView.builder` dan `GridView.builder` (bisa di-toggle)
- **Filter kategori** — halaman pilihan kategori mengembalikan data ke halaman katalog (`await Navigator.push` + `Navigator.pop(context, nilai)`)
- **Halaman detail** — menerima data destinasi lewat constructor (nama, lokasi, kategori, harga tiket, deskripsi)
- **Navigasi** — Named Routes (`/`, `/profil`, `/tentang`), `Drawer`, dan `BottomNavigationBar` (Home & Profil)
- **Model data** `Destinasi` dengan format harga rupiah (`Rp 35.000` / `Gratis`)

## Anggota & Jobdesk

| Nama | NIM | Jobdesk |
|------|-----|---------|
| Hanif Maulana Akrama | 241080200049 | Ketua / Koordinator |
| Al-Zastrouw Mulla Sadra | 241080200052 | Data & Model |
| Noval Bagas Irianto | 241080200024 | ListTile & Gridview
| Ryan Danauarta | 231080200110 | Dokumentasi & Laporan |

## Cara Menjalankan di Device Lokal

### 1. Prasyarat

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi stabil terbaru, mendukung Material 3)
- Editor: VS Code (ekstensi Flutter & Dart) atau Android Studio
- Emulator Android / HP dengan USB debugging aktif (atau Chrome untuk versi web)

Cek instalasi:

```bash
flutter doctor
```

Pastikan tidak ada error pada bagian Flutter dan toolchain yang akan dipakai.

### 2. Ambil Source Code

```bash
git clone https://github.com/sadra26/UTS_Pemrograman_Mobile_Galeri_Wisata_KEL_8.git
cd UTS_Pemrograman_Mobile_Galeri_Wisata_KEL_8
```

### 3. Pastikan Asset Gambar Terdaftar

Gambar destinasi dibaca dari `assets/images/`. Pastikan folder tersebut berisi file berikut:

`Bromo.jpg`, `pulauMerah.jpg`, `kawahIjen.jpg`, `borobudur.jpg`, `kuta.jpg`, `rajaAmpat.jpg`, `danauToba.jpg`, `komodo.jpg`, `malioboro.jpg`, `kebunRayaBogor.jpg`

Lalu daftarkan di `pubspec.yaml` (perhatikan indentasi):

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

> Nama file bersifat *case-sensitive*. Jika gambar belum ada atau belum terdaftar, aplikasi tetap jalan dan menampilkan ikon sebagai pengganti.

### 4. Install Dependency

```bash
flutter pub get
```

### 5. Jalankan Aplikasi

Lihat device yang tersedia:

```bash
flutter devices
```

Jalankan di device pilihan:

```bash
flutter run                # pilih device otomatis / interaktif
flutter run -d chrome      # jalankan di browser
flutter run -d <device_id> # jalankan di device tertentu
```

Saat aplikasi berjalan, tekan `r` untuk *hot reload* dan `R` untuk *hot restart*.

### 6. Troubleshooting

| Masalah | Solusi |
|---------|--------|
| Gambar tidak muncul | Cek folder `assets/images/`, nama file, dan blok `assets:` di `pubspec.yaml`, lalu `flutter clean` → `flutter pub get` |
| Device tidak terdeteksi | Nyalakan emulator / USB debugging, lalu cek `flutter devices` |
| Error versi SDK | Jalankan `flutter upgrade` |
| Build error aneh | `flutter clean` lalu `flutter pub get` dan jalankan ulang |

---
