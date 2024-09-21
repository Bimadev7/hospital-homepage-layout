import 'package:flutter/material.dart';

void main() {
  runApp(HospitalApp());
}

class HospitalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RS.BIM'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Action untuk pencarian
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action untuk notifikasi
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Aksi menuju profil pengguna
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Promosi
            Container(
              height: 200,
              color: Colors.teal[100],
              child: Center(child: Text('Banner Promosi atau Informasi')),
            ),

            // Quick Links
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildQuickLink(
                      context, Icons.local_hospital, 'Layanan Medis'),
                  _buildQuickLink(context, Icons.schedule, 'Jadwal Dokter'),
                  _buildQuickLink(
                      context, Icons.location_on, 'Informasi Lokasi'),
                  _buildQuickLink(context, Icons.article, 'Artikel Kesehatan'),
                ],
              ),
            ),

            // Artikel Kesehatan (Dapat dinamis dari API)
            _buildSectionTitle('Artikel Kesehatan'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3, // Misalnya ada 3 artikel
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Artikel ${index + 1}'),
                  subtitle: Text('Ringkasan artikel kesehatan...'),
                );
              },
            ),

            // Kontak Darurat
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.call),
                label: Text('Kontak Darurat'),
                onPressed: () {
                  // Action untuk kontak darurat
                },
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(context), // Sidebar untuk navigasi
    );
  }

  Widget _buildQuickLink(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // Aksi sesuai dengan link yang ditekan
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'Menu Navigasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Layanan Medis'),
            onTap: () {
              // Navigasi ke halaman layanan medis
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Jadwal Dokter'),
            onTap: () {
              // Navigasi ke halaman jadwal dokter
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Tentang Kami'),
            onTap: () {
              // Navigasi ke halaman tentang kami
            },
          ),
        ],
      ),
    );
  }
}
