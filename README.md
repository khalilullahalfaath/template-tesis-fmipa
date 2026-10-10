# Template Tesis FMIPA UGM

**v1.6** | Template LaTeX untuk Proposal Tesis dan Tesis di Fakultas Matematika dan Ilmu Pengetahuan Alam, Universitas Gadjah Mada.

*LaTeX template for Master's Thesis Proposal and Thesis at the Faculty of Mathematics and Natural Sciences, Universitas Gadjah Mada.*

---

## Fitur / Features

- Mendukung **Proposal Tesis** (4 bab) dan **Tesis** (6 bab)
- Bilingual: Bahasa Indonesia dan English
- Sesuai dengan **Panduan Tugas Akhir MCS UGM versi 2026** (ringkasan ketentuan dan hasil pemeriksaan template ada di folder [`sources/`](sources/))
- Theorem environments (Definisi, Teorema, Lema, Akibat, Proposisi)
- Sistem sitasi Harvard (author-year) dengan biblatex
- Format bibliografi sesuai panduan FMIPA UGM
- Penomoran otomatis (gambar, tabel, persamaan per bab)
- Template lampiran lengkap (Surat Pernyataan AI, Bukti Submit Paper, dll.)

---

## Cara Penggunaan / How to Use

### 1. Clone Repository

```bash
git clone https://github.com/khalilullahalfaath/template-tesis-fmipa.git
cd template-tesis-fmipa
```

### 2. Pilih Mode / Select Mode

Edit baris `\documentclass` di `main.tex`:

```latex
% Proposal Tesis (Bahasa Indonesia)
\documentclass[proposaltesis,bahasa]{ugmfmipa}

% Proposal Tesis (English)
\documentclass[proposaltesis,english]{ugmfmipa}

% Tesis (Bahasa Indonesia)
\documentclass[tesis,bahasa]{ugmfmipa}

% Tesis (English)
\documentclass[tesis,english]{ugmfmipa}
```

### 3. Isi Informasi / Fill Information

Edit bagian `Information Input` di `main.tex`:

```latex
\author{Nama Lengkap}{NIM}
\titleind{Judul Tesis dalam Bahasa Indonesia}
\titleeng{Thesis Title in English}
\program{Nama Prodi}{Nama Koordinator}{NIP}
\departmenthead{Nama Ketua Departemen}{NIP}
\yearsubmit{2026}
\examdate{1 Januari 2026}
\addsupervisor{Nama Pembimbing 1, S.Kom., M.Cs., Ph.D.}{NIP}
\addsupervisor{Nama Pembimbing 2, S.Kom., M.Cs., Ph.D.}{NIP}
```

### 4. Compile

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Atau menggunakan `latexmk`:

```bash
latexmk -pdf main.tex
```

---

## Struktur Dokumen / Document Structure

### Proposal Tesis (4 Bab)

| Bagian | Isi |
|--------|-----|
| **Bagian Awal** | Sampul, Halaman Judul, Halaman Persetujuan, Daftar Isi, Daftar Gambar, Daftar Tabel, Intisari, Abstract |
| **Bagian Utama** | Bab 1. Pendahuluan, Bab 2. Tinjauan Pustaka, Bab 3. Metodologi Penelitian, Bab 4. Jadwal Penelitian |
| **Bagian Akhir** | Daftar Pustaka, Lampiran (Paper Referensi Utama, Surat Pernyataan Penggunaan AI) |

### Tesis (6 Bab)

| Bagian | Isi |
|--------|-----|
| **Bagian Awal** | Sampul, Halaman Judul, Halaman Pengesahan, Pernyataan Bebas Plagiasi, Prakata, Daftar Isi, Daftar Gambar, Daftar Tabel, Intisari, Abstract |
| **Bagian Utama** | Bab 1. Pendahuluan, Bab 2. Tinjauan Pustaka, Bab 3. Metodologi Penelitian, Bab 4. Implementasi, Bab 5. Hasil Penelitian dan Pembahasan, Bab 6. Kesimpulan dan Saran |
| **Bagian Akhir** | Daftar Pustaka, Lampiran (Surat Pernyataan Plagiasi, Surat Pernyataan Penggunaan AI, Bukti Submit Paper, Paper Yang di Submit, Hasil Pengecekan Similaritas) |

---

## Struktur Folder / Folder Structure

