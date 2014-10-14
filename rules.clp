;;; 5 Oktober 2014
;;; Version 0 : Sudoku Solver
;;; Defining Rules


;;; ====================
;;;	Defining Rules
;;; ====================

(defrule cek-kolom "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara kolom"
	(declare (salience 10))
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (id ?id) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris2&:(<> ?baris1 ?baris2)) (kolom ?kolom1) (area ?area2) (id ?id2) (possible-value $?pos11 ?pos1 $?pos12))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris2) (kolom ?kolom1) (area ?area2) (id ?id2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek kolom antara " ?baris1 " " ?kolom1 " dan " ?baris2 " " ?kolom1 crlf)
)

(defrule cek-diagonal1 "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara diagonal kiri atas, antar nomor kolom dan baris yang sama"
	(declare (salience 10))
	(kotak (baris ?baris1) (kolom ?kolom1&:(= ?kolom1 ?baris1)) (area ?area1) (id ?id) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris2&:(<> ?baris2 ?baris1)) (kolom ?kolom2&:(= ?kolom2 ?baris2)) (area ?area2) (id ?id2) (possible-value $?pos11 ?pos1 $?pos12))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris2) (kolom ?kolom2) (area ?area2) (id ?id2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek diagonal kiri atas antara " ?baris1 " " ?kolom1 " dan " ?baris2 " " ?kolom2 crlf)
)

(defrule cek-diagonal2 "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara diagonal kanan atas"
	(declare (salience 10))
	(pasangan ?b ?k)
	(pasangan ?b2 ?k2)
	(kotak (baris ?b) (kolom ?k) (area ?area1) (id ?id) (possible-value ?pos1))
	?cabut <- (kotak (baris ?b2&~?b) (kolom ?k2&~?k) (area ?area2) (id ?id2) (possible-value $?pos11 ?pos1 $?pos12))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?b2) (kolom ?k2) (area ?area2) (id ?id2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek diagonal kanan atas antara " ?b " " ?k " dan " ?b2 " " ?k2 crlf)
)

(defrule cek-baris "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara kolom"
	(declare (salience 10))
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris1) (kolom ?kolom2&:(<> ?kolom1 ?kolom2)) (area ?area2) (id ?id2) (possible-value $?pos11 ?pos1 $?pos12))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris1) (kolom ?kolom2) (area ?area2) (id ?id2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek baris antara " ?baris1 " " ?kolom1 " dan " ?baris1 " " ?kolom2 crlf)
)

(defrule cek-area "Mengubah nilai possible-value dari masing-masing kotak, diperiksa secara area"
	(declare (salience 10))
	(kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (id ?id) (possible-value ?pos1))
	?cabut <- (kotak (baris ?baris2) (kolom ?kolom2) (area ?area1) (id ?id2&~?id) (possible-value $?pos11 ?pos1 $?pos12)) ; Masih Salah
  	=>
	(retract ?cabut)
	(assert (kotak (baris ?baris2) (kolom ?kolom2) (area ?area1) (id ?id2) (possible-value ?pos11 ?pos12)))
	(printout t "Cek area antara " ?baris1 " " ?kolom1 " dan " ?baris2 " " ?kolom2 crlf)
)

(defrule cek-satu-nilai-area
	(declare (salience -5))
	?cabut <- (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value $?pos11 ?pos1 $?pos12))
	(not (kotak (baris ?b2) (kolom ?k2) (area ?a) (id ?id2&~?id) (possible-value $?pos21 ?pos1 $?pos22)))
	(not (is-solved ?b ?k))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value ?pos1)))
	(printout t "Cek satu nilai area baris " ?b " kolom " ?k crlf)
)

(defrule cek-satu-nilai-baris
	(declare (salience -5))
	?cabut <- (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value $?pos11 ?pos1 $?pos12))
	(not (kotak (baris ?b) (kolom ?k2) (area ?a2) (id ?id2&~?id) (possible-value $?pos21 ?pos1 $?pos22)))
	(not (is-solved ?b ?k))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value ?pos1)))
	(printout t "Cek satu nilai baris baris " ?b " kolom " ?k crlf)
)

(defrule cek-satu-nilai-kolom
	(declare (salience -5))
	?cabut <- (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value $?pos11 ?pos1 $?pos12))
	(not (kotak (baris ?b2) (kolom ?k) (area ?a2) (id ?id2&~?id) (possible-value $?pos21 ?pos1 $?pos22)))
	(not (is-solved ?b ?k))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value ?pos1)))
	(printout t "Cek satu nilai kolom baris " ?b " kolom " ?k crlf)
)

(defrule cek-satu-nilai-diagonal1
	(declare (salience -5))
	?cabut <- (kotak (baris ?b) (kolom ?k&:(= ?k ?b)) (area ?a) (id ?id) (possible-value $?pos11 ?pos1 $?pos12))
	(not (kotak (baris ?b2&~?b) (kolom ?k2&:(= ?k2 ?b2)) (area ?a2) (id ?id2) (possible-value $?pos21 ?pos1 $?pos22)))
	(not (is-solved ?b ?k))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value ?pos1)))
	(printout t "Cek satu nilai diagonal1 baris " ?b " kolom " ?k crlf)
)

