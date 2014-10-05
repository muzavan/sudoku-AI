(defrule kurangi-9 
         ?cabut <- (angka $?a 9 $?b)
         =>
         (retract ?cabut)
         (assert (angka ?a ?b))
)

(defrule hilangkan-lagi
         ?cabut<-(angka ?a)
         (angka ?b&:(> ?b ?a))
         =>
		 (retract ?cabut)
         (assert (terjadi))
)