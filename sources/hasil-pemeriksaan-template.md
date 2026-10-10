# Hasil Pemeriksaan Template LaTeX terhadap Panduan TA MCS UGM 2026

Ketentuan acuan: [ketentuan-panduan-ta.md](ketentuan-panduan-ta.md).
File yang diperiksa: `ugmfmipa.cls`, `main.tex`, `packages/fmipabib.sty`, struktur `contents/`.

**Batasan:** pemeriksaan hanya dari membaca kode. Template belum dikompilasi dan belum dibandingkan dengan `sources/*.docx`.

## Sudah sesuai

| Aspek | Bukti |
|---|---|
| A4, margin atas dan kiri 4 cm, bawah dan kanan 3 cm | `\geometry{...}` di cls |
| Times 12 pt | `\RequirePackage{times}`, `\LoadClass[12pt]` |
| Spasi 1,5 isi; spasi 1 untuk intisari, abstract, caption, daftar pustaka | `\startmain`, `\chapterintisari`, `caption[font=singlespacing]`, `fmipabib` |
| Judul bab kapital, tebal, 14 pt, tengah, 4 cm dari atas, Romawi | `\@makechapterhead` |
| Sub bab tebal; anak sub bab tanpa nomor | `\titleformat`, `secnumdepth=2` |
| Nomor sub bab, tabel, gambar, persamaan, definisi, dan teorema `bab.urut` | `\thesection`, `\thefigure`, `\theequation`, dst. |
| Nomor halaman: awal Romawi bawah tengah; utama Arab kanan atas; judul bab bawah tengah | `\fancyfoot`, `\startmain`, `\fancypagestyle{plain}` |
| Sampul: logo 5,5 cm, nama dan NIM, urutan institusi, tahun, judul dua bahasa | `\printcover` |
| Bab 1: enam bagian | `chapter-1.tex` |
| Bab 3: empat subbab wajib | `chapter-3.tex` |
| Struktur proposal (Bab 1–4) dan tesis (Bab 1–6) | `main.tex` (`\proposalContent`, `\thesisContent`) |
| Lampiran proposal dan tesis lengkap | `main.tex`, `contents/appendix/` |
| Sitasi Harvard `(Penulis, Tahun)`; semua nama penulis di daftar | `fmipabib.sty` (`maxbibnames=99`) |
| "Anonim" untuk sumber tanpa penulis | makro `author` dan `begentry` |
| DOI tampil; urutan abjad; "diakses tanggal" | `doi=true`, `sorting=nyt`, `urldate` |
| Judul buku, nama jurnal, dan prosiding miring | `\DeclareFieldFormat` |

## Belum sesuai

| # | Masalah | Lokasi | Ketentuan | Saran perbaikan |
|---|---|---|---|---|
| 1 | Daftar isi berspasi 1,5 | `main.tex:103` | Daftar isi spasi 1 (2.2.1) | Hapus `\onehalfspacing` sebelum `\tableofcontents` |
| 2 | Judul gambar tidak tebal | `ugmfmipa.cls:130` | Judul gambar tebal (2.2.5) | `\captionsetup[figure]{font={bf,singlespacing}}` |
| 3 | Titik setelah nomor caption ("Tabel 1.1. Judul") | `ugmfmipa.cls:124` | Contoh "Tabel 4.1 Komponen…" | `labelsep=space` |
| 4 | Pustaka tesis: judul tegak, tipe miring | `fmipabib.sty:97-98` | Judul tesis miring (2.2.10) | Balik: title miring, type tegak |
| 5 | Kata hubung penulis memakai `&` | `fmipabib.sty:35` | "dan" | Ganti `and` dengan "dan" |
| 6 | Nomor algoritma tidak direset per bab, label "Algorithm" | cls (paket `algorithm`) | Algoritma bernomor per bab (2.2.6) | `\numberwithin{algorithm}{chapter}` dan `\floatname{algorithm}{Algoritma}` |
| 7 | Halaman judul tidak ada | cls dan `main.tex` | Halaman judul dengan kalimat "Diajukan untuk memenuhi…" (2.1.1) | Tambah `\printtitlepage` |
| 8 | Halaman pernyataan opsional (tesis); judul "KATA PENGANTAR" | `main.tex:84-95` | Pernyataan wajib; "Prakata" | Aktifkan untuk tesis; ubah nama |
| 9 | Abstract selalu ada di proposal | `main.tex:123-125` | Panduan 3.3.1 hanya intisari (Ringkasan: ada Abstract) | **Perlu keputusan** |
| 10 | Tidak ada subbab Landasan Teori | `chapter-2.tex` | Landasan teori dinilai di proposal (bobot 2) | **Perlu keputusan:** tambah subbab di Bab 2 |
| 11 | File sisa: `chapter-5-proposal.tex` (duplikat Bab 4), `chapter-7.tex` (duplikat Bab 6), `*.aux` di `contents/` | `contents/` | – | Hapus |
| 12 | Indentasi paragraf 1,25 cm | cls | 1,27 cm | `\parindent=1.27cm` (selisih kecil) |

## Verdict hal-hal yang belum sesuai
1. ACC
2. ACC
3. Acc
4. ACC
5. ACC
6. Acc
7. ACC
8. ACC
9. Di dua-duanya tetap ada
10. Landasan teori memang dihapus
11. Hapus file sisa
12. ACC

## Temuan tambahan (halaman pengesahan)

Pada tampilan halaman pengesahan tesis, kolom "Anggota Dewan Penguji Lain" menampilkan tanda `-`. Penyebabnya `\addexaminer` di `main.tex` masih dikomentari. Baris "Pembimbing II" juga tampak bergeser ke kolom kiri. Ini masalah tata letak, bukan pelanggaran panduan.

Perlu diingat bahwa halaman pengesahan (`\printendorsement`) bukan halaman judul. Poin 7 tetap berlaku.

## Tidak dapat diperiksa lewat kode

- Intisari maksimal 250 kata.
- Kalimat tidak diawali "maka/sehingga/sedangkan"; desimal pakai koma; judul sub bab Title Case.
- Tabel di atas dan gambar di bawah (tergantung penempatan `\caption` oleh penulis).
- Gambar dan tabel dirujuk di teks sebelum muncul.
- Isi halaman pengesahan proposal. Template memuat pembimbing saja, sedangkan panduan menyebut pembimbing dan penguji.
- Kecocokan dengan `2026-Template Proposal Tesis.docx` dan `2026-Template Laporan Tesis.docx`.
