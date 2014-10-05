;;; 5 Oktober 2014
;;; Contoh menggunakan templates dan merupakan soal pertama dari soal random yang mungkin terjadi.


;;;	==============
;;;	FACTS and SOAL
;;; ==============


(deffacts soal-1 "Contoh Soal Pertama"
	(kotak (baris 1) (kolom 1) (area 1) )
	(kotak (baris 1) (kolom 2) (area 1) )
	(kotak (baris 1) (kolom 3) (area 1) )
	(kotak (baris 1) (kolom 4) (area 2) )
	(kotak (baris 1) (kolom 5) (area 2) )
	(kotak (baris 1) (kolom 6) (area 2) (possible-value 2) )

	(kotak (baris 2) (kolom 1) (area 1) )
	(kotak (baris 2) (kolom 2) (area 1) )
	(kotak (baris 2) (kolom 3) (area 1) )
	(kotak (baris 2) (kolom 4) (area 2) )
	(kotak (baris 2) (kolom 5) (area 2) )
	(kotak (baris 2) (kolom 6) (area 2) (possible-value 4))

	(kotak (baris 3) (kolom 1) (area 3) )
	(kotak (baris 3) (kolom 2) (area 3) )
	(kotak (baris 3) (kolom 3) (area 3) )
	(kotak (baris 3) (kolom 4) (area 4) (possible-value 5))
	(kotak (baris 3) (kolom 5) (area 4) )
	(kotak (baris 3) (kolom 6) (area 4) )

	(kotak (baris 4) (kolom 1) (area 3) )
	(kotak (baris 4) (kolom 2) (area 3) (possible-value 5) )
	(kotak (baris 4) (kolom 3) (area 3) (possible-value 6))
	(kotak (baris 4) (kolom 4) (area 4) )
	(kotak (baris 4) (kolom 5) (area 4) (possible-value 3))
	(kotak (baris 4) (kolom 6) (area 4) )

	(kotak (baris 5) (kolom 1) (area 5) (possible-value 5))
	(kotak (baris 5) (kolom 2) (area 5) )
	(kotak (baris 5) (kolom 3) (area 5) )
	(kotak (baris 5) (kolom 4) (area 6) )
	(kotak (baris 5) (kolom 5) (area 6) )
	(kotak (baris 5) (kolom 6) (area 6) )

	(kotak (baris 6) (kolom 1) (area 5) )
	(kotak (baris 6) (kolom 2) (area 5) )
	(kotak (baris 6) (kolom 3) (area 5) )
	(kotak (baris 6) (kolom 4) (area 6) (possible-value 1) )
	(kotak (baris 6) (kolom 5) (area 6) )
	(kotak (baris 6) (kolom 6) (area 6) )
)