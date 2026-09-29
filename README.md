# MundoStreamer — situs promosi

Landing page bahasa Indonesia, responsif, tanpa dependensi eksternal. Preview: http://192.168.8.101:8790.

## Pembaruan 15 September 2026

- Mempertahankan desain gelap–cyan dan ilustrasi CSS pada hero.
- Menambahkan logo asli, wallpaper, dan video standby dari Raspberry Pi MundoStreamer.
- Memperluas fitur: HDMI/playback, penyimpanan USB, branding/standby, LUT.
- Menambahkan penjelasan WebRTC, HLS, RTSP, RTMP, SRT dan FAQ.
- Video menggunakan controls, playsinline, preload=none; diputar atas tindakan pengunjung.

## Dasar informasi

Pemeriksaan baca-saja pada Raspberry Pi mundo@192.168.8.179: portal port 8000, panel port 8080, dan /home/mundo/open-streamer/web/server.py. Menu dan implementasi ditemukan; fitur rekam, playback, upload, perubahan konfigurasi, dan streaming drone tidak diaktifkan atau diuji pada sesi ini.

Sumber aset: /home/mundo/open-streamer/assets/logo.png, wallpaper.png, standby.mp4. Salinan asli dipertahankan tanpa perubahan. Teks spesifikasi yang tertanam pada artwork bukan hasil benchmark. Tidak ada klaim latensi, kompatibilitas universal, atau jaminan akselerasi hardware pada copy promosi.

## Validasi

Tautan internal, keberadaan aset, HTTP 200, MIME type, dan checksum salinan aset diperiksa. Tampilan desktop/HP dan pemutaran video di browser belum diuji secara visual.

## Preview

```sh
python3 -m http.server 8790 --bind 0.0.0.0 --directory /home/orangepi/mundostreamer-site
```

Preview bukan layanan sistem dan tidak otomatis aktif setelah reboot. Sebelum publikasi, lengkapi kontak, harga bila dibutuhkan, foto produk fisik, serta daftar perangkat/firmware yang telah diuji.
