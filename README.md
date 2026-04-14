# Notes App - CRUD dengan SQLite

Aplikasi Flutter sederhana untuk mencatat (Create, Read, Update, Delete) yang menyimpan data ke SQLite database.

- **Create** - Tambah note baru  
- **Read** - Tampilkan semua notes dalam list  
- **Update** - Edit note yang sudah ada  
- **Delete** - Hapus note dengan konfirmasi  
- **Timestamp** - Setiap note menyimpan waktu pembuatan  
- **Sorting** - Notes ditampilkan dari terbaru ke terlama  

## Struktur Project

```
lib/
├── main.dart                      # Entry point aplikasi
├── models/
│   └── note.dart                 # Model Note dengan toMap() & fromMap()
├── database/
│   └── database_helper.dart      # SQLite CRUD operations
└── screens/
    ├── home_screen.dart          # Halaman utama list notes
    └── add_edit_note_screen.dart # Dialog tambah/edit note
```

## Dependencies

```yaml
dependencies:
  sqflite: ^2.3.0      # SQLite database
  path: ^1.8.3         # Path management
  intl: ^0.19.0        # Date formatting
```

## Instalasi & Menjalankan

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run Aplikasi
```bash
flutter run
```

## Cara Penggunaan

### Tambah Note
1. Tekan tombol **+** (FAB) di bawah kanan
2. Masukkan **Judul** dan **Konten**
3. Tekan tombol **Tambah**

### Lihat & Edit Note
1. Tap pada note di list
2. Atau tekan **menu (...)** → **Edit**
3. Ubah judul/konten
4. Tekan **Update**

### Hapus Note
1. Tekan **menu (...)** pada note
2. Pilih **Hapus**
3. Konfirmasi penghapusan

## Database Schema

**Table: notes**
```sql
CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  createdAt TEXT NOT NULL
)
```

## Class Model

### Note
- `id` - ID unik (auto-increment)
- `title` - Judul note
- `content` - Isi note
- `createdAt` - Waktu pembuatan (DateTime)

**Methods:**
- `toMap()` - Convert ke Map untuk database insert
- `fromMap()` - Convert dari Map database query
- `copyWith()` - Create note dengan beberapa field yang diubah

## Database Helper

**DatabaseHelper** (Singleton Pattern)
- `insertNote(Note)` - Tambah note baru → returns id
- `getNotes()` - Ambil semua notes (sorted DESC by date)
- `getNoteById(int)` - Ambil single note by id
- `updateNote(Note)` - Update note yang ada
- `deleteNote(int)` - Hapus note by id
- `deleteAllNotes()` - Hapus semua notes

## Teknologi

- **Flutter** - Framework mobile development
- **Dart** - Programming language
- **SQLite** - Local database
- **Material Design** - UI design

## Notes

- Data disimpan secara **persistent** di device
- Database otomatis dibuat di aplikasi first run
- Tidak memerlukan backend server
- Tidak memerlukan internet connection

## Snapshots : 
### Homepage :
<img width="477" height="1025" alt="image" src="https://github.com/user-attachments/assets/6bdb9dbb-9b22-4382-ba36-17a8bae1f978" />

### Login page :
<img width="478" height="1026" alt="image" src="https://github.com/user-attachments/assets/a2b33638-9f5c-4198-a9d0-e9350cd68198" />

### CRUD Page : 
<img width="473" height="1024" alt="image" src="https://github.com/user-attachments/assets/d6791c31-17dd-403e-a010-fbbc17a2281a" />

## Fitur Aplikasi