```
template-tesis-fmipa/
├── main.tex                    # Dokumen utama
├── ugmfmipa.cls                # Document class (formatting rules)
├── references.bib              # Database referensi
├── packages/
│   └── fmipabib.sty           # Style bibliografi FMIPA
├── contents/
│   ├── abstract/
│   │   ├── intisari.tex       # Intisari (Bahasa Indonesia)
│   │   └── abstract.tex       # Abstract (English)
│   ├── chapter-1/             # Bab 1: Pendahuluan
│   ├── chapter-2/             # Bab 2: Tinjauan Pustaka
│   ├── chapter-3/             # Bab 3: Metodologi Penelitian
│   ├── chapter-4/             # Bab 4: Jadwal (proposal) / Implementasi (tesis)
│   ├── chapter-5/             # Bab 5: Hasil Penelitian dan Pembahasan (tesis)
│   ├── chapter-6/             # Bab 6: Kesimpulan dan Saran (tesis)
│   ├── appendix/              # Lampiran
│   ├── dedication/            # Halaman Persembahan (opsional)
│   ├── endorsement/           # Halaman Pengesahan (PDF)
│   ├── nomenclature/          # Daftar Lambang dan Singkatan (opsional)
│   ├── preface/               # Prakata (tesis)
│   └── statement/             # Pernyataan Bebas Plagiasi (tesis)
├── sample/
│   ├── logougm.png            # Logo UGM (berwarna)
│   └── logougm-mono.png       # Logo UGM (monokrom)
└── sources/                   # Panduan resmi, template Word, ringkasan ketentuan,
                               # dan hasil pemeriksaan template
```

---

## Ketentuan yang Didukung / Supported Guidelines

| Kategori | Ketentuan |
|----------|-----------|
| **Kertas** | A4, margin atas 4cm, kiri 4cm, bawah 3cm, kanan 3cm |
| **Font** | Times 12pt, spasi 1.5 (teks utama), spasi 1 (daftar isi, intisari, caption, bibliografi) |
| **Paragraf** | Indentasi 1,27 cm |
| **Penomoran Halaman** | Romawi kecil (front matter, bawah tengah), Arab (main matter, kanan atas), bawah tengah untuk halaman judul bab |
| **Judul Bab** | Bold, 14pt, kapital, center, nomor Romawi besar |
| **Judul Section** | Bold, 12pt, Title Case, nomor Arab (1.1) |
| **Judul Subsection** | Bold, 12pt, sentence case, nomor Arab (1.1.1) |
| **Subsubsection** | Bold, 12pt, nomor Arab (1.1.1.1) |
| **Tabel** | Caption bold di atas, tanpa titik setelah nomor, nomor per bab (Tabel 4.1) |
| **Gambar** | Caption bold di bawah, tanpa titik setelah nomor, nomor per bab (Gambar 3.1) |
| **Algoritma** | Nomor per bab (Algoritma 3.1) |
| **Persamaan** | Nomor per bab dalam kurung, rata kanan (3.1) |
| **Bibliografi** | Harvard (author-year), "dan" untuk dua penulis, DOI ditampilkan, hanging indent, entri tanpa penulis ditulis "Anonim" dan diurutkan di awal |
| **Sampul dan Halaman Judul** | Logo UGM 5.5cm, judul bilingual (Indonesia + English italic); halaman judul ditambah kalimat "Diajukan untuk memenuhi salah satu syarat ..." |

---

## Halaman Opsional / Optional Pages

Halaman judul (`\printtitlepage`), pernyataan bebas plagiasi (`\chapterstatement`), dan prakata (`\chapterpreface`) sudah aktif di `main.tex`. Pernyataan dan prakata hanya tampil pada mode `tesis`; pada mode `proposaltesis` otomatis dilewati.

Halaman berikut bersifat opsional dan di-comment out secara default di `main.tex`. Uncomment jika diperlukan:

```latex
% Halaman Persembahan
\chapterdedication{contents/dedication/dedication}

% Daftar Lambang dan Singkatan
\chapternomenclature{contents/nomenclature/nomenclature}
```

---

## Theorem Environments

Template menyediakan environment untuk penulisan matematika:

```latex
\begin{definisi}
Sebuah graf $G = (V, E)$ adalah pasangan himpunan simpul $V$ dan himpunan sisi $E$.
\end{definisi}

\begin{teorema}
Untuk setiap graf $G$ dengan $n$ simpul, berlaku $|E| \leq \binom{n}{2}$.
\end{teorema}

\begin{lema} ... \end{lema}
\begin{akibat} ... \end{akibat}
\begin{proposisi} ... \end{proposisi}
\begin{proof} ... \end{proof}
```

Untuk mode English, gunakan: `theorem`, `definition`, `lemma`, `corollary`, `proposition`.

---

## Sitasi / Citation

Template ini menggunakan sistem sitasi **Harvard (author-year)** dengan biblatex. Perintah `\cite` sudah dikonfigurasi agar otomatis menghasilkan output **dengan kurung**.

