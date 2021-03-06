(defun bubble-sort-vector (vector predicate &aux (len (1- (length vector))))
  (do ((swapped t)) ((not swapped) vector)
    (setf swapped nil)
    (do ((i (min 0 len) (1+ i))) ((eql i len))
      (when (funcall predicate (aref vector (1+ i)) (aref vector i))
        (rotatef (aref vector i) (aref vector (1+ i)))
        (setf swapped t)))))

(defun bubble-sort-list (list predicate)
  (do ((swapped t)) ((not swapped) list)
    (setf swapped nil)
    (do ((list list (rest list))) ((endp (rest list)))
      (when (funcall predicate (second list) (first list))
        (rotatef (first list) (second list))
        (setf swapped t)))))

(defun bubble-sort (sequence predicate)
  (etypecase sequence
    (list (bubble-sort-list sequence predicate))
    (vector (bubble-sort-vector sequence predicate))))
