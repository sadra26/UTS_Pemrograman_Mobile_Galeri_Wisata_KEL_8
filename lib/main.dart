// ============================================================
// MINI-PROYEK PJBL-1 • Pemrograman Mobile (INF23531)
// Tema   : Galeri Wisata / Destinasi
// Acuan  : Panduan PJBL-1 (P6) + Slide Pertemuan 7
// Fitur  : Model + List (>= 8 item), ListView/GridView.builder,
//          Card + ListTile, AppBar + Material 3 (fromSeed),
//          Navigator.push + passing data via constructor (Detail),
//          Named routes, Drawer, BottomNavigationBar (Home & Profil),
//          return data (await Navigator.pop) untuk pilihan kategori
// ============================================================

import 'package:flutter/material.dart';

// ------------------------------------------------------------
// 1) CLASS MODEL  (P6 Langkah 1)
// ------------------------------------------------------------
class Destinasi {
  final String nama;
  final String gambar;
  final String lokasi;
  final String kategori;
  final int harga; 
  final String deskripsi;
  final IconData ikon;

  const Destinasi({
    required this.nama,
    required this.gambar,
    required this.lokasi,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
    required this.ikon,
  });
}

class _GambarDestinasi extends StatelessWidget {
  final Destinasi destinasi;
  final double width;
  final double height;
  final Widget placeholder;

  const _GambarDestinasi({
    required this.destinasi,
    required this.width,
    required this.height,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if (destinasi.gambar.isEmpty) return placeholder;

    return Image.asset(
      destinasi.gambar,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => placeholder,
    );
  }
}

// ------------------------------------------------------------
// 2) DATA (P6 Langkah 2) — 10 item (syarat minimal 8)
// ------------------------------------------------------------
const List<Destinasi> daftarDestinasi = [
  Destinasi(
    nama: 'Gunung Bromo',
    gambar: 'assets/images/Bromo.jpg',
    lokasi: 'Probolinggo, Jawa Timur',
    kategori: 'Gunung',
    harga: 35000,
    deskripsi:
        'Gunung berapi aktif dengan lautan pasir dan panorama matahari terbit '
        'yang terkenal di Taman Nasional Bromo Tengger Semeru.',
    ikon: Icons.landscape,
  ),
  Destinasi(
    nama: 'Pantai Pulau Merah',
    gambar: 'assets/images/pulauMerah.jpg',
    lokasi: 'Banyuwangi, Jawa Timur',
    kategori: 'Pantai',
    harga: 10000,
    deskripsi:
        'Pantai berpasir dengan bukit kecil berwarna kemerahan; ombaknya '
        'cocok untuk belajar berselancar.',
    ikon: Icons.beach_access,
  ),
  Destinasi(
    nama: 'Kawah Ijen',
    gambar: 'assets/images/kawahIjen.jpg',
    lokasi: 'Banyuwangi, Jawa Timur',
    kategori: 'Gunung',
    harga: 15000,
    deskripsi:
        'Kawah dengan danau asam berwarna tosca dan fenomena api biru '
        '(blue fire) yang dapat dilihat dini hari.',
    ikon: Icons.terrain,
  ),
  Destinasi(
    nama: 'Candi Borobudur',
    gambar: 'assets/images/borobudur.jpg',
    lokasi: 'Magelang, Jawa Tengah',
    kategori: 'Sejarah',
    harga: 50000,
    deskripsi:
        'Candi Buddha terbesar di dunia peninggalan abad ke-9 yang '
        'menjadi Warisan Dunia UNESCO.',
    ikon: Icons.account_balance,
  ),
  Destinasi(
    nama: 'Pantai Kuta',
    gambar: 'assets/images/kuta.jpg',
    lokasi: 'Badung, Bali',
    kategori: 'Pantai',
    harga: 0,
    deskripsi:
        'Pantai populer dengan pasir putih, ombak untuk berselancar, dan '
        'suasana senja yang indah.',
    ikon: Icons.waves,
  ),
  Destinasi(
    nama: 'Raja Ampat',
    gambar: 'assets/images/rajaAmpat.jpg',
    lokasi: 'Papua Barat Daya',
    kategori: 'Bahari',
    harga: 500000,
    deskripsi:
        'Gugusan pulau karst dengan keanekaragaman hayati laut terkaya di '
        'dunia, surga bagi penyelam.',
    ikon: Icons.scuba_diving,
  ),
  Destinasi(
    nama: 'Danau Toba',
    gambar: 'assets/images/danauToba.jpg',
    lokasi: 'Sumatera Utara',
    kategori: 'Danau',
    harga: 20000,
    deskripsi:
        'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di '
        'tengahnya.',
    ikon: Icons.water,
  ),
  Destinasi(
    nama: 'Taman Nasional Komodo',
    gambar: 'assets/images/komodo.jpg',
    lokasi: 'Nusa Tenggara Timur',
    kategori: 'Bahari',
    harga: 150000,
    deskripsi:
        'Habitat asli komodo, kadal terbesar di dunia, dengan pantai pasir '
        'merah muda (Pink Beach).',
    ikon: Icons.pets,
  ),
  Destinasi(
    nama: 'Malioboro',
    gambar: 'assets/images/malioboro.jpg',
    lokasi: 'Yogyakarta',
    kategori: 'Kota',
    harga: 0,
    deskripsi:
        'Jalan ikonik Yogyakarta untuk wisata belanja, kuliner, dan '
        'budaya Jawa.',
    ikon: Icons.store,
  ),
  Destinasi(
    nama: 'Kebun Raya Bogor',
    gambar: 'assets/images/kebunRayaBogor.jpg',
    lokasi: 'Bogor, Jawa Barat',
    kategori: 'Alam',
    harga: 25000,
    deskripsi:
        'Kebun botani bersejarah yang menyimpan ribuan koleksi tumbuhan '
        'tropis di tengah kota.',
    ikon: Icons.park,
  ),
];

// Format rupiah sederhana: 350000 -> Rp 350.000
String formatRupiah(int angka) {
  if (angka == 0) return 'Gratis';
  final s = angka.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}

// ------------------------------------------------------------
// 3) MAIN + NAMED ROUTES  (P7: Named Routes)
// ------------------------------------------------------------
void main() => runApp(const GaleriWisataApp());

class GaleriWisataApp extends StatelessWidget {
  const GaleriWisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeri Wisata',
      debugShowCheckedModeBanner: false,
      // Tema Material 3 (syarat fitur no. 5)
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanUtama(),
        '/profil': (context) => const HalamanProfil(),
        '/tentang': (context) => const HalamanTentang(),
      },
    );
  }
}

