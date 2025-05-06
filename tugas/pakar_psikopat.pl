% --------------------
% DATABASE DINAMIS
% --------------------
:- dynamic gejala_pos/1.
:- dynamic gejala_neg/1.

% --------------------
% PERTANYAAN GEJALA
% --------------------
pertanyaan(tidak_berempati, "Apakah Anda merasa sulit berempati pada orang lain?").
pertanyaan(berbohong, "Apakah Anda sering berbohong bahkan tanpa alasan jelas?").
pertanyaan(manipulatif, "Apakah Anda sering memanipulasi orang untuk keuntungan pribadi?").
pertanyaan(emosi_dingin, "Apakah Anda cenderung tidak menunjukkan emosi?").
pertanyaan(tidak_guilty, "Apakah Anda jarang merasa bersalah atas kesalahan yang Anda lakukan?").
pertanyaan(melanggar_nilai, "Apakah Anda sering melanggar aturan atau norma sosial?").
pertanyaan(tidak_tanggung_jawab, "Apakah Anda merasa sulit bertanggung jawab atas tindakan Anda?").
pertanyaan(impulsif, "Apakah Anda sering bertindak tergesa-gesa tanpa berpikir panjang?").
pertanyaan(tidak_menyesal, "Apakah Anda jarang menyesali tindakan yang menyakiti orang lain?").
pertanyaan(pesona_dangkal, "Apakah Anda sering terlihat sangat menawan di awal pertemuan tapi tidak tulus?").

% --------------------
% RELASI GEJALA - PENYAKIT
% --------------------
gejala(tidak_berempati, psikopat).
gejala(berbohong, psikopat).
gejala(manipulatif, psikopat).
gejala(emosi_dingin, psikopat).
gejala(tidak_guilty, psikopat).
gejala(melanggar_nilai, psikopat).
gejala(tidak_tanggung_jawab, psikopat).
gejala(impulsif, psikopat).
gejala(tidak_menyesal, psikopat).
gejala(pesona_dangkal, psikopat).

% --------------------
% DETEKSI PENYAKIT
% --------------------
penyakit(psikopat).

penyakit(psikopat) :-
    findall(G, gejala_pos(G), List),
    include(gejala_psikopat, List, Filtered),
    length(Filtered, Count),
    Count >= 6.

gejala_psikopat(G) :- gejala(G, psikopat).

penyakit(_) :-
    writeln("Tidak terdeteksi gangguan psikopat.").

% --------------------
% CLEAR DATABASE
% --------------------
clear_db :-
    retractall(gejala_pos(_)),
    retractall(gejala_neg(_)).
