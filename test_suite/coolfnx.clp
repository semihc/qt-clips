(defclass TEST (is-a USER) (role concrete)
   (slot x (default ?NONE) (create-accessor read-write)))
(defclass SUBTEST (is-a TEST))
(defclass A (is-a USER) (role concrete))
(defclass A1 (is-a USER) (role concrete)
   (slot x (default ?NONE) (create-accessor read-write)))
(defmessage-handler A1 print-args ($?any)
  (printout t "A1: " ?any crlf)
  (if (next-handlerp) then
     (call-next-handler)))
(defclass A2 (is-a USER) (role concrete)
   (slot y (access read-only) (create-accessor ?NONE)))
(defmessage-handler A2 print-args ($?any)
  (printout t "A2: " ?any crlf)
  (if (next-handlerp) then
     (override-next-handler (subseq$ ?any 2 (length ?any)))))
(defclass B1 (is-a A1 A2))
(defmessage-handler USER print-args ($?any)
  (printout t "USER: " ?any crlf))
(defclass MY-EXTERNAL-ADDRESS (is-a EXTERNAL-ADDRESS) (role concrete)
   (slot blah (default ?NONE) (create-accessor read-write)))
(defmessage-handler MY-EXTERNAL-ADDRESS create ())
(defmessage-handler MY-EXTERNAL-ADDRESS init ()
  (init-slots))
(defmessage-handler MY-EXTERNAL-ADDRESS delete ()
  (delete-instance))
(defglobal ?*x* = 0)
(defclass JUNK (is-a USER) (role concrete)
   (multislot x (default ?NONE) (create-accessor read-write))
   (slot y (default ?NONE) (create-accessor write)))
(defmessage-handler JUNK my-put (?slot $?args)
   (put ?slot ?args))
(defmessage-handler JUNK my-get (?slot)
   (get ?slot))
(defmessage-handler JUNK my-replace (?slot ?b ?e $?args)
   (direct-mv-replace ?slot ?b ?e ?args))
(defmessage-handler JUNK my-insert (?slot ?i $?args)
   (direct-mv-insert ?slot ?i ?args))
(defmessage-handler JUNK my-delete (?slot ?b ?e)
   (direct-mv-delete ?slot ?b ?e))
(defclass WOZBANG (is-a INTEGER FLOAT) (role concrete) (slot z (create-accessor ?NONE)))
(defclass BOOGLE (is-a WOZBANG)
  (slot z (propagation no-inherit) (default ?NONE) (create-accessor write)))
(defclass COOGLE (is-a BOOGLE) (slot z (source composite) (default ?NONE) (create-accessor ?NONE)))
(defclass DOOGLE (is-a COOGLE))