// ------------------------------------------------------------
// 4) HALAMAN UTAMA: BottomNavigationBar (Home & Profil) + Drawer
// ------------------------------------------------------------
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _index = 0;

  // ganti tab = ganti isi body
  final List<Widget> _halaman = const [
    HalamanKatalog(),
    HalamanProfil(tampilkanAppBar: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_index == 0 ? 'Galeri Wisata' : 'Profil'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Drawer harus di Scaffold yang punya AppBar
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // tutup drawer
                setState(() => _index = 0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context); // tutup drawer
                Navigator.pushNamed(context, '/profil');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/tentang');
              },
            ),
          ],
        ),
      ),
      body: _halaman[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 5) HALAMAN KATALOG: ListView.builder / GridView.builder + Card
//    + pilih kategori (return data dengan await)
// ------------------------------------------------------------
class HalamanKatalog extends StatefulWidget {
  const HalamanKatalog({super.key});

  @override
  State<HalamanKatalog> createState() => _HalamanKatalogState();
}

class _HalamanKatalogState extends State<HalamanKatalog> {
  bool _tampilGrid = false; // false = ListView, true = GridView
  String _kategori = 'Semua';

  List<Destinasi> get _terfilter => _kategori == 'Semua'
      ? daftarDestinasi
      : daftarDestinasi.where((d) => d.kategori == _kategori).toList();

