;;; 5 Oktober 2014
;;; Contoh menggunakan templates dan merupakan soal pertama dari soal random yang mungkin terjadi.


;;;	==============
;;;	FACTS and SOAL
;;; ==============


(deffacts test-case-1 "Test Case 1"
	(kotak (baris 1) (kolom 1) (area 1) (id 1))
	(kotak (baris 1) (kolom 2) (area 1) (id 2))
	(kotak (baris 1) (kolom 3) (area 1) (id 3))
	(kotak (baris 1) (kolom 4) (area 2) (id 4))
	(kotak (baris 1) (kolom 5) (area 2) (id 5))
	(kotak (baris 1) (kolom 6) (area 2) (id 6) (possible-value 2))

	(kotak (baris 2) (kolom 1) (area 1) (id 7))
	(kotak (baris 2) (kolom 2) (area 1) (id 8))
	(kotak (baris 2) (kolom 3) (area 1) (id 9))
	(kotak (baris 2) (kolom 4) (area 2) (id 10))
	(kotak (baris 2) (kolom 5) (area 2) (id 11))
	(kotak (baris 2) (kolom 6) (area 2) (id 12) (possible-value 4))

	(kotak (baris 3) (kolom 1) (area 3) (id 13))
	(kotak (baris 3) (kolom 2) (area 3) (id 14))
	(kotak (baris 3) (kolom 3) (area 3) (id 15))
	(kotak (baris 3) (kolom 4) (area 4) (id 16) (possible-value 5))
	(kotak (baris 3) (kolom 5) (area 4) (id 17))
	(kotak (baris 3) (kolom 6) (area 4) (id 18))

	(kotak (baris 4) (kolom 1) (area 3) (id 19))
	(kotak (baris 4) (kolom 2) (area 3) (id 20) (possible-value 5))
	(kotak (baris 4) (kolom 3) (area 3) (id 21) (possible-value 6))
	(kotak (baris 4) (kolom 4) (area 4) (id 22))
	(kotak (baris 4) (kolom 5) (area 4) (id 23) (possible-value 3))
	(kotak (baris 4) (kolom 6) (area 4) (id 24))

	(kotak (baris 5) (kolom 1) (area 5) (id 25) (possible-value 5))
	(kotak (baris 5) (kolom 2) (area 5) (id 26))
	(kotak (baris 5) (kolom 3) (area 5) (id 27))
	(kotak (baris 5) (kolom 4) (area 6) (id 28))
	(kotak (baris 5) (kolom 5) (area 6) (id 29))
	(kotak (baris 5) (kolom 6) (area 6) (id 30))

	(kotak (baris 6) (kolom 1) (area 5) (id 31))
	(kotak (baris 6) (kolom 2) (area 5) (id 32))
	(kotak (baris 6) (kolom 3) (area 5) (id 33))
	(kotak (baris 6) (kolom 4) (area 6) (id 34) (possible-value 1))
	(kotak (baris 6) (kolom 5) (area 6) (id 35))
	(kotak (baris 6) (kolom 6) (area 6) (id 36))
)

