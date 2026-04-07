# CRUD Notes App - Implementation Guide

## 📱 Aplikasi Overview

Ini adalah aplikasi Notes sederhana yang menggunakan **SQLite** untuk menyimpan data secara lokal di device.

### Fitur Utama:
- ✅ **Tambah Note** - Buat catatan baru
- ✅ **Lihat Semua Notes** - Tampilkan dalam list dengan sorting
- ✅ **Edit Note** - Ubah judul dan konten
- ✅ **Hapus Note** - Dengan konfirmasi
- ✅ **Timestamp** - Setiap note punya waktu pembuatan

---

## 🏗️ Arsitektur Project

### File Structure
```
lib/
├── main.dart                 # Entry point
├── models/
│   └── note.dart            # Data model
├── database/
│   └── database_helper.dart # Database operations
└── screens/
    ├── home_screen.dart           # Main screen (list)
    └── add_edit_note_screen.dart  # Input form
```

---

## 💾 Database Layer

### DatabaseHelper (Singleton)
Menggunakan **Singleton Pattern** untuk memastikan hanya ada 1 instance database:

```dart
final dbHelper = DatabaseHelper();
```

### CRUD Operations

#### 1. CREATE (Tambah)
```dart
Note note = Note(
  title: 'Judul',
  content: 'Konten',
  createdAt: DateTime.now(),
);
await dbHelper.insertNote(note);
```

#### 2. READ (Baca)
```dart
// Semua notes
List<Note> notes = await dbHelper.getNotes();

// Single note
Note? note = await dbHelper.getNoteById(id);
```

#### 3. UPDATE (Ubah)
```dart
Note updatedNote = note.copyWith(
  title: 'Judul Baru',
  content: 'Konten Baru',
);
await dbHelper.updateNote(updatedNote);
```

#### 4. DELETE (Hapus)
```dart
await dbHelper.deleteNote(id);
```

---

## 🎨 UI Components

### HomeScreen
- **AppBar** - Judul "My Notes"
- **FAB (Floating Action Button)** - Untuk tambah note baru
- **ListView** - Menampilkan semua notes
- **Card** - Setiap note dalam kartu cantik
- **PopupMenu** - Edit dan Delete options

### AddEditNoteScreen
- **TextField** - Input judul
- **Expanded TextField** - Input konten (lebih besar)
- **Save Button** - Tombol Tambah/Update
- **Validation** - Title dan content tidak boleh kosong

---

## 📊 Data Model

### Note Class

```dart
class Note {
  final int? id;           // Auto-increment
  final String title;      // Judul catatan
  final String content;    // Isi catatan
  final DateTime createdAt; // Waktu buat
}
```

**Methods:**
- `toMap()` → Convert ke Map untuk database
- `fromMap()` → Convert dari database ke Note object
- `copyWith()` → Create instance baru dengan beberapa field diubah

---

## 🔄 Data Flow

### Menambah Note:
1. User tekan FAB **+**
2. Navigate ke **AddEditNoteScreen**
3. User input judul & konten
4. Tekan **Tambah**
5. `DatabaseHelper.insertNote()` → database
6. Navigator.pop() → kembali ke HomeScreen
7. `refreshNotes()` → reload list dari database

### Mengupdate Note:
1. User tekan **Edit** dari menu
2. Navigate ke **AddEditNoteScreen** dengan note data
3. Form prefilled dengan data note lama
4. User ubah judul/konten
5. Tekan **Update**
6. `DatabaseHelper.updateNote()` → database
7. Kembali & refresh list

### Menghapus Note:
1. User tekan **Hapus** dari menu
2. Konfirmasi dialog muncul
3. Jika confirm → `DatabaseHelper.deleteNote()`
4. Refresh list

---

## 🗄️ Database Schema

```sql
CREATE TABLE notes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  createdAt TEXT NOT NULL
)
```

**Penjelasan:**
- `id` - Primary key, auto-increment
- `title` - Judul (required)
- `content` - Isi catatan (required)
- `createdAt` - ISO8601 string format datetime

---

## 📝 Key Implementation Details

### 1. Singleton Database
```dart
factory DatabaseHelper() {
  return _instance;
}
```
Memastikan hanya 1 koneksi database di seluruh app.

### 2. Null Safety
```dart
Future<Note?> getNoteById(int id) async {
  // Bisa return null jika tidak ditemukan
}
```

### 3. Error Handling
```dart
if (titleController.text.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(...);
  return;
}
```

### 4. Context Management
```dart
if (!mounted) return;
ScaffoldMessenger.of(context).showSnackBar(...);
```
Prevent setState/navigation jika widget sudah dispose.

### 5. Date Formatting
```dart
import 'package:intl/intl.dart';

final formatted = DateFormat('dd MMM yyyy, HH:mm')
  .format(note.createdAt);
```

---

## 🚀 Running the App

### Requirements
- Flutter SDK installed
- Emulator atau device

### Steps
```bash
# 1. Install dependencies
flutter pub get

# 2. Run app
flutter run

# 3. (Optional) Build release APK
flutter build apk --release
```

---

## 📚 Dependencies Explanation

| Package | Purpose |
|---------|---------|
| `sqflite` | SQLite database untuk Flutter |
| `path` | File path management |
| `intl` | Internationalization & date formatting |

---

## 🐛 Testing Checklist

- [ ] Install dan run berhasil
- [ ] Bisa tambah note baru
- [ ] Note muncul di list
- [ ] Bisa edit note (title/content berubah)
- [ ] Bisa delete note (confirm dialog)
- [ ] Data persist setelah close app
- [ ] Timestamp berfungsi dengan benar
- [ ] List sorted dari terbaru ke terlama

---

## 💡 Possible Enhancements

- [ ] Search functionality
- [ ] Color tags/categories
- [ ] Pin favorite notes
- [ ] Export notes to PDF/CSV
- [ ] Dark mode
- [ ] Cloud sync
- [ ] Rich text editor
- [ ] Sharing notes

---

## 📖 Learning Resources

- [Flutter Documentation](https://flutter.dev)
- [SQLite in Flutter](https://pub.dev/packages/sqflite)
- [Dart Null Safety](https://dart.dev/null-safety)

---

**Happy Coding! 🎉**
