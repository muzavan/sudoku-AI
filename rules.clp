;;; 5 Oktober 2014
;;; Version 0 : Sudoku Solver
;;; Defining Rules


;;; ====================
;;;	Defining Rules
;;; ====================

(defrule cek-kolom "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara kolom"
	(declare (salience 10))
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris2&:(<> ?baris1 ?baris2)) (kolom ?kolom1) (area ?area2) (possible-value $?pos11 ?pos1 $?pos12))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris2) (kolom ?kolom1) (area ?area2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek kolom antara " ?baris1 " " ?kolom1 " dan " ?baris2 " " ?kolom1 crlf)
)

(defrule cek-baris "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara kolom"
	(declare (salience 20))
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris1) (kolom ?kolom2&:(<> ?kolom1 ?kolom2)) (area ?area2) (possible-value $?pos11 ?pos1 $?pos12))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris1) (kolom ?kolom2) (area ?area2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek baris antara " ?baris1 " " ?kolom1 " dan " ?baris1 " " ?kolom2 crlf)
)

(defrule cek-area "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara kolom"
	(declare (salience 30))
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris2) (kolom ?kolom2) (area ?area1) (possible-value $?pos11 ?pos1 $?pos12)) ; Masih Salah
	(test (not (and (eq ?baris1 ?baris2)(eq ?kolom1 ?kolom2))))
  	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris2) (kolom ?kolom2) (area ?area1) (possible-value ?pos11 ?pos12)))
	(printout t "Cek area antara " ?baris1 " " ?kolom1 " dan " ?baris2 " " ?kolom2 crlf)
)

(defrule solved "Mengecek apakah sudah menemui nilai yang cocok, dilihat dari banyaknya kemungkinan jumlah value"
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (possible-value ?pos1))
	=>
	(assert (is-solved ?baris1 ?kolom1))
)

(defrule all-solved "Mengecek apakah sudah menemui nilai yang cocok, dilihat dari banyaknya kemungkinan jumlah value"
	(is-solved 1 1) (is-solved 1 2) (is-solved 1 3) (is-solved 1 4) (is-solved 1 5) (is-solved 1 6)
	(is-solved 2 1) (is-solved 2 2) (is-solved 2 3) (is-solved 2 4) (is-solved 2 5) (is-solved 2 6)
	(is-solved 3 1) (is-solved 3 2) (is-solved 3 3) (is-solved 3 4) (is-solved 3 5) (is-solved 3 6)
	(is-solved 4 1) (is-solved 4 2) (is-solved 4 3) (is-solved 4 4) (is-solved 4 5) (is-solved 4 6)
	(is-solved 5 1) (is-solved 5 2) (is-solved 5 3) (is-solved 5 4) (is-solved 5 5) (is-solved 5 6)
	(is-solved 6 1) (is-solved 6 2) (is-solved 6 3) (is-solved 6 4) (is-solved 6 5) (is-solved 6 6) 
	=>
	(assert (selesai))
	(printout t "Selesai!" crlf)
)