  // buka halaman pilih kategori & TUNGGU hasilnya (P7: return data)
  Future<void> _pilihKategori() async {
    final hasil = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => HalamanPilihKategori(terpilih: _kategori),
      ),
    );
    if (hasil != null) {
      setState(() => _kategori = hasil);
    }
  }

  // buka detail dengan mengirim data lewat constructor (P7: passing data)
  void _bukaDetail(Destinasi d) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HalamanDetail(destinasi: d)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _terfilter;

    return Column(
      children: [
        // bar kontrol: kategori + toggle List/Grid
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _pilihKategori,
                  icon: const Icon(Icons.filter_list),
                  label: Text('Kategori: $_kategori'),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filledTonal(
                tooltip: _tampilGrid ? 'Tampilan daftar' : 'Tampilan galeri',
                onPressed: () => setState(() => _tampilGrid = !_tampilGrid),
                icon: Icon(_tampilGrid ? Icons.view_list : Icons.grid_view),
              ),
            ],
          ),
        ),
        Expanded(
          child: data.isEmpty
              ? const Center(child: Text('Tidak ada destinasi.'))
              : (_tampilGrid ? _buildGrid(data) : _buildList(data)),
        ),
      ],
    );
  }

  // --- ListView.builder + Card + ListTile (P6 Langkah 3)
  Widget _buildList(List<Destinasi> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        final d = data[i];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: _GambarDestinasi(
                destinasi: d,
                width: 56,
                height: 56,
                placeholder: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(d.ikon),
                ),
              ),
            ),
            title: Text(d.nama),
            subtitle: Text('${d.kategori}  •  ${formatRupiah(d.harga)}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _bukaDetail(d),
          ),
        );
      },
    );
  }

  // --- GridView.builder (P6 Langkah 4)
  Widget _buildGrid(List<Destinasi> data) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: data.length,
      itemBuilder: (context, i) {
        final d = data[i];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _bukaDetail(d),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _GambarDestinasi(
                    destinasi: d,
                    width: double.infinity,
                    height: 100,
                    placeholder: Icon(d.ikon,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    d.nama,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(d.kategori, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(formatRupiah(d.harga)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ------------------------------------------------------------
// 6) HALAMAN PILIH KATEGORI -> mengembalikan data via pop(context, nilai)
// ------------------------------------------------------------
class HalamanPilihKategori extends StatelessWidget {
  final String terpilih;
  const HalamanPilihKategori({super.key, required this.terpilih});

  @override
  Widget build(BuildContext context) {
    // kumpulkan kategori unik dari data
    final kategori = <String>{'Semua', ...daftarDestinasi.map((d) => d.kategori)};

    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Kategori')),
      body: ListView(
        children: [
          for (final k in kategori)
            ListTile(
              leading: Icon(
                k == terpilih
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
              ),
              title: Text(k),
              onTap: () => Navigator.pop(context, k), // kirim balik
            ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 7) HALAMAN DETAIL — menerima data lewat constructor (required)
// ------------------------------------------------------------
class HalamanDetail extends StatelessWidget {
  final Destinasi destinasi;
  const HalamanDetail({super.key, required this.destinasi});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(destinasi.nama)), // tombol Back bawaan
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: _GambarDestinasi(
              destinasi: destinasi,
              width: double.infinity,
              height: 180,
              placeholder: Container(
                width: double.infinity,
                height: 180,
                color: warna.primaryContainer,
                child: Icon(destinasi.ikon, size: 96, color: warna.primary),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            destinasi.nama,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.place, size: 18),
              const SizedBox(width: 4),
              Expanded(child: Text(destinasi.lokasi)),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(destinasi.kategori)),
              Chip(
                avatar: const Icon(Icons.confirmation_number, size: 16),
                label: Text('Tiket: ${formatRupiah(destinasi.harga)}'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Deskripsi', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(destinasi.deskripsi),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// 8) HALAMAN PROFIL & TENTANG (diakses via named routes / tab)
//    -> ISI NAMA, NIM, DAN ANGGOTA KELOMPOK DI SINI
// ------------------------------------------------------------
class HalamanProfil extends StatelessWidget {
  final bool tampilkanAppBar;
  const HalamanProfil({super.key, this.tampilkanAppBar = true});

  @override
  Widget build(BuildContext context) {
    final isi = ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.groups),
            title: Text('Kelompok: 8'),
            subtitle: Text('Galeri Wisata / Destinasi'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Ketua / Koordinator'),
            subtitle: Text('(Hanif Maulana Akrama - 241080200049)'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.storage),
            title: Text('Data & Model'),
            subtitle: Text('(Al-Zastrouw Mulla Sadra - 241080200052)'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('UI Developer'),
            subtitle: Text('(Noval Bagas Irianto – 241080200024)'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.description),
            title: Text('Dokumentasi & Laporan'),
            subtitle: Text('(Ryan Danauarta – 231080200110)'),
          ),
        ),
      ],
    );

    if (!tampilkanAppBar) return isi;
    return Scaffold(appBar: AppBar(title: const Text('Profil')), body: isi);
  }
}

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Galeri Wisata adalah aplikasi katalog destinasi sederhana yang '
          'dibuat dengan Flutter untuk Mini-Proyek PJBL-1 mata kuliah '
          'Pemrograman Mobile (INF23531).',
        ),
      ),
    );
  }
}