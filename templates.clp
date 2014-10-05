;;; 5 Oktober 2014
;;; Version 0 : Sudoku Solver
;;; Defining Templates


;;; ====================
;;;	Defining Templates
;;; ====================

(deftemplate kotak "Data yang dimiliki setiap kotak di sudoku 6x6"
	(slot baris			; Baris ke berapa
		(type INTEGER)	
	)

	(slot kolom			; Kolom ke berapa
		(type INTEGER)
	)

	(slot area			; group ke berapa 1 adalah yang paling pojok kiri atas, 6 adalah pojok kiri bawah, urutan ke samping
		(type INTEGER)
	)

	(multislot possible-value
		(type INTEGER)
		(default 1 2 3 4 5 6 7 8 9)
	)
)

(deftemplate impossible "Rincian angka yang tidak mungkin di baris dan kolom tertentu"
	(slot baris
		(type INTEGER)
	)

	(slot kolom
		(type INTEGER)
	)

	(multislot non-possible
		(type INTEGER)
	 )	
)