# football_shop_mobile
Michael Stephen Daniel Panjaitan
2406496321
PBP A

<summary>Tugas 7</summary>
<details>
Widget Tree adalah representasi logis dari semua widget tampilan yang ada di mobile app. Setiap widget berupa node dalam node tree yang dapat memiliki hubungan parent-child dengan node lain. Pada hubungan Parent-Child parent dapat menentukan posisi, gaya, atau perilaku child di dalamnya, sedangkan child memberi isi (content) kepada parent.

Pada proyek ini saya menggunakan widget Scaffold, AppBar, Row, Center, ElevatedButton, Text, TextStyle, SnackBar, MaterialApp, ThemeData, Colors.
- MaterialApp berfungsi sebagai pembungkus besar aplikasi yang mengatur tema, judul aplikasi, dan halaman awal.
- ThemeData berfungsi untuk menentukan style dasar aplikasi seperti warna dasar dan jenis font.
- Scaffold adalah widget struktur dasar halaman Material Design. Widget ini melingkupi elemen-elemen di halaman seperti appbar, body, drawer, dan lain-lain.
- AppBar berfungsi membuat header pada halaman. Di sini saya beri judul "Football Shop".
- Row berfungsi untuk menyusun elemen tampilan secara horizontal. Saya gunakan untuk menyusun ketiga tombol secara horizontal.
- Center berfungsi untuk memusatkan widget Row saya yang berisi tombol ke tengah halaman.
- ElevatedButton adalah widget tombol yang saya gunakan untuk membuat tombol berbentuk pil yang terlihat lebih tinggi dari pada elemen di sekitarnya.
- Text adalah widget untuk menuliskan teks pada berbagai widget seperti pada tombol, header, dan snackbar.
- TextStyle adalah widget style untuk mengubah tampilan teks sesuai yang saya inginkan.
- SnackBar adalah widget tampilan yang muncul di bawah layar ketika tombol di halaman ditekan.
- Colors adalah widget untuk memberikan warna ke semua widget tampilan di proyek saya.

MaterialApp adalah widget pembungkus utama (root-level widget) yang digunakan untuk membangun aplikasi dengan gaya Material Design — yaitu sistem desain yang dikembangkan oleh Google. MaterialApp menyiapkan fondasi visual dan navigasi untuk seluruh aplikasi Flutter berbasis Material.
MaterialApp sering dipakai sebagai root widget karena menyediakan kerangka dasar aplikasi Material Design yang mencakup theme & color scheme, navigator & routing, localisation & accessibility, dan integrasi yang baik dengan widget Material seperti Scaffold atau Appbar.

Perbedaan Stateless & Stateful Widget:
- Tampilan Stateless selalu sama, sedangkan Stateful dapat berubah sesuai dengan keadaan/state yang dimilikinya.
- Stateless tidak menyimpan data/variabel yang bisa berubah. Data/variabel di Stateful dapat berubah, menyebabkan tampilan atau cara kerjanya dapat berbeda tergantung pada data (state) widget tersebut.
- Stateless cocok untuk elemen-elemen aplikasi yang tidak akan mengalami perubahan, seperti header yang menyimpan logo dan nama aplikasi. Stateful cocok jika misal widget memiliki data yang berubah akibat interaksi user.

BuildContext adalah objek yang merepresentasikan lokasi (posisi) suatu widget di dalam widget tree Flutter. BuildContext memberitahu “di mana widget ini berada” dalam widget tree aplikasi. BuildContext penting karena olehnya widget bisa mengakses data dari parent widget dan membangun UI berdasarkan posisi tertentu di tree. Pada method build(), BuildContext menjadi parameter method (otomatis oleh Flutter). Misal sebuah widget memanggil Theme.of(context) untuk membuat theme, Flutter mencari ke atas tree untuk mendapatkan Theme terdekat. Flutter tahu dari konteks mana ia mencari elemen yang dibutuhkan.

Hot reload adalah fitur Flutter yang memungkinkan developer melihat efek perubahan kode secara instan di aplikasi yang sedang berjalan, tanpa kehilangan state (keadaan) aplikasi. Flutter hanya memperbarui bagian kode yang berubah dan membangun ulang widget tree yang terpengaruh tanpa kehilangan state. Bedanya dengan Hot restart adalah Hot restart memperbarui bagian aplikasi yang berubah tapi kemudian menjalankan ulang aplikasi Flutter, sehingga mereset state dan data-data ke kondisi awal app berjalan.
</details>

<summary>TUGAS 8</summary>
<details>
Perbedaan Navigator.push() dan Navigator.pushReplacement() adalah push() menambah halaman di atas halaman sebelumnya yang sedang tampil. Jika user menekan tombol Back, Flutter akan kembali ke halaman sebelumnya. Sedangkan pushReplacement() mengganti halaman yang ada saat ini di stack dengan halaman baru, sehingga user tidak bisa kembali ke halaman sebelumnya jika menekan tombol Back. Fungsi push() cocok digunakan untuk navigasi ke halaman daftar produk dan produk detail, sedangkan pushReplacement() cocok untuk navigasi ke halaman utama dan setelah form.

Saya menggunakan AppBar untuk mendesain header pada halaman aplikasi, Drawer untuk membuat fitur *header* di bagian kiri halaman, dan Scaffold untuk membentuk tampilan body masing-masing halaman aplikasi.

Padding berguna memberi jarak di sekitar widget sehingga membuat tampilan form tersusun rapi tidak menempel ke pinggir layar atau elemen lain dan semacamnya. Padding saya gunakan di halaman form produk pada setiap widget input.
SingleChildScrollView berguna membungkus konten sehingga bisa di-*scroll* ketika isi konten tidak muat di halaman. Widget ini mencegah overflow error akibat konten yang terlalu besar dan memudahkan form yang panjang tetap bisa diakses leluasa di layar kecil. Widget ini saya gunakan untuk isian kategori produk di form yang bisa dipilih user. 
ListView menampilkan daftar elemen dalam bentuk *scrollable list*. ListView otomatis *scrollable*, efisien karena hanya merender widget yang terlihat di layar, dan cocok digunakan untuk elemen yang jumlahnya dinamis atau panjang. ListView saya gunakan pada widget drawer di left_drawer.dart.

Saya menggunakan colorscheme warna hijau muda sebagai warna primer (`lightGreen`) dan hijau muda cerah sebagai warna sekunder (`lightGreenAccent[400]`) yang bekerja di seluruh aplikasi sebagai warna dasar untuk menyesuaikan dengan warna tema di aplikasi web saya. Colorscheme ini menjadi acuan warna pada widget-widget di aplikasi yang mungkin memakai variasi warna berbeda sehingga masih menyatu dengan tema keseluruhan.
</details>