(defrule cek-satu-nilai-diagonal2
	(declare (salience -5))
	(pasangan ?b ?k)
	(pasangan ?b2 ?k2)
	?cabut <- (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value $?pos11 ?pos1 $?pos12))
	(not (kotak (baris ?b2&~?b) (kolom ?k2&~?k) (area ?a2) (id ?id2) (possible-value $?pos21 ?pos1 $?pos22)))
	(not (is-solved ?b ?k))
	=>
	(retract ?cabut)
	(assert (kotak (baris ?b) (kolom ?k) (area ?a) (id ?id) (possible-value ?pos1)))
	(printout t "Cek satu nilai diagonal2 baris " ?b " kolom " ?k crlf)
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

(defrule dapetin-id-value
	(declare (salience -10))
	(selesai)
	?cabut <- (kotak (baris ?baris1) (kolom ?kolom1) (area ?area1) (id ?id1) (possible-value ?pos1))
	=>
	(retract ?cabut)
	(assert (id-ke ?id1 ?pos1))
)

(
(defrule hapus-selesai
	(declare (salience -11))
	?cabut <- (selesai)
	=>
	(retract ?cabut)
)

(defrule hapus-is-solved
	(declare (salience -12))
	?cabut <- (is-solved ?a ?b)
	=>
	(retract ?cabut)
)

(defrule hapus-pasangan
	(declare (salience -13))
	?cabut <- (pasangan ?a ?b)
	=>
	(retract ?cabut)
)

(defrule dapetin-nilai
	?cabut1 <- (id-ke 1 ?pos1)
	?cabut2 <- (id-ke 2 ?pos2)
	?cabut3 <- (id-ke 3 ?pos3)
	?cabut4 <- (id-ke 4 ?pos4)
	?cabut5 <- (id-ke 5 ?pos5)
	?cabut6 <- (id-ke 6 ?pos6)
	?cabut7 <- (id-ke 7 ?pos7)
	?cabut8 <- (id-ke 8 ?pos8)
	?cabut9 <- (id-ke 9 ?pos9)
	?cabut10 <- (id-ke 10 ?pos10)
	?cabut11 <- (id-ke 11 ?pos11)
	?cabut12 <- (id-ke 12 ?pos12)
	?cabut13<- (id-ke 13 ?pos13)
	?cabut14 <- (id-ke 14 ?pos14)
	?cabut15 <- (id-ke 15 ?pos15)
	?cabut16 <- (id-ke 16 ?pos16)
	?cabut17 <- (id-ke 17 ?pos17)
	?cabut18 <- (id-ke 18 ?pos18)
	?cabut19 <- (id-ke 19 ?pos19)
	?cabut20 <- (id-ke 20 ?pos20)
	?cabut21 <- (id-ke 21 ?pos21)
	?cabut22 <- (id-ke 22 ?pos22)
	?cabut23 <- (id-ke 23 ?pos23)
	?cabut24 <- (id-ke 24 ?pos24)
	?cabut25 <- (id-ke 25 ?pos25)
	?cabut26 <- (id-ke 26 ?pos26)
	?cabut27 <- (id-ke 27 ?pos27)
	?cabut28 <- (id-ke 28 ?pos28)
	?cabut29 <- (id-ke 29 ?pos29)
	?cabut30 <- (id-ke 30 ?pos30)
	?cabut31 <- (id-ke 31 ?pos31)
	?cabut32 <- (id-ke 32 ?pos32)
	?cabut33 <- (id-ke 33 ?pos33)
	?cabut34 <- (id-ke 34 ?pos34)
	?cabut35 <- (id-ke 35 ?pos35)
	?cabut36 <- (id-ke 36 ?pos36)
	=>
	(retract ?cabut1)
	(retract ?cabut2)
	(retract ?cabut3)
	(retract ?cabut4)
	(retract ?cabut5)
	(retract ?cabut6)
	(retract ?cabut7)
	(retract ?cabut8)
	(retract ?cabut9)
	(retract ?cabut10)
	(retract ?cabut12)
	(retract ?cabut13)
	(retract ?cabut14)
	(retract ?cabut15)
	(retract ?cabut16)
	(retract ?cabut17)
	(retract ?cabut18)
	(retract ?cabut19)
	(retract ?cabut20)
	(retract ?cabut11)
	(retract ?cabut21)
	(retract ?cabut22)
	(retract ?cabut23)
	(retract ?cabut24)
	(retract ?cabut25)
	(retract ?cabut26)
	(retract ?cabut27)
	(retract ?cabut28)
	(retract ?cabut29)
	(retract ?cabut30)
	(retract ?cabut31)
	(retract ?cabut32)
	(retract ?cabut33)
	(retract ?cabut34)
	(retract ?cabut35)
	(retract ?cabut36)
	(assert (solusi ?pos1 ?pos2 ?pos3 ?pos4 ?pos5 ?pos6 ?pos7 ?pos8 ?pos9 ?pos10 ?pos11 ?pos12 ?pos13 ?pos14 ?pos15 ?pos16 ?pos17 ?pos18 ?pos18 ?pos20 ?pos21 ?pos22 ?pos23 ?pos24 ?pos25 ?pos26 ?pos27 ?pos28 ?pos29 ?pos30 ?pos31 ?pos32 ?pos33 ?pos34 ?pos35 ?pos36))
)
(deffacts no-pas "pasangan baris kolom diagonal kedua"
	(pasangan 1 6)
	(pasangan 2 5)
	(pasangan 3 4)
	(pasangan 4 3)
	(pasangan 5 2)
	(pasangan 6 1)
)


