### Perintah Sitasi yang Tersedia

| Perintah | Output | Keterangan |
|----------|--------|------------|
| `\cite{ross2004}` | (Ross, 2004) | Sitasi standar dengan kurung |
| `\cite{brauer2001}` | (Brauer dan Castillo-Chavez, 2001) | Dua penulis memakai "dan" |
| `\cite{ross2004, nagle2004}` | (Ross, 2004; Nagle et al., 2004) | Sitasi ganda; lebih dari dua penulis memakai "et al." |
| `\textcite{ross2004}` | Ross (2004) | Sitasi naratif (nama di luar kurung) |

### Contoh Penggunaan

```latex
% Sitasi di akhir kalimat
Deteksi objek telah berkembang pesat dalam beberapa tahun terakhir \cite{ross2004}.

% Sitasi naratif (nama penulis sebagai bagian kalimat)
Menurut \textcite{ross2004}, deteksi objek dapat dilakukan secara real-time.

% Sitasi ganda
Beberapa penelitian telah membahas topik ini \cite{ross2004, nagle2004}.
```

### Catatan Penting

- Semua referensi harus didaftarkan di file `references.bib`
- Gunakan `\cite` untuk sitasi standar (otomatis dengan kurung)
- Gunakan `\textcite` jika nama penulis menjadi bagian dari kalimat
- DOI akan otomatis ditampilkan di daftar pustaka jika tersedia di file `.bib`
- Panduan mewajibkan setiap referensi memiliki **DOI atau URL**. Entri yang tidak memiliki keduanya memunculkan peringatan saat kompilasi (`Package fmipabib Warning: Entri '...' tidak punya DOI atau URL`). Untuk menghentikan build pada kondisi ini, ganti `\PackageWarning` dengan `\PackageError` di `packages/fmipabib.sty`
- Entri tanpa penulis ditampilkan sebagai "Anonim"; artikel internet tanpa nama penulis tidak boleh disitasi menurut panduan

---

## Prasyarat / Prerequisites

- **TeX Distribution**: MiKTeX atau TeX Live (terbaru)
- **Engine**: pdfLaTeX
- **Bibliography**: Biber (backend untuk biblatex)
- **Packages**: Semua package yang dibutuhkan akan otomatis ter-install saat compile pertama kali (MiKTeX) atau sudah tersedia di TeX Live full.

---

## Kontributor / Contributors

- [Khalilullah Al Faath](https://github.com/khalilullahalfaath)
- Jeremiah Manurung

Template ini dikembangkan berdasarkan template DTETI UGM yang disesuaikan untuk FMIPA UGM.

---

## Lisensi / License

Template ini dilisensikan di bawah [MIT License](LICENSE).

---

## Changelog

### v1.6

Penyelarasan dengan **Panduan Tugas Akhir MCS UGM versi 2026**.

- Halaman judul baru (`\printtitlepage`) dengan kalimat "Diajukan untuk memenuhi salah satu syarat ..."
- Pernyataan bebas plagiasi dan prakata aktif untuk tesis; "Kata Pengantar" menjadi "Prakata"
- Daftar isi 1 spasi; judul gambar tebal; caption tanpa titik setelah nomor
- Nomor algoritma per bab; indentasi paragraf 1,27 cm
- Bibliografi: "dan" untuk dua penulis, judul tesis miring, tahun tidak ganda dan urutan "Anonim" benar, URL panjang bisa dipenggal, peringatan untuk entri tanpa DOI/URL
- Hapus file sisa `chapter-5-proposal.tex` dan `chapter-7.tex`
- Tambah `sources/` berisi ringkasan ketentuan dan hasil pemeriksaan template

Rilis v1.1 sampai v1.5 (perbaikan format sitasi dan bibliografi) dapat dilihat di halaman [Releases](https://github.com/khalilullahalfaath/template-tesis-fmipa/releases).

### v1.0 (2026-05-03)

**Initial Release** - Template yang sesuai dengan ketentuan penulisan terbaru FMIPA UGM.

- Mendukung Proposal Tesis (4 bab) dan Tesis (6 bab)
- Bilingual support (Bahasa Indonesia / English)
- Format sesuai ketentuan FMIPA UGM (margin, font, spacing, penomoran)
- Theorem environments (Definisi, Teorema, Lema, Akibat, Proposisi)
- Bibliografi Harvard style dengan DOI support
- Template lampiran lengkap sesuai ketentuan terbaru
- Contoh isi bab untuk Magister Ilmu Komputer (Computer Vision / Deep Learning)
